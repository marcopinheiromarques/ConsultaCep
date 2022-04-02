unit uApiGenerica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, REST.JSON, Generics.Collections, JSON,
  System.IOUtils, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, REST.Client, uIApiCep, uEndereco;


type
  TApiGenerica = class abstract(TInterfacedObject, IApiCep)

    private

    protected
      FRESTClient   : TRESTClient;
      FRESTRequest  : TRESTRequest;
      FRESTResponse : TRESTResponse;
      FUrl          : string;
      FStatusCode   : Integer;

      function getDadosCep<T : class, constructor>() : T;
      function RetornaDadosCep(pCep: string) : TEndereco; virtual; abstract;
    public
      property StatusCode : integer read FStatusCode;
  end;


implementation

{ TApiGenerica }

function TApiGenerica.getDadosCep<T>: T;
var
  vjValue     : TJSONValue;
begin
  self.FRESTClient   := TRESTClient  .Create(nil);
  self.FRESTRequest  := TRESTRequest .Create(nil);
  self.FRESTResponse := TRESTResponse.Create(nil);

  self.FRESTRequest.Client   := self.FRESTClient;
  self.FRESTRequest.Response := self.FRESTResponse;
  self.FRESTClient.BaseURL   := self.FUrl;

  try
    try
      self.FRESTRequest.Execute;
      self.FStatusCode := self.FRESTResponse.StatusCode;
      vjValue          := self.FRESTResponse.JSONValue;
      Result           := TJSON.JsonToObject<T>(vjValue.ToString);
    except
      on E : Exception do
      begin
        self.FStatusCode := self.FRESTResponse.StatusCode;
        vjValue          := self.FRESTResponse.JSONValue;
        Result           := TJSON.JsonToObject<T>(vjValue.ToString);
      end;
    end;
  finally
    if Assigned(self.FRESTClient) then
      FreeAndNil(self.FRESTClient);

    if Assigned(self.FRESTRequest) then
      FreeAndNil(self.FRESTRequest);

    if Assigned(self.FRESTResponse) then
      FreeAndNil( self.FRESTResponse);
  end;

end;

end.

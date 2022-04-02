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

      function getDadosCep<T : class, constructor>() : T;
      function RetornaDadosCep(pCep: string) : TEndereco; virtual; abstract;
    public

  end;


implementation

{ TApiGenerica }



{ TApiGenerica }

function TApiGenerica.getDadosCep<T>: T;
var
  jValue  : TJSONValue;
begin
  self.FRESTClient   := TRESTClient  .Create(nil);
  self.FRESTRequest  := TRESTRequest .Create(nil);
  self.FRESTResponse := TRESTResponse.Create(nil);

  self.FRESTRequest.Client   := self.FRESTClient;
  self.FRESTRequest.Response := self.FRESTResponse;
  self.FRESTClient.BaseURL   := self.FUrl;

  try

    self.FRESTRequest.Execute;
    jValue := self.FRESTResponse.JSONValue;
    Result := TJSON.JsonToObject<T>(jValue.ToString);

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

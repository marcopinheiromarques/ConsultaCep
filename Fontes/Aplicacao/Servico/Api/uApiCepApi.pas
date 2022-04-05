unit uApiCepApi;

interface

uses uApiGenerica, uEndereco, System.SysUtils;

type
  TApiCepApiData = class

    private
      Fstatus     : integer;
      Fok         : boolean;
      Fcode       : string;
      Fstate      : string;
      Fcity       : string;
      Fdistrict   : string;
      Faddress    : string;
      FstatusText : string;
      Fmessage    : string;

    protected

    public
      property status     : integer read Fstatus     write Fstatus;
      property ok         : boolean read Fok         write Fok;
      property code       : string  read Fcode       write Fcode;
      property state      : string  read Fstate      write Fstate;
      property city       : string  read Fcity       write Fcity;
      property district   : string  read Fdistrict   write Fdistrict;
      property address    : string  read Faddress    write Faddress;
      property statusText : string  read FstatusText write FstatusText;
      property message    : string  read Fmessage    write Fmessage;
  end;


type
  TApiCepApi = class(TApiGenerica)

    private

    protected

    public
      function RetornaDadosCep(pCep: string) : TEndereco; override;

      constructor Create;
  end;



implementation

{ TApiCepApi }

constructor TApiCepApi.Create;
begin
  self.FUrl := 'https://ws.apicep.com/cep/';
end;

function TApiCepApi.RetornaDadosCep(pCep: string): TEndereco;
var
  vdadosApi : TApiCepApiData;
begin
  Result    := nil;
  self.FUrl := self.FUrl + pCep + '.json';

  try
    vdadosApi := self.getDadosCep<TApiCepApiData>();

    if (vdadosApi <> nil) then
    begin
      if (vdadosApi.status = 200) then
      begin
        Result            := TEndereco.Create;
        Result.Cep        := vdadosApi.Fcode;
        Result.Logradouro := vdadosApi.address;
        Result.Bairro     := vdadosApi.district;
        Result.Cidade     := vdadosApi.city;
        Result.Estado     := vdadosApi.state;
      end
      else if (vdadosApi.status = 404) then
           begin
             raise Exception.Create(vdadosApi.message);
           end;
    end;
  except
    on E : Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.

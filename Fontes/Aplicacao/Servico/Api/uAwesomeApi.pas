unit uAwesomeApi;

interface

uses uApiGenerica, uEndereco, System.SysUtils;

type
  TAwesomeApiData = class

    private
      Fcep          : string;
      Faddress_type : string;
      Faddress_name : string;
      Faddress      : string;
      Fstate        : string;
      Fdistrict     : string;
      Flat          : string;
      Flng          : string;
      Fcity         : string;
      Fcity_ibge    : string;
      Fddd          : string;
    protected

    public
      property cep          : string read Fcep          write Fcep;
      property address_type : string read Faddress_type write Faddress_type;
      property address_name : string read Faddress_name write Faddress_name;
      property address      : string read Faddress      write Faddress;
      property state        : string read Fstate        write Fstate;
      property district     : string read Fdistrict     write Fdistrict;
      property lat          : string read Flat          write Flat;
      property lng          : string read Flng          write Flng;
      property city         : string read Fcity         write Fcity;
      property city_ibge    : string read Fcity_ibge    write Fcity_ibge;
      property ddd          : string read Fddd          write Fddd;
  end;


type
  TAwesomeApi = class(TApiGenerica)

    private

    protected

    public
      function RetornaDadosCep(pCep: string) : TEndereco; override;

      constructor Create;
  end;


implementation

{ TAwesomeApi }

constructor TAwesomeApi.Create;
begin
  self.FUrl := 'https://cep.awesomeapi.com.br/json/';
end;

function TAwesomeApi.RetornaDadosCep(pCep: string): TEndereco;
var
  vdadosApi : TAwesomeApiData;
  vCep      : string;
begin
  Result    := nil;
  vCep      := StringReplace(Trim(pCep), '-', '', [rfReplaceAll, rfIgnoreCase]);
  self.FUrl := self.FUrl + vCep;

  try
    vdadosApi := self.getDadosCep<TAwesomeApiData>();

    if (vdadosApi <> nil) then
    begin
      Result            := TEndereco.Create;
      Result.Cep        := vdadosApi.cep;
      Result.Logradouro := vdadosApi.address;
      Result.Bairro     := vdadosApi.district;
      Result.Cidade     := vdadosApi.city;
      Result.Estado     := vdadosApi.state;
    end;
  except
    on E : Exception do
    begin

    end;
  end;
end;

end.

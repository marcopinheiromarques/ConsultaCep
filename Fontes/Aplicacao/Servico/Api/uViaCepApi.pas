unit uViaCepApi;

interface

uses uApiGenerica, uEndereco, System.SysUtils;

type
  TViaCepData = class

    private
      Fcep         : string;
      Flogradouro  : string;
      Fcomplemento : string;
      Fbairro      : string;
      Flocalidade  : string;
      Fuf          : string;
      Fibge        : string;
      Fgia         : string;
      Fddd         : string;
      Fsiafi       : string;

    protected

    public
      property cep         : string read Fcep         write Fcep;
      property logradouro  : string read Flogradouro  write Flogradouro;
      property complemento : string read Fcomplemento write Fcomplemento;
      property bairro      : string read Fbairro      write Fbairro;
      property localidade  : string read Flocalidade  write Flocalidade;
      property uf          : string read Fuf          write Fuf;
      property ibge        : string read Fibge        write Fibge;
      property gia         : string read Fgia         write Fgia;
      property ddd         : string read Fddd         write Fddd;
      property siafi       : string read Fsiafi       write Fsiafi;
    end;


type
  TViaCepApi = class(TApiGenerica)

    private

    protected

    public
      function RetornaDadosCep(pCep: string) : TEndereco; override;

      constructor Create;
  end;

implementation


{ TViaCepApi }

constructor TViaCepApi.Create;
begin
  self.FUrl := 'https://viacep.com.br/ws/';
end;

function TViaCepApi.RetornaDadosCep(pCep: string): TEndereco;
var
  vdadosApi : TViaCepData;
  vCep      : string;
begin
  Result     := nil;
  vCep       := StringReplace(Trim(pCep), '-', '', [rfReplaceAll, rfIgnoreCase]);
  self.FUrl  := self.FUrl + vCep + '/json/';

  try
    //raise Exception.Create('Error Message');

    vdadosApi  := self.getDadosCep<TViaCepData>();

    if (vdadosApi <> nil) then
    begin
      Result            := TEndereco.Create;
      Result.Cep        := vdadosApi.cep;
      Result.Logradouro := vdadosApi.logradouro;
      Result.Bairro     := vdadosApi.bairro;
      Result.Cidade     := vdadosApi.localidade;
      Result.Estado     := vdadosApi.uf;
    end;
  except
    on E : Exception do
    begin

    end;
  end;
end;

end.

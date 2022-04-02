unit uConsultaCepService;

interface

uses System.SysUtils, uEndereco, uIApiCep, uFactoryApiCep;

type
   TConsultaCepService = class

    private
       FApiCep        : IApiCep;
       FFactoryApiCep : TFactoryApiCep;
    protected

    public
      function getDadosCep(pCep : string) : TEndereco;
  end;

implementation

{ TConsultaCepService }

function TConsultaCepService.getDadosCep(pCep: string): TEndereco;
begin
  Result              := nil;
  self.FFactoryApiCep := TFactoryApiCep.Create;
  self.FApiCep        := self.FFactoryApiCep.getApiCepService(taViaCep);

  try
    try
      Result := self.FApiCep.RetornaDadosCep(pCep);

      if (Result = nil) then
      begin
        self.FApiCep := self.FFactoryApiCep.getApiCepService(taApiCep);
        Result       := self.FApiCep.RetornaDadosCep(pCep);
      end;

      if (Result = nil) then
      begin
        self.FApiCep := self.FFactoryApiCep.getApiCepService(taAwesomeApi);
        Result       := self.FApiCep.RetornaDadosCep(pCep);
      end;

    except
       on E : Exception do
       begin
         raise Exception.Create('Não foi possível obter os dados do cep: ' + e.Message);
       end;
    end;
  finally
    if Assigned(self.FApiCep) then
      self.FApiCep := nil;

    if Assigned(self.FFactoryApiCep) then
     FreeAndNil(self.FFactoryApiCep);
  end;
end;

end.

unit uFactoryApiCep;

interface

uses uIApiCep, uViaCepApi, uApiCepApi, uAwesomeApi, System.SysUtils;

type
  TApi = (taViaCep, taApiCep, taAwesomeApi);

type
  TFactoryApiCep = class

    private
      FViaCepApi  : TViaCepApi;
      FApiCepApi  : TApiCepApi;
      FAwesomeApi : TAwesomeApi;
    protected

    public
      function getApiCepService(pTipoApi : TApi) : IApiCep;
  end;


implementation

{ TFactoryApiCep }

function TFactoryApiCep.getApiCepService(pTipoApi: TApi): IApiCep;
begin
  case Ord(pTipoApi) of
    0: begin
       self.FViaCepApi := TViaCepApi.Create;
       Result          := self.FViaCepApi;
    end;
    1: begin
       self.FApiCepApi := TApiCepApi.Create;
       Result          := self.FApiCepApi;
    end;
    2: begin
       self.FAwesomeApi := TAwesomeApi.Create;
       Result           := self.FAwesomeApi;
    end;
    else
    begin
      self.FViaCepApi := TViaCepApi.Create;
      Result          := self.FViaCepApi;
    end;
  end;
end;

end.

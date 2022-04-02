unit uEnderecoController;

interface

uses System.SysUtils, uEndereco, uConsultaCepService, uIFrmEndereco, uMensagens;

type
  TEnderecoController = class

    private
      FEndereco           : TEndereco;
      FConsultaCepService : TConsultaCepService;
    protected

    public
      procedure PesquisarCEP(pCep : string; pView : IFrmEndereco);

  end;

implementation

{ TEnderecoController }

procedure TEnderecoController.PesquisarCEP(pCep : string; pView : IFrmEndereco);
begin
  self.FConsultaCepService := TConsultaCepService.Create;
  try
    try
       self.FEndereco := self.FConsultaCepService.getDadosCep(pCep);

       if (self.FEndereco <> nil) then
       begin
         pView.setLogradouro(self.FEndereco.Logradouro);
         pView.setBairro(self.FEndereco.Bairro);
         pView.setCidade(self.FEndereco.Cidade);
         pView.setEstado(self.FEndereco.Estado);
       end;
    except
      on E : Exception do
      begin
        Mensagem.MensagemAtencao(E.Message);
      end;
    end;
  finally
    if Assigned(self.FConsultaCepService) then
      FreeAndNil(self.FConsultaCepService);

    if Assigned(self.FEndereco) then
      FreeAndNil(self.FEndereco);
  end;
end;

end.

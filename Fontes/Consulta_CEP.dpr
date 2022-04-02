program Consulta_CEP;



uses
  Vcl.Forms,
  uFrmEndereco in 'Aplicacao\Sistema\View\uFrmEndereco.pas' {FrmEndereco},
  uMensagens in 'Utils\uMensagens.pas',
  uEnderecoController in 'Aplicacao\Sistema\Controller\uEnderecoController.pas',
  uEndereco in 'Aplicacao\Sistema\Model\uEndereco.pas',
  uConsultaCepService in 'Aplicacao\Servico\uConsultaCepService.pas',
  uViaCepApi in 'Aplicacao\Servico\Api\uViaCepApi.pas',
  uApiCepApi in 'Aplicacao\Servico\Api\uApiCepApi.pas',
  uAwesomeApi in 'Aplicacao\Servico\Api\uAwesomeApi.pas',
  uApiGenerica in 'Aplicacao\Servico\Api\uApiGenerica.pas',
  uFactoryApiCep in 'Aplicacao\Servico\FactoryApi\uFactoryApiCep.pas',
  uIApiCep in 'Aplicacao\Servico\InterfaceApi\uIApiCep.pas',
  uIFrmEndereco in 'Aplicacao\Sistema\View\InterfaceView\uIFrmEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmEndereco, FrmEndereco);
  Application.Run;
end.

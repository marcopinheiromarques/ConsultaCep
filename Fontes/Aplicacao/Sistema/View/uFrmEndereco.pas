unit uFrmEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, uEnderecoController,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  System.JSON, uIFrmEndereco;


type
  TFrmEndereco = class(TForm, IFrmEndereco)
    Button1: TButton;
    me_cep: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_logradouro: TEdit;
    Label3: TLabel;
    edt_bairro: TEdit;
    Label4: TLabel;
    edt_cidade: TEdit;
    Label5: TLabel;
    cmb_estado: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure me_cepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    Controller : TEnderecoController;
  public
    { Public declarations }
    procedure setLogradouro(value : string);
    procedure setBairro    (value : string);
    procedure setCidade    (value : string);
    procedure setEstado    (value : string);
  end;

var
  FrmEndereco: TFrmEndereco;

implementation

{$R *.dfm}

uses uMensagens;

procedure TFrmEndereco.Button1Click(Sender: TObject);
begin
  if (Trim(me_cep.Text) = '-') then
  begin
    Mensagem.MensagemAtencao('O cep é obrigatório!');
    me_cep.SetFocus;
    Exit;
  end;

  if (StringReplace(Trim(me_cep.Text), '-', '', [rfReplaceAll, rfIgnoreCase]).Length < 8) then
  begin
    Mensagem.MensagemAtencao('O cep é inválido! Deve conter 8 números.');
    me_cep.SetFocus;
    Exit;
  end;

  Controller.PesquisarCEP(me_cep.Text, self);
end;

procedure TFrmEndereco.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(Controller);
end;

procedure TFrmEndereco.FormCreate(Sender: TObject);
begin
  Controller := TEnderecoController.Create;
end;

procedure TFrmEndereco.me_cepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [ VK_DELETE, VK_BACK ] then begin
    me_cep.Clear;
    key := 0;
  end;
end;

procedure TFrmEndereco.setBairro(value: string);
begin
  edt_bairro.Text := value;
end;

procedure TFrmEndereco.setCidade(value: string);
begin
  edt_cidade.Text := value;
end;

procedure TFrmEndereco.setEstado(value: string);
var
  index : integer;
begin
  if (Trim(value) = string.Empty) then
  begin
    cmb_estado.ItemIndex := 0;
  end
  else
  begin
     index := cmb_estado.Items.IndexOf(value);
     cmb_estado.ItemIndex := index;
  end;
end;

procedure TFrmEndereco.setLogradouro(value: string);
begin
  edt_logradouro.Text := value;
end;

end.

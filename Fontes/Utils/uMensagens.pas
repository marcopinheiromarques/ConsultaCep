unit uMensagens;

interface

  uses Vcl.Forms, Winapi.Windows;

  type
    Mensagem = class

    private

    public
      class procedure MensagemInformacao(mensagem : String);
      class procedure MensagemAtencao   (mensagem : String);
      class procedure MensagemErro      (mensagem : String);
      class function  MensagemPergunta  (mensagem : String) : boolean;
  end;

implementation

{ Mensagem }

class procedure Mensagem.MensagemAtencao(mensagem: String);
begin
  Application.MessageBox(PWideChar(mensagem), PWideChar(Application.Title), MB_OK + MB_ICONWARNING);
end;

class procedure Mensagem.MensagemErro(mensagem: String);
begin
  Application.MessageBox(PWideChar(mensagem), PWideChar(Application.Title), MB_OK + MB_ICONERROR);
end;

class procedure Mensagem.MensagemInformacao(mensagem: String);
begin
  Application.MessageBox(PWideChar(mensagem), PWideChar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

class function Mensagem.MensagemPergunta(mensagem: String): boolean;
begin
  result := false;

  if Application.MessageBox(PWideChar(mensagem), PWideChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = ID_YES then
    result := true;
end;

end.

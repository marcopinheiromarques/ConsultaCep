unit uEndereco;

interface

  type
    TEndereco = class

      private
        FCep        : string;
        FLogradouro : string;
        FBairro     : string;
        FCidade     : string;
        FEstado     : string;

        procedure setCep       (value : string);
        procedure setLogradouro(value : string);
        procedure setBairro    (value : string);
        procedure setCidade    (value : string);
        procedure setEstado    (value : string);

        function getCep       : string;
        function getLogradouro: string;
        function getBairro    : string;
        function getCidade    : string;
        function getEstado    : string;

      protected

      public
        property Cep        : string read getCep        write setCep;
        property Logradouro : string read getLogradouro write setLogradouro;
        property Bairro     : string read getBairro     write setBairro;
        property Cidade     : string read getCidade     write setCidade;
        property Estado     : string read getEstado     write setEstado;
    end;


implementation

{ TEndereco }

function TEndereco.getBairro: string;
begin
  result := self.FBairro;
end;

function TEndereco.getCep: string;
begin
  result := self.FCep;
end;

function TEndereco.getCidade: string;
begin
  result := self.FCidade;
end;

function TEndereco.getEstado: string;
begin
  result := self.FEstado;
end;

function TEndereco.getLogradouro: string;
begin
  result := self.FLogradouro;
end;

procedure TEndereco.setBairro(value: string);
begin
  self.FBairro := value;
end;

procedure TEndereco.setCep(value: string);
begin
  self.FCep := value;
end;

procedure TEndereco.setCidade(value: string);
begin
  self.FCidade := value;
end;

procedure TEndereco.setEstado(value: string);
begin
  self.FEstado := value;
end;

procedure TEndereco.setLogradouro(value: string);
begin
  self.FLogradouro := value;
end;

end.

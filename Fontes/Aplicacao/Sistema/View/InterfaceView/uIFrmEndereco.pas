unit uIFrmEndereco;

interface

type
  IFrmEndereco = interface
  ['{E40F0A61-DFCA-459E-AB6B-587D2E93F770}']

   procedure setLogradouro(value : string);
   procedure setBairro    (value : string);
   procedure setCidade    (value : string);
   procedure setEstado    (value : string);
  end;

implementation

end.

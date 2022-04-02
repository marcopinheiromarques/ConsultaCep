unit uIApiCep;

interface

uses uEndereco;

type
  IApiCep = interface
  ['{924E9756-7BC1-46D2-BFF0-7FF57CE2110A}']

   function RetornaDadosCep(pCep: string) : TEndereco;
  end;

implementation

end.

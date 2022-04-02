object FrmEndereco: TFrmEndereco
  Left = 0
  Top = 0
  Caption = 'Consulta CEP'
  ClientHeight = 210
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 28
    Height = 13
    Caption = 'CEP:'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 70
    Height = 13
    Caption = 'Logradouro:'
  end
  object Label3: TLabel
    Left = 24
    Top = 95
    Width = 40
    Height = 13
    Caption = 'Bairro:'
  end
  object Label4: TLabel
    Left = 24
    Top = 128
    Width = 45
    Height = 13
    Caption = 'Cidade:'
  end
  object Label5: TLabel
    Left = 24
    Top = 160
    Width = 43
    Height = 13
    Caption = 'Estado:'
  end
  object Button1: TButton
    Left = 190
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object me_cep: TMaskEdit
    Left = 100
    Top = 29
    Width = 84
    Height = 21
    EditMask = '99999\-999;1;_'
    MaxLength = 9
    TabOrder = 0
    Text = '     -   '
    OnKeyDown = me_cepKeyDown
  end
  object edt_logradouro: TEdit
    Left = 100
    Top = 61
    Width = 445
    Height = 21
    TabOrder = 2
  end
  object edt_bairro: TEdit
    Left = 100
    Top = 92
    Width = 445
    Height = 21
    TabOrder = 3
  end
  object edt_cidade: TEdit
    Left = 100
    Top = 125
    Width = 445
    Height = 21
    TabOrder = 4
  end
  object cmb_estado: TComboBox
    Left = 100
    Top = 157
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    Items.Strings = (
      ''
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
end

object ViewConsultaCep: TViewConsultaCep
  Left = 0
  Top = 0
  Caption = 'Consulta Cep'
  ClientHeight = 358
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object edtCep: TEdit
    Left = 48
    Top = 48
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object btnConsultar: TBitBtn
    Left = 175
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object rdgWebService: TRadioGroup
    Left = 280
    Top = 24
    Width = 185
    Height = 105
    Caption = 'WebService'
    ItemIndex = 0
    Items.Strings = (
      'ViaCep'
      'OpenCep')
    TabOrder = 2
  end
  object mmResultado: TMemo
    Left = 48
    Top = 144
    Width = 417
    Height = 177
    TabOrder = 3
  end
end
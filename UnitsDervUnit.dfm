object UnitsDervBox: TUnitsDervBox
  Left = 295
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Derivatives (Units)'
  ClientHeight = 341
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 225
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = Label1DblClick
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 56
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Panel1: TPanel
    Left = 8
    Top = 88
    Width = 225
    Height = 217
    BorderStyle = bsSingle
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 206
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 8
      Top = 32
      Width = 203
      Height = 168
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 312
    Width = 121
    Height = 25
    Caption = 'Generate SI Standart'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 312
    Width = 87
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object ComboBox2: TComboBox
    Left = 24
    Top = 16
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'ComboBox2'
    OnChange = ComboBox2Change
  end
end

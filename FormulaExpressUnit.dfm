object FormulaExpressBox: TFormulaExpressBox
  Left = 286
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Quantity Expressing'
  ClientHeight = 346
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 225
    Height = 41
    Shape = bsFrame
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 88
    Width = 137
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    TabStop = False
    OnChange = ComboBox1Change
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 88
    Width = 57
    Height = 17
    AutoSize = False
    Caption = 'Quantities: '
    TabOrder = 1
  end
  object Button2: TButton
    Left = 72
    Top = 315
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 120
    Width = 225
    Height = 185
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 64
    Top = 88
    Width = 25
    Height = 17
    AutoSize = False
    TabOrder = 4
  end
  object StaticText4: TStaticText
    Left = 16
    Top = 56
    Width = 209
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Formula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnDblClick = StaticText4DblClick
  end
  object StaticText3: TStaticText
    Left = 16
    Top = 16
    Width = 209
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnDblClick = StaticText4DblClick
  end
  object ComboBox2: TComboBox
    Left = 24
    Top = 16
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    OnChange = ComboBox2Change
  end
end

object FormulaEditBox: TFormulaEditBox
  Left = 277
  Top = 172
  BorderStyle = bsDialog
  Caption = '...'
  ClientHeight = 309
  ClientWidth = 301
  Color = clBtnFace
  Constraints.MaxHeight = 343
  Constraints.MaxWidth = 309
  Constraints.MinHeight = 343
  Constraints.MinWidth = 309
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
    Left = 16
    Top = 18
    Width = 57
    Height = 15
    AutoSize = False
    Caption = 'Name :'
    FocusControl = Edit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 51
    Width = 65
    Height = 17
    AutoSize = False
    Caption = 'Formula :'
    FocusControl = Edit2
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 265
    Height = 13
    AutoSize = False
    Caption = 'Description:'
    FocusControl = Memo1
  end
  object Button1: TButton
    Left = 16
    Top = 264
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 264
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 16
    Width = 201
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 80
    Top = 48
    Width = 201
    Height = 21
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 16
    Top = 96
    Width = 265
    Height = 145
    ScrollBars = ssVertical
    TabOrder = 4
  end
end

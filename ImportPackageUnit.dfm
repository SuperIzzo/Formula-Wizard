object ImportPackageBox: TImportPackageBox
  Left = 246
  Top = 139
  Width = 344
  Height = 362
  Caption = 'Import Package'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 8
    Width = 185
    Height = 281
    OnClickCheck = CheckListBox1ClickCheck
    ItemHeight = 13
    TabOrder = 0
    OnClick = CheckListBox1Click
  end
  object Button1: TButton
    Left = 176
    Top = 296
    Width = 73
    Height = 25
    Caption = 'Import'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 296
    Width = 73
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 200
    Top = 8
    Width = 129
    Height = 217
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 28
      Height = 13
      Caption = 'Short:'
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 40
      Height = 13
      Caption = 'Formula:'
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 26
      Height = 13
      Caption = 'Main:'
    end
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object Memo1: TMemo
      Left = 8
      Top = 104
      Width = 113
      Height = 105
      Color = clBtnFace
      TabOrder = 0
    end
  end
  object Button3: TButton
    Left = 200
    Top = 232
    Width = 129
    Height = 25
    Caption = 'Select All'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 199
    Top = 264
    Width = 130
    Height = 25
    Caption = 'Select None'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 7
    Top = 296
    Width = 82
    Height = 25
    Caption = 'Open'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 95
    Top = 296
    Width = 74
    Height = 25
    Caption = 'Clear'
    TabOrder = 7
    OnClick = Button6Click
  end
end

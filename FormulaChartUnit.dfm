object FormulaChartBox: TFormulaChartBox
  Left = 162
  Top = 12
  BorderStyle = bsDialog
  Caption = 'Function Chart'
  ClientHeight = 506
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 384
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 208
    Top = 384
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 408
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 208
    Top = 408
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 432
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 208
    Top = 432
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 16
    Top = 456
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 208
    Top = 456
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 16
    Top = 480
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 208
    Top = 480
    Width = 41
    Height = 25
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 400
    Top = 384
    Width = 33
    Height = 13
    AutoSize = False
    Caption = 'min:'
  end
  object Label12: TLabel
    Left = 400
    Top = 408
    Width = 33
    Height = 13
    AutoSize = False
    Caption = 'max:'
  end
  object Label13: TLabel
    Left = 8
    Top = 352
    Width = 497
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Formula'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = Label13DblClick
  end
  object Label14: TLabel
    Left = 32
    Top = 8
    Width = 457
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Name'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 400
    Top = 432
    Width = 33
    Height = 13
    AutoSize = False
    Caption = 'prec:'
  end
  object Chart1: TChart
    Left = 8
    Top = 32
    Width = 489
    Height = 321
    AnimatedZoom = True
    AnimatedZoomSteps = 30
    BackWall.Brush.Color = clWhite
    BackWall.Color = clSilver
    Foot.Alignment = taLeftJustify
    Foot.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BackColor = clSilver
    BottomAxis.TickLength = 5
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -13
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.TickLength = 5
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    LeftAxis.TitleSize = 1
    Legend.Visible = False
    ScaleLastPage = False
    View3D = False
    BevelOuter = bvNone
    TabOrder = 0
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Style = smsXValue
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = 16744448
      LinePen.Color = 16744448
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Edit1: TEdit
    Left = 64
    Top = 384
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 64
    Top = 408
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 384
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 64
    Top = 432
    Width = 57
    Height = 21
    TabOrder = 4
  end
  object ComboBox5: TComboBox
    Left = 128
    Top = 432
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 256
    Top = 384
    Width = 57
    Height = 21
    TabOrder = 6
  end
  object ComboBox2: TComboBox
    Left = 320
    Top = 384
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 7
  end
  object Edit7: TEdit
    Left = 64
    Top = 456
    Width = 57
    Height = 21
    TabOrder = 8
  end
  object ComboBox7: TComboBox
    Left = 128
    Top = 456
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 9
  end
  object Edit4: TEdit
    Left = 256
    Top = 408
    Width = 57
    Height = 21
    TabOrder = 10
  end
  object ComboBox4: TComboBox
    Left = 320
    Top = 408
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 11
  end
  object ComboBox3: TComboBox
    Left = 128
    Top = 408
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 12
  end
  object Edit6: TEdit
    Left = 256
    Top = 432
    Width = 57
    Height = 21
    TabOrder = 13
  end
  object ComboBox6: TComboBox
    Left = 320
    Top = 432
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 14
  end
  object Edit8: TEdit
    Left = 256
    Top = 456
    Width = 57
    Height = 21
    TabOrder = 15
  end
  object ComboBox8: TComboBox
    Left = 320
    Top = 456
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 16
  end
  object Edit9: TEdit
    Left = 64
    Top = 480
    Width = 57
    Height = 21
    TabOrder = 17
  end
  object ComboBox9: TComboBox
    Left = 128
    Top = 480
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 18
  end
  object Edit10: TEdit
    Left = 256
    Top = 480
    Width = 57
    Height = 21
    TabOrder = 19
  end
  object ComboBox10: TComboBox
    Left = 320
    Top = 480
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 20
  end
  object Edit11: TEdit
    Left = 432
    Top = 408
    Width = 73
    Height = 21
    TabOrder = 21
  end
  object Edit12: TEdit
    Left = 432
    Top = 384
    Width = 73
    Height = 21
    TabOrder = 22
  end
  object Button1: TButton
    Left = 400
    Top = 464
    Width = 49
    Height = 33
    Caption = 'Draw'
    TabOrder = 23
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 464
    Width = 49
    Height = 33
    Cancel = True
    Caption = 'Close'
    TabOrder = 24
    OnClick = Button2Click
  end
  object ComboBox11: TComboBox
    Left = 133
    Top = 13
    Width = 225
    Height = 21
    ItemHeight = 13
    TabOrder = 25
    OnChange = ComboBox11Change
  end
  object Edit13: TEdit
    Left = 432
    Top = 432
    Width = 73
    Height = 21
    TabOrder = 26
  end
end

object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 712
  ClientWidth = 1039
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    1039
    712)
  PixelsPerInch = 96
  TextHeight = 17
  object Label9: TLabel
    Left = 23
    Top = 398
    Width = 64
    Height = 17
    Caption = 'Exerc'#237'cios:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEx2: TLabel
    Left = 23
    Top = 458
    Width = 208
    Height = 17
    Cursor = crHandPoint
    Caption = '2. Apresentar as rotas poss'#237'vels. (6)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = lblEx2Click
    OnMouseEnter = lblEx1MouseEnter
    OnMouseLeave = lblEx1MouseLeave
  end
  object lblEx3: TLabel
    Left = 23
    Top = 486
    Width = 109
    Height = 17
    Cursor = crHandPoint
    Caption = '3. Menor caminho.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = lblEx3Click
    OnMouseEnter = lblEx1MouseEnter
    OnMouseLeave = lblEx1MouseLeave
  end
  object lblEx4: TLabel
    Left = 23
    Top = 514
    Width = 227
    Height = 17
    Cursor = crHandPoint
    Caption = '4. Mostre 2 circuitos partindo de Jales.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = lblEx4Click
    OnMouseEnter = lblEx1MouseEnter
    OnMouseLeave = lblEx1MouseLeave
  end
  object lblEx5: TLabel
    Left = 23
    Top = 542
    Width = 100
    Height = 17
    Cursor = crHandPoint
    Caption = '5. Mostre 1 ciclo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = lblEx5Click
    OnMouseEnter = lblEx1MouseEnter
    OnMouseLeave = lblEx1MouseLeave
  end
  object lblEx1: TLabel
    Left = 23
    Top = 431
    Width = 78
    Height = 17
    Cursor = crHandPoint
    Caption = '1. Algor'#237'timo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = lblEx1Click
    OnMouseEnter = lblEx1MouseEnter
    OnMouseLeave = lblEx1MouseLeave
  end
  object Label10: TLabel
    Left = 23
    Top = 11
    Width = 130
    Height = 17
    Caption = 'Matriz de adjac'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 23
    Top = 235
    Width = 56
    Height = 17
    Caption = 'Legenda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 23
    Top = 263
    Width = 48
    Height = 17
    Caption = '0 - Jales'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 23
    Top = 289
    Width = 96
    Height = 17
    Caption = '1 - Votuporanga'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 23
    Top = 316
    Width = 103
    Height = 17
    Caption = '2 - Fernand'#243'polis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 23
    Top = 343
    Width = 110
    Height = 17
    Caption = '3 - Santa F'#233' do Sul'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 23
    Top = 687
    Width = 241
    Height = 17
    Caption = 'Fernand'#243'polis, 25 de novembro de 2016.'
  end
  object pnlMatriz: TPanel
    Left = 10
    Top = 43
    Width = 329
    Height = 171
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 9
      Width = 57
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 106
      Top = 9
      Width = 57
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 175
      Top = 9
      Width = 57
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 245
      Top = 9
      Width = 57
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 13
      Top = 35
      Width = 8
      Height = 16
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 13
      Top = 67
      Width = 8
      Height = 16
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 13
      Top = 99
      Width = 8
      Height = 16
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 13
      Top = 131
      Width = 8
      Height = 16
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt11: TEdit
      Left = 37
      Top = 32
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      Text = '0'
      OnChange = edt11Change
    end
    object edt12: TEdit
      Left = 37
      Top = 64
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 1
      Text = '0'
      OnChange = edt11Change
    end
    object edt13: TEdit
      Left = 37
      Top = 96
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 2
      Text = '1'
      OnChange = edt11Change
    end
    object edt14: TEdit
      Left = 37
      Top = 128
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 3
      Text = '1'
      OnChange = edt11Change
    end
    object edt21: TEdit
      Left = 106
      Top = 32
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 4
      Text = '1'
      OnChange = edt11Change
    end
    object edt22: TEdit
      Left = 106
      Top = 64
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 5
      Text = '1'
      OnChange = edt11Change
    end
    object edt23: TEdit
      Left = 106
      Top = 96
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 6
      Text = '0'
      OnChange = edt11Change
    end
    object edt24: TEdit
      Left = 106
      Top = 128
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 7
      Text = '0'
      OnChange = edt11Change
    end
    object edt31: TEdit
      Left = 175
      Top = 32
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 8
      Text = '1'
      OnChange = edt11Change
    end
    object edt32: TEdit
      Left = 175
      Top = 64
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 9
      Text = '0'
      OnChange = edt11Change
    end
    object edt33: TEdit
      Left = 175
      Top = 96
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 10
      Text = '0'
      OnChange = edt11Change
    end
    object edt34: TEdit
      Left = 175
      Top = 128
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 11
      Text = '0'
      OnChange = edt11Change
    end
    object edt41: TEdit
      Left = 245
      Top = 32
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 12
      Text = '0'
      OnChange = edt11Change
    end
    object edt42: TEdit
      Left = 245
      Top = 64
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 13
      Text = '1'
      OnChange = edt11Change
    end
    object edt43: TEdit
      Left = 245
      Top = 96
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 14
      Text = '1'
      OnChange = edt11Change
    end
    object edt44: TEdit
      Left = 245
      Top = 128
      Width = 57
      Height = 25
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 15
      Text = '1'
      OnChange = edt11Change
    end
  end
  object browserRespostas: TWebBrowser
    Left = 375
    Top = 11
    Width = 648
    Height = 693
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 388
    ExplicitHeight = 597
    ControlData = {
      4C000000F9420000A04700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end

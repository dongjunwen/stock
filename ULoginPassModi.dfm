object FrmPassModi: TFrmPassModi
  Left = 341
  Top = 245
  BorderStyle = bsSingle
  Caption = #23494#30721#20462#25913
  ClientHeight = 185
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 303
    Height = 185
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 11
      Top = 88
      Width = 84
      Height = 13
      Caption = #20877#27425#36755#20837#26032#23494#30721
    end
    object Label2: TLabel
      Left = 59
      Top = 53
      Width = 36
      Height = 13
      Caption = #26032#23494#30721
    end
    object Label1: TLabel
      Left = 46
      Top = 16
      Width = 48
      Height = 13
      Caption = #21407#22987#23494#30721
    end
    object cxButton1: TcxButton
      Left = 118
      Top = 120
      Width = 115
      Height = 25
      Caption = #30830#23450
      TabOrder = 3
      OnClick = cxButton1Click
    end
    object cxTextEdit3: TcxTextEdit
      Left = 117
      Top = 89
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 2
      OnKeyPress = cxTextEdit3KeyPress
      Width = 121
    end
    object cxTextEdit2: TcxTextEdit
      Left = 117
      Top = 49
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 1
      Width = 121
    end
    object cxTextEdit1: TcxTextEdit
      Left = 116
      Top = 14
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 0
      Width = 121
    end
  end
end

object FrmDataCfg: TFrmDataCfg
  Left = 567
  Top = 228
  Width = 350
  Height = 311
  Caption = #25968#25454#24211#37197#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 35
    Width = 37
    Height = 13
    Caption = 'IP'#22320#22336':'
  end
  object Label2: TLabel
    Left = 50
    Top = 75
    Width = 39
    Height = 13
    Caption = #31471#21475#21495':'
  end
  object Label3: TLabel
    Left = 50
    Top = 112
    Width = 39
    Height = 13
    Caption = #25968#25454#24211':'
  end
  object Label4: TLabel
    Left = 50
    Top = 148
    Width = 27
    Height = 13
    Caption = #36134#21495':'
  end
  object Label5: TLabel
    Left = 50
    Top = 183
    Width = 27
    Height = 13
    Caption = #23494#30721':'
  end
  object BtnOk: TButton
    Left = 192
    Top = 219
    Width = 75
    Height = 25
    Caption = #35774#32622
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object EdtIpAddr: TEdit
    Left = 104
    Top = 35
    Width = 169
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object EdtIpPort: TEdit
    Left = 104
    Top = 75
    Width = 169
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object EdtDataName: TEdit
    Left = 104
    Top = 112
    Width = 169
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 3
  end
  object EdtUserName: TEdit
    Left = 104
    Top = 148
    Width = 169
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 4
  end
  object EdtUserPass: TEdit
    Left = 104
    Top = 183
    Width = 169
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    PasswordChar = '*'
    TabOrder = 5
  end
  object Button1: TButton
    Left = 96
    Top = 219
    Width = 75
    Height = 25
    Caption = #27979#35797#36830#25509
    TabOrder = 6
    OnClick = Button1Click
  end
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'kcdb'
    Username = 'admin'
    Server = 'localhost'
    LoginPrompt = False
    Left = 24
    Top = 160
    EncryptedPassword = '9EFF9BFF92FF96FF91FF'
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 16
    Top = 88
  end
end

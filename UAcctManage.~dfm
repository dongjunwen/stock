inherited FrmAcctManage: TFrmAcctManage
  Left = 417
  Top = 193
  Caption = #36134#21495#21450#26435#38480#31649#29702
  ClientWidth = 1104
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1104
    object Panel2: TPanel
      Left = 193
      Top = 1
      Width = 910
      Height = 407
      Align = alClient
      TabOrder = 0
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 908
        Height = 405
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 33
          Top = 59
          Width = 24
          Height = 13
          Caption = #26165#31216
        end
        object Label2: TLabel
          Left = 374
          Top = 59
          Width = 24
          Height = 13
          Caption = #23494#30721
        end
        object Label1: TLabel
          Left = 24
          Top = 12
          Width = 24
          Height = 13
          Caption = #36134#21495
        end
        object Label4: TLabel
          Left = 184
          Top = 62
          Width = 48
          Height = 13
          Caption = #36134#21495#29366#24577
        end
        object Label5: TLabel
          Left = 192
          Top = 8
          Width = 24
          Height = 13
          Caption = #35282#33394
        end
        object cxDBTextNicName: TcxDBTextEdit
          Left = 58
          Top = 57
          DataBinding.DataField = 'NICK_NAME'
          DataBinding.DataSource = dsMain
          TabOrder = 0
          Width = 121
        end
        object cxDBTextLoginPass: TcxDBTextEdit
          Left = 402
          Top = 57
          DataBinding.DataField = 'PASS_WORD'
          DataBinding.DataSource = dsMain
          Properties.ReadOnly = False
          TabOrder = 1
          Width = 121
        end
        object cxDBTextLoginNo: TcxDBTextEdit
          Left = 58
          Top = 9
          DataBinding.DataField = 'LOGIN_NO'
          DataBinding.DataSource = dsMain
          TabOrder = 2
          Width = 121
        end
        object cxDBRadioStatus: TcxDBRadioGroup
          Left = 239
          Top = 50
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMain
          Properties.Columns = 2
          Properties.DefaultCaption = #21551#29992
          Properties.DefaultValue = '1'
          Properties.Items = <
            item
              Caption = #21551#29992
              Value = '1'
            end
            item
              Caption = #20572#29992
              Value = '0'
            end>
          TabOrder = 3
          Height = 33
          Width = 122
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox
          Left = 224
          Top = 8
          DataBinding.DataField = 'ROLE_NO'
          DataBinding.DataSource = dsMain
          Properties.KeyFieldNames = 'ROLE_NO'
          Properties.ListColumns = <
            item
              Caption = #35282#33394#32534#21495
              FieldName = 'ROLE_NO'
            end
            item
              Caption = #35282#33394#21517#31216
              FieldName = 'ROLE_NAME'
            end>
          Properties.ListSource = dsRoleInfo
          TabOrder = 4
          Width = 145
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 368
          Top = 8
          DataBinding.DataField = 'ROLE_NAME'
          DataBinding.DataSource = dsMain
          TabOrder = 5
          Width = 121
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 264
        Width = 908
        Height = 142
        Align = alCustom
        Caption = 'Panel4'
        TabOrder = 1
        Visible = False
        object cxGrid1: TcxGrid
          Left = 1
          Top = 1
          Width = 906
          Height = 140
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsEmpRole
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.Navigator = True
            OptionsView.Indicator = True
            Styles.GroupByBox = cxStyle1
            object cxGrid1DBTableView1SelNo: TcxGridDBColumn
              Caption = #24207#21495
            end
            object cxGrid1DBTableRoleNo: TcxGridDBColumn
              Caption = #35282#33394#32534#21495
              DataBinding.FieldName = 'ROLE_NO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'ROLE_NO'
              Properties.ListColumns = <
                item
                  Caption = #35282#33394#32534#21495
                  FieldName = 'ROLE_NO'
                end
                item
                  Caption = #35282#33394#21517#31216
                  FieldName = 'ROLE_NAME'
                end>
              Properties.ListSource = dsRoleInfo
              Properties.OnCloseUp = cxGrid1DBTableRoleNoPropertiesCloseUp
              Width = 85
            end
            object cxGrid1DBTableView1RoleName: TcxGridDBColumn
              Caption = #35282#33394#21517#31216
              DataBinding.FieldName = 'ROLE_NAME'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.ListColumns = <>
              Width = 71
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 192
      Height = 407
      Align = alLeft
      TabOrder = 1
      object cxGrid2: TcxGrid
        Left = 1
        Top = 1
        Width = 190
        Height = 405
        Align = alClient
        TabOrder = 0
        object cxGrid2DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsLoginInfo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          object cxGrid2DBTableView1LoginNo: TcxGridDBColumn
            Caption = #36134#21495
            DataBinding.FieldName = 'LOGIN_NO'
            Width = 51
          end
          object cxGrid2DBTableView1NicName: TcxGridDBColumn
            Caption = #26165#31216
            DataBinding.FieldName = 'NICK_NAME'
            Width = 61
          end
          object cxGrid2DBTableView1Status: TcxGridDBColumn
            Caption = #29366#24577
            DataBinding.FieldName = 'STATUS_NAME'
            Width = 70
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1104
    inherited tlb1: TToolBar
      Width = 1102
      inherited btnserch: TToolButton
        Visible = False
      end
      inherited btnfresh: TToolButton
        Wrap = False
      end
      inherited btnFirst: TToolButton
        Left = 539
        Top = 2
      end
      inherited btnBefore: TToolButton
        Left = 616
        Top = 2
      end
      inherited btnNext: TToolButton
        Left = 693
        Top = 2
      end
      inherited btnLast: TToolButton
        Left = 770
        Top = 2
      end
      inherited btnImport: TToolButton
        Left = 847
        Top = 2
        Visible = False
      end
      inherited btnExport: TToolButton
        Left = 924
        Top = 2
        Visible = False
      end
      inherited btnprint: TToolButton
        Left = 1001
        Top = 2
        Visible = False
      end
    end
  end
  inherited ImageList: TImageList
    Left = 840
    Top = 152
  end
  inherited dsMain: TUniDataSource
    Left = 872
    Top = 89
  end
  inherited TblMain: TUniTable
    TableName = 'kc_login_base'
    MasterSource = dsLoginInfo
    MasterFields = 'LOGIN_NO'
    DetailFields = 'LOGIN_NO'
    BeforePost = TblMainBeforePost
    OnNewRecord = TblMainNewRecord
    Left = 800
    Top = 97
    object TblMainLOGIN_NO: TStringField
      FieldName = 'LOGIN_NO'
      Required = True
      Size = 64
    end
    object TblMainPASS_WORD: TStringField
      FieldName = 'PASS_WORD'
      Size = 1024
    end
    object TblMainNICK_NAME: TStringField
      FieldName = 'NICK_NAME'
      Size = 128
    end
    object TblMainSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 2
    end
    object TblMainLAST_LOGIN_TIME: TDateTimeField
      FieldName = 'LAST_LOGIN_TIME'
    end
    object TblMainMEMO: TStringField
      FieldName = 'MEMO'
      Size = 1024
    end
    object TblMainROLE_NO: TStringField
      FieldName = 'ROLE_NO'
      Size = 64
    end
    object TblMainROLE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ROLE_NAME'
      LookupDataSet = qryRoleInfo
      LookupKeyFields = 'ROLE_NO'
      LookupResultField = 'ROLE_NAME'
      KeyFields = 'ROLE_NO'
      Lookup = True
    end
  end
  inherited dlgSave1: TSaveDialog
    Left = 880
    Top = 169
  end
  object TblEmpRole: TUniTable
    TableName = 'kc_emp_role'
    Left = 584
    Top = 224
    object TblEmpRoleLOGIN_NO: TStringField
      FieldName = 'LOGIN_NO'
      Required = True
      Size = 64
    end
    object TblEmpRoleROLE_NO: TStringField
      FieldName = 'ROLE_NO'
      Required = True
      Size = 64
    end
    object TblEmpRoleMEMO: TStringField
      FieldName = 'MEMO'
      Size = 256
    end
    object TblEmpRoleROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Size = 128
    end
  end
  object dsEmpRole: TUniDataSource
    DataSet = TblEmpRole
    Left = 576
    Top = 160
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 272
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveCaption
    end
  end
  object qryRoleInfo: TUniQuery
    SQL.Strings = (
      'select * from kc_role_info')
    Left = 480
    Top = 224
  end
  object dsRoleInfo: TUniDataSource
    DataSet = qryRoleInfo
    Left = 480
    Top = 160
  end
  object dsLoginInfo: TUniDataSource
    DataSet = qryLoginInfo
    Left = 112
    Top = 120
  end
  object qryLoginInfo: TUniQuery
    KeyFields = 'LOGIN_NO'
    SQL.Strings = (
      'select'
      '  a.login_no,'
      '  a.nick_name,'
      '  a.status,'
      '  case a.status '
      '  when '#39'1'#39' then '#39#21551#29992#39' '
      '  else '#39#26410#21551#29992#39' '
      '  end as status_name,'
      '  b.role_no,'
      
        '  (select role_name from  kc_role_info where role_no=b.role_no )' +
        ' as role_name'
      'from kc_login_base a left join kc_emp_role b'
      'on a.login_no=b.login_no')
    AfterScroll = qryLoginInfoAfterScroll
    Left = 48
    Top = 120
    object qryLoginInfoLOGIN_NO: TStringField
      FieldName = 'LOGIN_NO'
      Required = True
      Size = 64
    end
    object qryLoginInfoNICK_NAME: TStringField
      FieldName = 'NICK_NAME'
      Size = 128
    end
    object qryLoginInfoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 2
    end
    object qryLoginInfoROLE_NO: TStringField
      FieldName = 'ROLE_NO'
      ReadOnly = True
      Size = 64
    end
    object qryLoginInfoROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      ReadOnly = True
      Size = 128
    end
    object qryLoginInfoSTATUS_NAME: TStringField
      FieldName = 'STATUS_NAME'
      ReadOnly = True
      Size = 6
    end
  end
end

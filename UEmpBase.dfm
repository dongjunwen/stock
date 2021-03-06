inherited FrmEmpBase: TFrmEmpBase
  Left = 286
  Top = 143
  Caption = #21592#24037#22522#26412#20449#24687
  ClientHeight = 456
  ClientWidth = 1078
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1078
    Height = 423
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1076
      Height = 48
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #21592#24037#20195#30721
      end
      object Label2: TLabel
        Left = 200
        Top = 16
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #21592#24037#21517#31216
      end
      object EdtEmpNo: TEdit
        Left = 72
        Top = 16
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object EdtEmpName: TEdit
        Left = 256
        Top = 16
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 1076
      Height = 373
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1074
        Height = 371
        Align = alClient
        DataSource = dsMain
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'EMP_NO'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMP_NAME'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GENDER'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BIRTH_DAY'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOBILE'
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADDR'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_NO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANK_NAME'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANK_ACCT'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JOIN_DATE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LEAVE_DATE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MEMO'
            Visible = True
          end>
      end
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 1074
        Height = 371
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsMain
          DataController.KeyFieldNames = 'EMP_NO'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = #24635#35745':0'
              Kind = skCount
              FieldName = 'EMP_NO'
              Column = cxGrid1DBTableView1EmpCode
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#35745':0'
              Kind = skCount
              Column = cxGrid1DBTableView1EmpCode
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Appending = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.ContentOdd = cxStyle9
          Styles.Selection = cxStyle2
          Styles.Header = cxStyle4
          object cxGrid1DBTableView1EmpCode: TcxGridDBColumn
            DataBinding.FieldName = 'EMP_NO'
            MinWidth = 12
            Width = 65
          end
          object cxGrid1DBTableView1EmpName: TcxGridDBColumn
            DataBinding.FieldName = 'EMP_NAME'
            Width = 103
          end
          object cxGrid1DBTableView1EmpGender: TcxGridDBColumn
            DataBinding.FieldName = 'GENDER'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #30007
              #22899)
            Width = 77
          end
          object cxGrid1DBTableView1BirthDay: TcxGridDBColumn
            DataBinding.FieldName = 'BIRTH_DAY'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 78
          end
          object cxGrid1DBTableView1Mobile: TcxGridDBColumn
            DataBinding.FieldName = 'MOBILE'
            Width = 88
          end
          object cxGrid1DBTableView1Addr: TcxGridDBColumn
            DataBinding.FieldName = 'ADDR'
            Width = 127
          end
          object cxGrid1DBTableView1Email: TcxGridDBColumn
            DataBinding.FieldName = 'EMAIL'
            Width = 200
          end
          object cxGrid1DBTableView1IdNo: TcxGridDBColumn
            DataBinding.FieldName = 'ID_NO'
            Width = 200
          end
          object cxGrid1DBTableView1BankName: TcxGridDBColumn
            Caption = #24320#25143#38134#34892
            DataBinding.FieldName = 'BANK_NAME'
            Width = 200
          end
          object cxGrid1DBTableView1BankAcct: TcxGridDBColumn
            DataBinding.FieldName = 'BANK_ACCT'
            Width = 200
          end
          object cxGrid1DBTableView1JoinDate: TcxGridDBColumn
            DataBinding.FieldName = 'JOIN_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 200
          end
          object cxGrid1DBTableView1LeaveDate: TcxGridDBColumn
            DataBinding.FieldName = 'LEAVE_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 200
          end
          object cxGrid1DBTableView1Memo: TcxGridDBColumn
            DataBinding.FieldName = 'MEMO'
            Width = 200
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1078
    inherited tlb1: TToolBar
      Width = 1076
      inherited btnserch: TToolButton
        OnClick = btnserchClick
      end
      inherited btnfresh: TToolButton
        Wrap = True
      end
      inherited btnFirst: TToolButton
        Left = 0
        Top = 24
      end
      inherited btnBefore: TToolButton
        Left = 77
        Top = 24
      end
      inherited btnNext: TToolButton
        Left = 154
        Top = 24
      end
      inherited btnLast: TToolButton
        Left = 231
        Top = 24
      end
      inherited btnImport: TToolButton
        Left = 308
        Top = 24
        Visible = False
      end
      inherited btnExport: TToolButton
        Left = 385
        Top = 24
        Visible = False
      end
      inherited btnprint: TToolButton
        Left = 462
        Top = 24
        Wrap = False
        Visible = False
      end
    end
  end
  inherited dsMain: TUniDataSource
    Left = 720
    Top = 177
  end
  inherited TblMain: TUniTable
    TableName = 'kc_emp_base'
    Top = 177
    object TblMainEMP_NO: TStringField
      DisplayLabel = #21592#24037#32534#21495
      FieldName = 'EMP_NO'
      Required = True
      Size = 64
    end
    object TblMainEMP_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'EMP_NAME'
      Size = 128
    end
    object TblMainGENDER: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'GENDER'
      FixedChar = True
      Size = 2
    end
    object TblMainBIRTH_DAY: TDateField
      DisplayLabel = #20986#29983#26085#26399
      FieldName = 'BIRTH_DAY'
    end
    object TblMainMOBILE: TStringField
      DisplayLabel = #25163#26426
      FieldName = 'MOBILE'
      Size = 32
    end
    object TblMainADDR: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'ADDR'
      Size = 128
    end
    object TblMainEMAIL: TStringField
      DisplayLabel = #37038#31665
      FieldName = 'EMAIL'
      Size = 128
    end
    object TblMainID_NO: TStringField
      DisplayLabel = #36523#20221#35777#21495
      FieldName = 'ID_NO'
      Size = 128
    end
    object TblMainBANK_NAME: TStringField
      DisplayLabel = #38134#34892#21517#31216
      FieldName = 'BANK_NAME'
      Size = 128
    end
    object TblMainBANK_ACCT: TStringField
      DisplayLabel = #38134#34892#36134#21495
      FieldName = 'BANK_ACCT'
      Size = 128
    end
    object TblMainJOIN_DATE: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'JOIN_DATE'
    end
    object TblMainIF_LEAVE: TStringField
      DisplayLabel = #26159#21542#31163#32844
      FieldName = 'IF_LEAVE'
      FixedChar = True
      Size = 2
    end
    object TblMainLEAVE_DATE: TDateField
      DisplayLabel = #31163#32844#26085#26399
      FieldName = 'LEAVE_DATE'
    end
    object TblMainEMP_TYPE: TStringField
      DisplayLabel = #21592#24037#36523#20221
      FieldName = 'EMP_TYPE'
      Size = 4
    end
    object TblMainMEMO: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'MEMO'
      Size = 1024
    end
  end
  object cxEditStyleController1: TcxEditStyleController
    Left = 265
    Top = 274
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 312
    Top = 88
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clTeal
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
  end
end

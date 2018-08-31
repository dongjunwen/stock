inherited FrmStorInfo: TFrmStorInfo
  Left = 201
  Top = 158
  Caption = #24211#23384#26597#35810
  ClientWidth = 1128
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1128
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1126
      Height = 48
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 28
        Height = 13
        Caption = '*'#21697#21517
      end
      object cxLookupMatCode: TcxLookupComboBox
        Left = 48
        Top = 16
        Properties.KeyFieldNames = 'MAT_CODE'
        Properties.ListColumns = <
          item
            Caption = #21830#21697#20195#30721
            FieldName = 'MAT_CODE'
          end
          item
            Caption = #21830#21697#21517#31216
            FieldName = 'MAT_NAME'
          end>
        Properties.ListSource = dsMatInfo
        Properties.OnChange = cxLookupMatCodePropertiesChange
        Properties.OnCloseUp = cxLookupMatCodePropertiesCloseUp
        TabOrder = 0
        Width = 113
      end
      object cxTextMatName: TcxTextEdit
        Left = 160
        Top = 16
        TabOrder = 1
        Width = 121
      end
      object cxTextMatGauge: TcxTextEdit
        Left = 280
        Top = 16
        TabOrder = 2
        Width = 121
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 1126
      Height = 359
      Align = alClient
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 1124
        Height = 357
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 1
          Top = 1
          Width = 1122
          Height = 355
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsStorInfo
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = #24635#35745':0'
                Kind = skSum
                Column = cxGrid1DBTableView1ActNum
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsView.Footer = True
            OptionsView.Indicator = True
            Styles.GroupByBox = cxStyle1
            object cxGrid1DBTableView1SelNo: TcxGridDBColumn
              Caption = #24207#21495
              OnGetDataText = cxGrid1DBTableView1SelNoGetDataText
            end
            object cxGrid1DBTableView1MatCode: TcxGridDBColumn
              Caption = #29289#26009#32534#21495
              DataBinding.FieldName = 'MAT_CODE'
              Width = 109
            end
            object cxGrid1DBTableView1MatName: TcxGridDBColumn
              Caption = #29289#26009#21517#31216
              DataBinding.FieldName = 'MAT_NAME'
              Width = 74
            end
            object cxGrid1DBTableView1MatGauge: TcxGridDBColumn
              Caption = #35268#26684#22411#21495
              DataBinding.FieldName = 'MAT_GAUGE'
              Width = 134
            end
            object cxGrid1DBTableView1MatUnit: TcxGridDBColumn
              Caption = #21333#20301
              DataBinding.FieldName = 'MAT_UNIT'
              Width = 89
            end
            object cxGrid1DBTableView1Degree: TcxGridDBColumn
              Caption = #24230#25968
              DataBinding.FieldName = 'Degree'
              Width = 103
            end
            object cxGrid1DBTableView1InNum: TcxGridDBColumn
              Caption = #20837#24211#25968#37327
              DataBinding.FieldName = 'IN_NUM'
              Width = 100
            end
            object cxGrid1DBTableView1OutNum: TcxGridDBColumn
              Caption = #20986#24211#25968#37327
              DataBinding.FieldName = 'OUT_NUM'
              Width = 95
            end
            object cxGrid1DBTableView1ActNum: TcxGridDBColumn
              Caption = #21097#20313#24211#23384
              DataBinding.FieldName = 'ACT_NUM'
              Width = 129
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1128
    inherited tlb1: TToolBar
      Width = 1126
      inherited btnserch: TToolButton
        OnClick = btnserchClick
      end
      inherited btnnew: TToolButton
        Visible = False
      end
      inherited btndelete: TToolButton
        Visible = False
      end
      inherited btnModi: TToolButton
        Visible = False
      end
      inherited btnSave: TToolButton
        Visible = False
      end
      inherited btncancel: TToolButton
        Visible = False
      end
      inherited btnfresh: TToolButton
        Wrap = False
        Visible = False
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
      end
      inherited btnprint: TToolButton
        Left = 1001
        Top = 2
        Visible = False
      end
    end
  end
  inherited dsMain: TUniDataSource
    Left = 760
    Top = 217
  end
  inherited TblMain: TUniTable
    TableName = 'kc_stor_info'
    Left = 680
    Top = 225
    object TblMainMAT_CODE: TStringField
      FieldName = 'MAT_CODE'
      Size = 64
    end
    object TblMainMAT_NAME: TStringField
      FieldName = 'MAT_NAME'
      Size = 128
    end
    object TblMainMAT_GAUGE: TStringField
      FieldName = 'MAT_GAUGE'
      Size = 128
    end
    object TblMainMAT_UNIT: TStringField
      FieldName = 'MAT_UNIT'
      Size = 32
    end
    object TblMainDEGREE: TFloatField
      FieldName = 'DEGREE'
    end
    object TblMainACT_NUM: TFloatField
      FieldName = 'ACT_NUM'
    end
    object TblMainIN_NUM: TFloatField
      FieldName = 'IN_NUM'
    end
    object TblMainOUT_NUM: TFloatField
      FieldName = 'OUT_NUM'
    end
  end
  inherited dlgSave1: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 120
    Top = 201
  end
  object dsMatInfo: TUniDataSource
    DataSet = QryMatInfo
    Left = 240
    Top = 184
  end
  object QryMatInfo: TUniQuery
    SQL.Strings = (
      'select * from kc_matter_base where 1=1')
    Left = 336
    Top = 184
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
  object dsStorInfo: TUniDataSource
    AutoEdit = False
    DataSet = QryStorInfo
    Left = 336
    Top = 265
  end
  object QryStorInfo: TUniQuery
    SQL.Strings = (
      'call sp_actstor_proc(:matcode)')
    Left = 240
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'matCode'
        ParamType = ptInputOutput
        Value = 'jian.dao'
      end>
  end
end
inherited FrmMatOrderReport: TFrmMatOrderReport
  Left = 273
  Top = 160
  Caption = #21830#21697#26597#35810'('#36141')'
  ClientWidth = 1137
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1137
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1135
      Height = 48
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 24
        Height = 13
        Caption = #21697#21517
      end
      object Label2: TLabel
        Left = 407
        Top = 20
        Width = 24
        Height = 13
        Caption = #26085#26399
      end
      object Label3: TLabel
        Left = 568
        Top = 24
        Width = 14
        Height = 13
        Caption = '~~'
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
        Properties.OnCloseUp = cxLookupComboBox1PropertiesCloseUp
        TabOrder = 0
        Width = 113
      end
      object cxDateBegin: TcxDateEdit
        Left = 439
        Top = 17
        TabOrder = 1
        Width = 121
      end
      object cxTextMatName: TcxTextEdit
        Left = 160
        Top = 16
        TabOrder = 2
        Width = 121
      end
      object cxTextMatGauge: TcxTextEdit
        Left = 280
        Top = 16
        TabOrder = 3
        Width = 121
      end
      object cxDateEnd: TcxDateEdit
        Left = 583
        Top = 17
        TabOrder = 4
        Width = 121
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 1135
      Height = 359
      Align = alClient
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 1133
        Height = 357
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsQryOrderMat
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#35745':0'
              Kind = skSum
              Column = cxGrid1DBTableView1OrderNum
            end
            item
              Format = #24635#37329#39069':0'
              Kind = skSum
              Column = cxGrid1DBTableView1Amount
            end
            item
              Format = #32479#35745':0'
              Kind = skCount
              Column = cxGrid1DBTableView1SelNo
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Styles.GroupByBox = cxStyle1
          object cxGrid1DBTableView1SelNo: TcxGridDBColumn
            Caption = #24207#21495
            OnGetDataText = cxGrid1DBTableView1SelNoGetDataText
          end
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = #20379#24212#21830
            DataBinding.FieldName = 'sup_name'
            Width = 199
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = #22522#26412#21333#20301
            DataBinding.FieldName = 'MAT_UNIT'
            Width = 74
          end
          object cxGrid1DBTableView1OrderNum: TcxGridDBColumn
            Caption = #24635#25968#37327
            DataBinding.FieldName = 'ORDER_NUM'
            Width = 173
          end
          object cxGrid1DBTableView1InPrice: TcxGridDBColumn
            Caption = #36827#36135#20215
            DataBinding.FieldName = 'PRICE'
            Width = 200
          end
          object cxGrid1DBTableView1Amount: TcxGridDBColumn
            Caption = #24635#37329#39069
            DataBinding.FieldName = 'AMOUNT'
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
    Width = 1137
    inherited tlb1: TToolBar
      Width = 1135
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
  inherited dlgSave1: TSaveDialog
    Left = 136
    Top = 193
  end
  object qryOrderMat: TUniQuery
    SQL.Strings = (
      'SELECT'
      '  a.ORDER_NO,'
      '  a.ORDER_DATE,'
      '  a.SUP_CODE,'
      
        '  (SELECT COMP_NAME FROM kc_comp_base WHERE comp_no=a.SUP_CODE) ' +
        'AS sup_name,'
      '  b.MAT_CODE,'
      '  b.MAT_NAME,'
      '  b.MAT_GAUGE,'
      '  b.MAT_UNIT,'
      '  b.ORDER_NUM,'
      '  b.PRICE,'
      '  b.AMOUNT'
      'FROM pur_order_base a  JOIN pur_order_dtl b ON '
      '    a.ORDER_NO=b.ORDER_NO'
      'WHERE 1=1')
    Left = 496
    Top = 224
    object qryOrderMatORDER_NO: TStringField
      FieldName = 'ORDER_NO'
      Required = True
      Size = 64
    end
    object qryOrderMatORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
    object qryOrderMatSUP_CODE: TStringField
      FieldName = 'SUP_CODE'
      Size = 64
    end
    object qryOrderMatsup_name: TStringField
      FieldName = 'sup_name'
      ReadOnly = True
      Size = 256
    end
    object qryOrderMatMAT_CODE: TStringField
      FieldName = 'MAT_CODE'
      ReadOnly = True
      Size = 64
    end
    object qryOrderMatMAT_NAME: TStringField
      FieldName = 'MAT_NAME'
      ReadOnly = True
      Size = 128
    end
    object qryOrderMatMAT_GAUGE: TStringField
      FieldName = 'MAT_GAUGE'
      ReadOnly = True
      Size = 128
    end
    object qryOrderMatMAT_UNIT: TStringField
      FieldName = 'MAT_UNIT'
      ReadOnly = True
      Size = 32
    end
    object qryOrderMatORDER_NUM: TFloatField
      FieldName = 'ORDER_NUM'
      ReadOnly = True
    end
    object qryOrderMatPRICE: TFloatField
      FieldName = 'PRICE'
      ReadOnly = True
    end
    object qryOrderMatAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      ReadOnly = True
    end
  end
  object dsQryOrderMat: TUniDataSource
    DataSet = qryOrderMat
    Left = 496
    Top = 161
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
  object QryMatInfo: TUniQuery
    SQL.Strings = (
      'select * from kc_matter_base where 1=1')
    Left = 336
    Top = 184
  end
  object dsMatInfo: TUniDataSource
    DataSet = QryMatInfo
    Left = 240
    Top = 184
  end
end

inherited FrmMatSaleRepot: TFrmMatSaleRepot
  Left = 375
  Top = 234
  Caption = #21830#21697#26597#35810'('#38144')'
  ClientWidth = 1097
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1097
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 1095
      Height = 359
      Align = alClient
      TabOrder = 0
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 1093
        Height = 357
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsQrySaleMat
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#35745':0'
              Kind = skCount
              Column = cxGrid1DBTableView1SelNo
            end
            item
              Format = #24635#37329#39069':0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Amount
            end
            item
              Format = #24635#21033#28070':0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Profit
            end
            item
              Format = #24635#25968#37327':0'
              Kind = skSum
              Column = cxGrid1DBTableView1OrderNum
            end
            item
              Format = #24635#21457#31080#25968':0'
              Kind = skSum
              Column = cxGrid1DBTableView1InvoiceNum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Styles.GroupByBox = cxStyle1
          object cxGrid1DBTableView1SelNo: TcxGridDBColumn
            Caption = #24207#21495
            OnGetDataText = cxGrid1DBTableView1SelNoGetDataText
          end
          object cxGrid1DBTableView1CompName: TcxGridDBColumn
            Caption = #23458#25143#21517#31216
            DataBinding.FieldName = 'COMP_NAME'
            Width = 220
          end
          object cxGrid1DBTableView1MatUnit: TcxGridDBColumn
            Caption = #22522#26412#21333#20301
            DataBinding.FieldName = 'MAT_UNIT'
            Width = 80
          end
          object cxGrid1DBTableView1OrderNum: TcxGridDBColumn
            Caption = #24635#25968#37327
            DataBinding.FieldName = 'ORDER_NUM'
            Width = 74
          end
          object cxGrid1DBTableView1InPrice: TcxGridDBColumn
            Caption = #36827#36135#20215
            DataBinding.FieldName = 'STOR_PRICE'
            Width = 100
          end
          object cxGrid1DBTableView1SalePrice: TcxGridDBColumn
            Caption = #38144#21806#20215
            DataBinding.FieldName = 'SALE_PRICE'
            Width = 64
          end
          object cxGrid1DBTableView1Amount: TcxGridDBColumn
            Caption = #37329#39069
            DataBinding.FieldName = 'AMOUNT'
            Width = 115
          end
          object cxGrid1DBTableView1Profit: TcxGridDBColumn
            Caption = #21033#28070
            DataBinding.FieldName = 'SALE_PROFIT'
            Width = 137
          end
          object cxGrid1DBTableView1InvoiceNum: TcxGridDBColumn
            Caption = #24320#31080#25968#37327
            DataBinding.FieldName = 'INVOICE_NUM'
            Width = 185
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1095
      Height = 48
      Align = alTop
      TabOrder = 1
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
        Top = 18
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
        Properties.OnCloseUp = cxLookupMatCodePropertiesCloseUp
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
        Left = 586
        Top = 17
        TabOrder = 4
        Width = 121
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1097
    inherited tlb1: TToolBar
      Width = 1095
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
  object qrySaleMat: TUniQuery
    SQL.Strings = (
      'SELECT '
      '  a.order_no,'
      '  a.order_date,'
      '  a.cust_code,'
      '  c.comp_name,'
      '  b.mat_code,'
      '  b.mat_name,'
      '  b.mat_gauge,'
      '  b.mat_unit,'
      '  b.order_num,'
      '  b.stor_price,'
      '  b.sale_price,'
      '  b.amount,'
      '  b.sale_profit,'
      '  b.invoice_num,'
      '  b.act_amount  '
      'FROM pur_sale_base a '
      'JOIN pur_sale_dtl b ON a.order_no=b.sale_no'
      'JOIN kc_comp_base c ON c.comp_no=a.cust_code'
      'WHERE 1=1')
    Left = 496
    Top = 224
  end
  object dsQrySaleMat: TUniDataSource
    DataSet = qrySaleMat
    Left = 496
    Top = 161
  end
end

inherited FrmSaleReport: TFrmSaleReport
  Left = 224
  Top = 140
  Caption = #38144#21806#21333#25253#34920
  ClientHeight = 462
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Height = 429
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1006
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 577
        Top = 15
        Width = 14
        Height = 13
        Caption = '~~'
      end
      object Label2: TLabel
        Left = 400
        Top = 13
        Width = 48
        Height = 13
        Caption = #21333#25454#26085#26399
      end
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 31
        Height = 13
        Caption = '*'#23458#25143':'
      end
      object Label4: TLabel
        Left = 760
        Top = 16
        Width = 87
        Height = 13
        Caption = #32047#35745#24050#20184#27454#37329#39069':'
      end
      object LblTotalPayAmount: TLabel
        Left = 856
        Top = 16
        Width = 153
        Height = 16
        AutoSize = False
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cxTextSupName: TcxTextEdit
        Left = 211
        Top = 12
        TabOrder = 0
        Width = 174
      end
      object cxDateEnd: TcxDateEdit
        Left = 592
        Top = 10
        TabOrder = 1
        Width = 121
      end
      object cxDateBegin: TcxDateEdit
        Left = 456
        Top = 10
        TabOrder = 2
        Width = 121
      end
      object cxCmpSupCode: TcxLookupComboBox
        Left = 64
        Top = 13
        Properties.KeyFieldNames = 'COMP_NO'
        Properties.ListColumns = <
          item
            Caption = #21378#21830#20195#30721
            FieldName = 'COMP_NO'
          end
          item
            Caption = #21378#21830#21517#31216
            FieldName = 'COMP_NAME'
          end>
        Properties.ListSource = dsQrySupCode
        Properties.OnChange = cxCmpSupCodePropertiesChange
        Properties.OnCloseUp = cxCmpSupCodePropertiesCloseUp
        TabOrder = 3
        Width = 145
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 42
      Width = 1006
      Height = 386
      Align = alClient
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 1004
        Height = 384
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSaleReport
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#37329#39069':0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Amount
            end
            item
              Format = #24635#25968#37327':0'
              Kind = skSum
              Column = cxGrid1DBTableView1OrderNum
            end
            item
              Format = #24635#21033#28070':0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Profit
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Styles.GroupByBox = cxStyle1
          object cxGrid1DBTableView1SelNo: TcxGridDBColumn
            Caption = #24207#21495
            OnGetDataText = cxGrid1DBTableView1SelNoGetDataText
          end
          object cxGrid1DBTableView1OrderDate: TcxGridDBColumn
            Caption = #21333#25454#26085#26399
            DataBinding.FieldName = 'ORDER_DATE'
          end
          object cxGrid1DBTableView1OrderNo: TcxGridDBColumn
            Caption = #21333#25454#32534#21495
            DataBinding.FieldName = 'ORDER_NO'
            Width = 63
          end
          object cxGrid1DBTableView1MatCode: TcxGridDBColumn
            Caption = #31616#30721
            DataBinding.FieldName = 'MAT_CODE'
            Width = 119
          end
          object cxGrid1DBTableView1MatName: TcxGridDBColumn
            Caption = #21830#21697#21517#31216
            DataBinding.FieldName = 'MAT_NAME'
            Width = 101
          end
          object cxGrid1DBTableView1MatGauge: TcxGridDBColumn
            Caption = #35268#26684#22411#21495
            DataBinding.FieldName = 'MAT_GAUGE'
            Width = 180
          end
          object cxGrid1DBTableView1OrderNum: TcxGridDBColumn
            Caption = #25968#37327
            DataBinding.FieldName = 'ORDER_NUM'
            Width = 180
          end
          object cxGrid1DBTableView1Amount: TcxGridDBColumn
            Caption = #37329#39069
            DataBinding.FieldName = 'AMOUNT'
            Width = 180
          end
          object cxGrid1DBTableView1SupName: TcxGridDBColumn
            Caption = #20379#24212#21830#21517#31216
            DataBinding.FieldName = 'sup_name'
            Visible = False
            Width = 120
          end
          object cxGrid1DBTableView1Profit: TcxGridDBColumn
            Caption = #21033#28070
            DataBinding.FieldName = 'SALE_PROFIT'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  inherited pnltop: TPanel
    inherited tlb1: TToolBar
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
        Visible = False
      end
      inherited btnImport: TToolButton
        Visible = False
      end
      inherited btnprint: TToolButton
        Visible = False
      end
    end
  end
  inherited ImageList: TImageList
    Left = 840
    Top = 200
  end
  inherited dsMain: TUniDataSource
    Left = 720
    Top = 153
  end
  inherited TblMain: TUniTable
    Left = 680
    Top = 161
  end
  object dsSaleReport: TUniDataSource
    DataSet = QrySaleReport
    Left = 560
    Top = 224
  end
  object QrySaleReport: TUniQuery
    SQL.Strings = (
      'select'
      '   a.order_no,'
      '   a.order_date,'
      '   a.cust_code,'
      '   c.comp_name sup_name,'
      '   b.mat_code,'
      '   b.mat_name,'
      '   b.mat_gauge,'
      '   b.order_num,'
      '   b.amount,'
      '  b.sale_profit'
      ' from pur_sale_base a join pur_sale_dtl b'
      'on a.order_no=b.sale_no'
      'join kc_comp_base c on c.comp_no=a.cust_code'
      'where a.cust_code=:supCode'
      'and a.order_date>=:orderDateBegin'
      'and a.order_date<=:orderDateEnd'
      'order by a.order_date')
    Left = 560
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'supCode'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'orderDateBegin'
      end
      item
        DataType = ftUnknown
        Name = 'orderDateEnd'
      end>
  end
  object dsQrySupCode: TUniDataSource
    DataSet = QrySupCode
    Left = 416
    Top = 201
  end
  object QrySupCode: TUniQuery
    SQL.Strings = (
      'select * from kc_comp_base')
    Left = 440
    Top = 264
  end
  object QryTemp: TUniQuery
    Left = 520
    Top = 312
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
end

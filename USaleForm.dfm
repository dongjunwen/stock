inherited FrmSaleForm: TFrmSaleForm
  Left = 208
  Top = 117
  Caption = #38144#21806#21333
  ClientHeight = 482
  ClientWidth = 1112
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1112
    Height = 449
    object PanelSearchTop: TPanel
      Left = 1
      Top = 1
      Width = 1110
      Height = 40
      Align = alTop
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 9
        Width = 51
        Height = 13
        Caption = #38144#21806#21333#21495':'
      end
      object Label6: TLabel
        Left = 543
        Top = 7
        Width = 27
        Height = 13
        Caption = #23458#25143':'
      end
      object Label7: TLabel
        Left = 192
        Top = 10
        Width = 63
        Height = 13
        Caption = #38144#21806#21333#26085#26399':'
      end
      object Label8: TLabel
        Left = 389
        Top = 8
        Width = 14
        Height = 13
        Caption = '~~'
      end
      object cxTextSupName: TcxTextEdit
        Left = 722
        Top = 4
        TabOrder = 0
        Width = 225
      end
      object cxTextOrderNo: TcxTextEdit
        Left = 64
        Top = 6
        TabOrder = 1
        Width = 121
      end
      object cxDateOrderDateBegin: TcxDateEdit
        Left = 263
        Top = 6
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 2
        Width = 121
      end
      object cxDateOrderDateEnd: TcxDateEdit
        Left = 407
        Top = 4
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 3
        Width = 121
      end
      object cxCmpSupCode: TcxLookupComboBox
        Left = 575
        Top = 5
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
        TabOrder = 4
        Width = 145
      end
    end
    object PnlLeft: TPanel
      Left = 1
      Top = 41
      Width = 216
      Height = 407
      Align = alLeft
      TabOrder = 1
      object cxGrid2: TcxGrid
        Left = 1
        Top = 1
        Width = 214
        Height = 405
        Align = alClient
        TabOrder = 0
        object cxGrid2DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsQryMain
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGrid2DBTableView1OrderDate: TcxGridDBColumn
            Caption = #38144#21806#21333#26085#26399
            DataBinding.FieldName = 'ORDER_DATE'
            Width = 82
          end
          object cxGrid2DBTableView1OrderNo: TcxGridDBColumn
            Caption = #38144#21806#21333#21495
            DataBinding.FieldName = 'ORDER_NO'
            Width = 82
          end
          object cxGrid2DBTableView1SupCode: TcxGridDBColumn
            Caption = #23458#25143#20195#30721
            DataBinding.FieldName = 'CUST_CODE'
            Width = 82
          end
          object cxGrid2DBTableView1SupName: TcxGridDBColumn
            Caption = #23458#25143#21517#31216
            DataBinding.FieldName = 'COMP_NAME'
            Width = 82
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
    object PnlRight: TPanel
      Left = 217
      Top = 41
      Width = 894
      Height = 407
      Align = alClient
      Caption = 'PnlRight'
      TabOrder = 2
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 1
        Width = 8
        Height = 405
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AutoSnap = True
        MinSize = 50
        Control = PnlLeft
      end
      object Panel2: TPanel
        Left = 9
        Top = 1
        Width = 884
        Height = 405
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 1
        object Panel3: TPanel
          Left = 1
          Top = 217
          Width = 882
          Height = 187
          Align = alClient
          Caption = 'Panel2'
          TabOrder = 0
          object cxGrid1: TcxGrid
            Left = 1
            Top = 1
            Width = 880
            Height = 185
            Align = alClient
            TabOrder = 0
            object cxGrid1DBTableView1: TcxGridDBTableView
              OnDblClick = cxGrid1DBTableView1DblClick
              NavigatorButtons.ConfirmDelete = False
              NavigatorButtons.SaveBookmark.Enabled = False
              NavigatorButtons.SaveBookmark.Visible = False
              NavigatorButtons.GotoBookmark.Visible = False
              DataController.DataSource = dsDtl
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = #24635#35745':0'
                  Kind = skCount
                  Column = cxGrid1DBTableView1ColNum
                end
                item
                  Format = #24635#25968#37327':0'
                  Kind = skSum
                  Column = cxGrid1DBTableView1OrderNum
                end
                item
                  Format = #24635#37329#39069':0.00'
                  Kind = skSum
                  Column = cxGrid1DBTableView1Amout
                end
                item
                  Format = #24635#21033#28070':0.00'
                  Kind = skSum
                  Column = cxGrid1DBTableView1Profit
                end
                item
                  Format = #21457#31080#21512#35745':0'
                  Kind = skSum
                  Column = cxGrid1DBTableView1InvoiceNum
                end
                item
                  Format = #21040#36134#21512#35745':0.00'
                  Kind = skSum
                  Column = cxGrid1DBTableView1ActAmount
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.DeletingConfirmation = False
              OptionsView.Navigator = True
              OptionsView.Footer = True
              OptionsView.Indicator = True
              Styles.FilterBox = cxStyle1
              Styles.GroupByBox = cxStyle1
              object cxGrid1DBTableView1ColNum: TcxGridDBColumn
                Caption = #24207#21495
                OnGetDataText = cxGrid1DBTableView1ColNumGetDataText
                Options.Editing = False
                Width = 56
              end
              object cxGrid1DBTableView1MatCode: TcxGridDBColumn
                Caption = #21830#21697#20195#30721
                DataBinding.FieldName = 'MAT_CODE'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'MAT_CODE'
                Properties.ListColumns = <
                  item
                    Caption = #29289#26009#20195#30721
                    FieldName = 'MAT_CODE'
                  end
                  item
                    Caption = #29289#26009#21517#31216
                    FieldName = 'MAT_NAME'
                  end>
                Properties.ListSource = DsQryMat
                Properties.OnValidate = cxGrid1DBTableView1MatCodePropertiesValidate
                Width = 86
              end
              object cxGrid1DBTableView1MatName: TcxGridDBColumn
                Caption = #21830#21697#21517#31216
                DataBinding.FieldName = 'MAT_NAME'
                Width = 98
              end
              object cxGrid1DBTableView1MatGauge: TcxGridDBColumn
                Caption = #35268#26684#22411#21495
                DataBinding.FieldName = 'MAT_GAUGE'
                Width = 113
              end
              object cxGrid1DBTableView1MatUnit: TcxGridDBColumn
                DataBinding.FieldName = 'MAT_UNIT'
                Width = 38
              end
              object cxGrid1DBTableView1OrderNum: TcxGridDBColumn
                DataBinding.FieldName = 'ORDER_NUM'
                Options.Editing = False
              end
              object cxGrid1DBTableView1StorPrice: TcxGridDBColumn
                DataBinding.FieldName = 'STOR_PRICE'
              end
              object cxGrid1DBTableView1SalePrice: TcxGridDBColumn
                DataBinding.FieldName = 'SALE_PRICE'
              end
              object cxGrid1DBTableView1Amout: TcxGridDBColumn
                DataBinding.FieldName = 'AMOUNT'
                Options.Editing = False
                Width = 69
              end
              object cxGrid1DBTableView1Profit: TcxGridDBColumn
                DataBinding.FieldName = 'SALE_PROFIT'
                Options.Editing = False
                Width = 70
              end
              object cxGrid1DBTableView1InvoiceNum: TcxGridDBColumn
                DataBinding.FieldName = 'INVOICE_NUM'
                Width = 71
              end
              object cxGrid1DBTableView1ActAmount: TcxGridDBColumn
                DataBinding.FieldName = 'ACT_AMOUNT'
                Width = 77
              end
              object cxGrid1DBTableView1MatType: TcxGridDBColumn
                Caption = #29289#26009#31867#22411
                DataBinding.FieldName = 'matType'
                Visible = False
              end
              object cxGrid1DBTableView1StorOutNo: TcxGridDBColumn
                DataBinding.FieldName = 'STOR_OUT_NO'
                Visible = False
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
        end
        object PnlData: TPanel
          Left = 1
          Top = 1
          Width = 882
          Height = 216
          Align = alTop
          TabOrder = 1
          object Label9: TLabel
            Left = 193
            Top = 179
            Width = 51
            Height = 13
            Caption = #26412#31508#36135#27454':'
          end
          object Label4: TLabel
            Left = 537
            Top = 109
            Width = 39
            Height = 13
            Caption = #32852#31995#20154':'
          end
          object Label3: TLabel
            Left = 546
            Top = 77
            Width = 27
            Height = 13
            Caption = #22320#22336':'
          end
          object Label16: TLabel
            Left = 207
            Top = 114
            Width = 27
            Height = 13
            Caption = #30005#35805':'
          end
          object Label15: TLabel
            Left = 202
            Top = 146
            Width = 39
            Height = 13
            Caption = #38144#21806#21592':'
          end
          object Label14: TLabel
            Left = 189
            Top = 52
            Width = 51
            Height = 13
            Caption = #21333#25454#26085#26399':'
          end
          object Label13: TLabel
            Left = 525
            Top = 44
            Width = 51
            Height = 13
            Caption = #21333#25454#32534#21495':'
          end
          object Label10: TLabel
            Left = 396
            Top = 1
            Width = 123
            Height = 40
            Caption = #38144#21806#21333
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -40
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 201
            Top = 85
            Width = 27
            Height = 13
            Caption = #23458#25143':'
          end
          object Label2: TLabel
            Left = 522
            Top = 143
            Width = 51
            Height = 13
            Caption = #29289#27969#21333#21495':'
          end
          object Label11: TLabel
            Left = 527
            Top = 175
            Width = 51
            Height = 13
            Caption = #26412#31508#21033#28070':'
          end
          object cxDBTextContact: TcxDBTextEdit
            Left = 582
            Top = 108
            DataBinding.DataField = 'CONTACT'
            DataBinding.DataSource = dsMain
            TabOrder = 0
            Width = 128
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 246
            Top = 175
            DataBinding.DataField = 'AMOUNT'
            DataBinding.DataSource = dsMain
            Properties.ReadOnly = True
            TabOrder = 1
            Width = 128
          end
          object cxDBTextAddr: TcxDBTextEdit
            Left = 582
            Top = 73
            DataBinding.DataField = 'ADDRESS'
            DataBinding.DataSource = dsMain
            TabOrder = 2
            Width = 128
          end
          object cxDBTextTel: TcxDBTextEdit
            Left = 246
            Top = 110
            DataBinding.DataField = 'TEL'
            DataBinding.DataSource = dsMain
            TabOrder = 3
            Width = 128
          end
          object cxDBTextOrderNo: TcxDBTextEdit
            Left = 583
            Top = 40
            DataBinding.DataField = 'ORDER_NO'
            DataBinding.DataSource = dsMain
            Properties.ReadOnly = True
            TabOrder = 4
            Width = 128
          end
          object cxDBLookupSupCode: TcxDBLookupComboBox
            Left = 247
            Top = 78
            DataBinding.DataField = 'CUST_CODE'
            DataBinding.DataSource = dsMain
            Properties.KeyFieldNames = 'COMP_NO'
            Properties.ListColumns = <
              item
                Caption = #20379#24212#21830#20195#30721
                FieldName = 'COMP_NO'
              end
              item
                Caption = #21517#31216
                FieldName = 'COMP_NAME'
              end>
            Properties.ListSource = dsQrySupCode
            Properties.OnCloseUp = cxDBLookupSupCodePropertiesCloseUp
            TabOrder = 5
            Width = 130
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 248
            Top = 48
            DataBinding.DataField = 'ORDER_DATE'
            DataBinding.DataSource = dsMain
            TabOrder = 6
            Width = 129
          end
          object Memo1: TMemo
            Left = 16
            Top = 8
            Width = 169
            Height = 201
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            Lines.Strings = (
              'Memo1')
            ScrollBars = ssBoth
            TabOrder = 7
            Visible = False
          end
          object cxDBTextLogistNum: TcxDBTextEdit
            Left = 582
            Top = 140
            DataBinding.DataField = 'LOGIST_NUM'
            DataBinding.DataSource = dsMain
            TabOrder = 8
            Width = 128
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 582
            Top = 172
            DataBinding.DataField = 'PROFIT'
            DataBinding.DataSource = dsMain
            Properties.ReadOnly = True
            TabOrder = 9
            Width = 128
          end
          object cxDBLookupEmpCode: TcxDBLookupComboBox
            Left = 248
            Top = 144
            DataBinding.DataField = 'SALER'
            DataBinding.DataSource = dsMain
            Properties.KeyFieldNames = 'EMP_NO'
            Properties.ListColumns = <
              item
                Caption = #32534#21495
                FieldName = 'EMP_NO'
              end
              item
                Caption = #22995#21517
                FieldName = 'EMP_NAME'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsEmp
            TabOrder = 10
            Width = 129
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 374
            Top = 78
            DataBinding.DataField = 'CUST_NAME'
            DataBinding.DataSource = dsMain
            TabOrder = 11
            Width = 128
          end
        end
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1112
    inherited tlb1: TToolBar
      Width = 1110
      inherited btnserch: TToolButton
        OnClick = btnserchClick
      end
      inherited btnfresh: TToolButton
        Wrap = False
      end
      inherited btnFirst: TToolButton
        Left = 539
        Top = 2
        Wrap = True
      end
      inherited btnBefore: TToolButton
        Left = 0
      end
      inherited btnNext: TToolButton
        Left = 77
      end
      inherited btnLast: TToolButton
        Left = 154
      end
      inherited btnImport: TToolButton
        Left = 231
        Visible = False
      end
      inherited btnExport: TToolButton
        Left = 308
      end
      inherited btnprint: TToolButton
        Left = 385
      end
      object btnStorOut: TToolButton
        Left = 462
        Top = 24
        Caption = #20986#24211#21333
        ImageIndex = 93
        OnClick = btnStorOutClick
      end
    end
  end
  inherited dsMain: TUniDataSource
    Left = 320
    Top = 105
  end
  inherited TblMain: TUniTable
    TableName = 'pur_sale_base'
    MasterFields = 'ORDER_NO'
    DetailFields = 'ORDER_NO'
    MasterSource = dsQryMain
    OnNewRecord = TblMainNewRecord
    Left = 264
    Top = 97
    object TblMainORDER_NO: TStringField
      FieldName = 'ORDER_NO'
      Required = True
      Size = 64
    end
    object TblMainORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
    object TblMainCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 64
    end
    object TblMainADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object TblMainTEL: TStringField
      FieldName = 'TEL'
      Size = 32
    end
    object TblMainCONTACT: TStringField
      FieldName = 'CONTACT'
      Size = 64
    end
    object TblMainSALER: TStringField
      FieldName = 'SALER'
      Size = 128
    end
    object TblMainAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object TblMainPROFIT: TFloatField
      FieldName = 'PROFIT'
    end
    object TblMainLOGIST_NUM: TStringField
      FieldName = 'LOGIST_NUM'
      Size = 64
    end
    object TblMainINSERT_TIME: TDateTimeField
      FieldName = 'INSERT_TIME'
    end
    object TblMainLAST_UPT_TIME: TDateTimeField
      FieldName = 'LAST_UPT_TIME'
    end
    object TblMainMEMO: TStringField
      FieldName = 'MEMO'
      Size = 1024
    end
    object TblMainCUST_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CUST_NAME'
      LookupDataSet = QrySupCode
      LookupKeyFields = 'COMP_NO'
      LookupResultField = 'COMP_NAME'
      KeyFields = 'CUST_CODE'
      Lookup = True
    end
  end
  inherited TblDtl: TUniTable
    TableName = 'pur_sale_dtl'
    MasterFields = 'ORDER_NO'
    DetailFields = 'SALE_NO'
    BeforeDelete = TblDtlBeforeDelete
    OnNewRecord = TblDtlNewRecord
    Left = 264
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'ORDER_NO'
        ParamType = ptInput
      end>
    object TblDtlSALE_NO: TStringField
      DisplayLabel = #38144#21806#21333#21495
      FieldName = 'SALE_NO'
      Required = True
      Size = 64
    end
    object TblDtlSTOR_OUT_NO: TStringField
      DisplayLabel = #20986#24211#32534#21495
      FieldName = 'STOR_OUT_NO'
      Required = True
      Size = 64
    end
    object TblDtlMAT_CODE: TStringField
      DisplayLabel = #29289#26009#32534#21495
      FieldName = 'MAT_CODE'
      Size = 64
    end
    object TblDtlMAT_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'MAT_NAME'
      Size = 128
    end
    object TblDtlMAT_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'MAT_UNIT'
      Size = 32
    end
    object TblDtlORDER_NUM: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'ORDER_NUM'
    end
    object TblDtlSTOR_PRICE: TFloatField
      DisplayLabel = #36827#36135#20215
      FieldName = 'STOR_PRICE'
    end
    object TblDtlSALE_PRICE: TFloatField
      DisplayLabel = #38144#21806#20215
      FieldName = 'SALE_PRICE'
    end
    object TblDtlAMOUNT: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'AMOUNT'
    end
    object TblDtlSALE_PROFIT: TFloatField
      DisplayLabel = #21033#28070
      FieldName = 'SALE_PROFIT'
    end
    object TblDtlINVOICE_NUM: TFloatField
      DisplayLabel = #21457#31080#25968#37327
      FieldName = 'INVOICE_NUM'
    end
    object TblDtlACT_AMOUNT: TFloatField
      DisplayLabel = #21040#36134#37329#39069
      FieldName = 'ACT_AMOUNT'
    end
    object TblDtlMEMO: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'MEMO'
      Size = 1024
    end
    object TblDtlmatType: TStringField
      FieldKind = fkLookup
      FieldName = 'matType'
      LookupDataSet = QryMatCode
      LookupKeyFields = 'MAT_CODE'
      LookupResultField = 'MAT_TYPE'
      KeyFields = 'MAT_CODE'
      Lookup = True
    end
    object TblDtlMAT_GAUGE: TStringField
      FieldName = 'MAT_GAUGE'
      Size = 128
    end
  end
  inherited dsDtl: TUniDataSource
    Left = 328
    Top = 169
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 608
    Top = 392
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveCaption
    end
  end
  object dsQryMain: TUniDataSource
    DataSet = QryMain
    Left = 416
    Top = 369
  end
  object QryMain: TUniQuery
    SQL.Strings = (
      'SELECT a.`ORDER_NO`,a.`ORDER_DATE`,a.`CUST_CODE`,b.`COMP_NAME`'
      'FROM pur_sale_base a '
      'left JOIN  `kc_comp_base` b ON a.`CUST_CODE`=b.`COMP_NO`'
      ''
      'ORDER BY a.ORDER_DATE DESC '
      'LIMIT 1,1000')
    Left = 352
    Top = 368
    object QryMainORDER_NO: TStringField
      FieldName = 'ORDER_NO'
      Required = True
      Size = 64
    end
    object QryMainORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
    object QryMainCOMP_NAME: TStringField
      FieldName = 'COMP_NAME'
      ReadOnly = True
      Size = 256
    end
    object QryMainCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 64
    end
  end
  object dsQrySupCode: TUniDataSource
    DataSet = QrySupCode
    Left = 968
    Top = 81
  end
  object QrySupCode: TUniQuery
    SQL.Strings = (
      'select * from kc_comp_base')
    Left = 1032
    Top = 80
  end
  object DsQryMat: TUniDataSource
    DataSet = QryMatCode
    Left = 952
    Top = 153
  end
  object QryMatCode: TUniQuery
    SQL.Strings = (
      'select * from kc_matter_base')
    Left = 1000
    Top = 160
    object QryMatCodeMAT_CODE: TStringField
      FieldName = 'MAT_CODE'
      Required = True
      Size = 64
    end
    object QryMatCodeMAT_NAME: TStringField
      FieldName = 'MAT_NAME'
      Size = 128
    end
    object QryMatCodeMAT_GAUGE: TStringField
      FieldName = 'MAT_GAUGE'
      Size = 128
    end
    object QryMatCodeMAT_UNIT: TStringField
      FieldName = 'MAT_UNIT'
      Size = 24
    end
    object QryMatCodeMAT_TYPE: TStringField
      FieldName = 'MAT_TYPE'
      Size = 24
    end
    object QryMatCodeMEMO: TStringField
      FieldName = 'MEMO'
      Size = 1024
    end
  end
  object QryTemp: TUniQuery
    Left = 1032
    Top = 240
  end
  object QryEmp: TUniQuery
    SQL.Strings = (
      'select * from kc_emp_base')
    Left = 496
    Top = 368
  end
  object dsEmp: TUniDataSource
    DataSet = QryEmp
    Left = 560
    Top = 377
  end
end

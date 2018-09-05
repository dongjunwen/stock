inherited FrmOrderForm: TFrmOrderForm
  Left = 385
  Top = 159
  Caption = #36141#36135#21333
  ClientHeight = 515
  ClientWidth = 1172
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1172
    Height = 482
    object PnlLeft: TPanel
      Left = 1
      Top = 42
      Width = 152
      Height = 439
      Align = alLeft
      Caption = 'PnlLeft'
      TabOrder = 0
      object cxGrid2: TcxGrid
        Left = 1
        Top = 1
        Width = 150
        Height = 437
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
            Caption = #36141#36135#21333#26085#26399
            DataBinding.FieldName = 'ORDER_DATE'
            Width = 82
          end
          object cxGrid2DBTableView1OrderNo: TcxGridDBColumn
            Caption = #36141#36135#21333#21495
            DataBinding.FieldName = 'ORDER_NO'
            Width = 82
          end
          object cxGrid2DBTableView1SupCode: TcxGridDBColumn
            Caption = #21378#21830#20195#30721
            DataBinding.FieldName = 'SUP_CODE'
            Width = 82
          end
          object cxGrid2DBTableView1SupName: TcxGridDBColumn
            Caption = #21378#21830#21517#31216
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
      Left = 153
      Top = 42
      Width = 1018
      Height = 439
      Align = alClient
      Caption = 'PnlRight'
      TabOrder = 1
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 1
        Width = 8
        Height = 437
        HotZoneClassName = 'TcxMediaPlayer9Style'
        PositionAfterOpen = 200
        MinSize = 50
        Control = PnlLeft
      end
      object Panel1: TPanel
        Left = 9
        Top = 1
        Width = 1008
        Height = 437
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 1
        object Panel2: TPanel
          Left = 1
          Top = 193
          Width = 1006
          Height = 243
          Align = alClient
          Caption = 'Panel2'
          TabOrder = 0
          object cxGrid1: TcxGrid
            Left = 1
            Top = 1
            Width = 1004
            Height = 241
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
                  Column = cxGrid1DBTableView1Amount
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.ImmediateEditor = False
              OptionsData.DeletingConfirmation = False
              OptionsView.Navigator = True
              OptionsView.Footer = True
              OptionsView.Indicator = True
              Styles.FilterBox = cxStyle1
              Styles.Group = cxStyle2
              Styles.GroupByBox = cxStyle2
              object cxGrid1DBTableView1ColNum: TcxGridDBColumn
                Caption = #24207#21495
                OnGetDataText = cxGrid1DBTableView1ColNumGetDataText
                Options.Editing = False
                Width = 99
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
                Width = 124
              end
              object cxGrid1DBTableView1MatName: TcxGridDBColumn
                Caption = #21830#21697#21517#31216
                DataBinding.FieldName = 'MAT_NAME'
                Width = 115
              end
              object cxGrid1DBTableView1MatGauge: TcxGridDBColumn
                Caption = #35268#26684#22411#21495
                DataBinding.FieldName = 'MAT_GAUGE'
                Width = 129
              end
              object cxGrid1DBTableView1MatUnit: TcxGridDBColumn
                Caption = #21333#20301
                DataBinding.FieldName = 'MAT_UNIT'
                Width = 78
              end
              object cxGrid1DBTableView1OrderNum: TcxGridDBColumn
                Caption = #25968#37327
                DataBinding.FieldName = 'ORDER_NUM'
                Options.Editing = False
                Width = 80
              end
              object cxGrid1DBTableView1Price: TcxGridDBColumn
                Caption = #36827#36135#20215
                DataBinding.FieldName = 'PRICE'
                Width = 94
              end
              object cxGrid1DBTableView1Amount: TcxGridDBColumn
                Caption = #37329#39069
                DataBinding.FieldName = 'AMOUNT'
                Options.Editing = False
                Width = 90
              end
              object cxGrid1DBTableView1Memo: TcxGridDBColumn
                Caption = #22791#27880
                DataBinding.FieldName = 'MEMO'
                Width = 259
              end
              object cxGrid1DBTableView1StorInNo: TcxGridDBColumn
                DataBinding.FieldName = 'STOR_IN_NO'
                Visible = False
              end
              object cxGrid1DBTableView1matType: TcxGridDBColumn
                Caption = #29289#26009#31867#22411
                DataBinding.FieldName = 'matType'
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
          Width = 1006
          Height = 192
          Align = alTop
          TabOrder = 1
          object Label9: TLabel
            Left = 632
            Top = 60
            Width = 39
            Height = 13
            Caption = #24635#36135#27454':'
          end
          object Label4: TLabel
            Left = 633
            Top = 102
            Width = 39
            Height = 13
            Caption = #32852#31995#20154':'
          end
          object Label3: TLabel
            Left = 642
            Top = 144
            Width = 27
            Height = 13
            Caption = #22320#22336':'
          end
          object Label2: TLabel
            Left = 420
            Top = 103
            Width = 51
            Height = 13
            Caption = #38134#34892#36134#21495':'
          end
          object Label16: TLabel
            Left = 439
            Top = 143
            Width = 27
            Height = 13
            Caption = #30005#35805':'
          end
          object Label15: TLabel
            Left = 231
            Top = 146
            Width = 27
            Height = 13
            Caption = #21457#31080':'
          end
          object Label14: TLabel
            Left = 207
            Top = 63
            Width = 51
            Height = 13
            Caption = #21333#25454#26085#26399':'
          end
          object Label13: TLabel
            Left = 421
            Top = 60
            Width = 51
            Height = 13
            Caption = #21333#25454#32534#21495':'
          end
          object Label10: TLabel
            Left = 420
            Top = 1
            Width = 123
            Height = 40
            Caption = #36141#36135#21333
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -40
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 220
            Top = 107
            Width = 39
            Height = 13
            Caption = #20379#24212#21830':'
          end
          object cxDBTextContact: TcxDBTextEdit
            Left = 678
            Top = 101
            DataBinding.DataField = 'CONTACT'
            DataBinding.DataSource = dsMain
            TabOrder = 0
            Width = 128
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 678
            Top = 60
            DataBinding.DataField = 'AMOUNT'
            DataBinding.DataSource = dsMain
            Properties.ReadOnly = True
            TabOrder = 1
            Width = 128
          end
          object cxDBTextBankAcct: TcxDBTextEdit
            Left = 478
            Top = 99
            DataBinding.DataField = 'COMP_ACCT'
            DataBinding.DataSource = dsMain
            TabOrder = 3
            Width = 128
          end
          object cxDBTextAddr: TcxDBTextEdit
            Left = 678
            Top = 140
            DataBinding.DataField = 'ADDRESS'
            DataBinding.DataSource = dsMain
            TabOrder = 4
            Width = 128
          end
          object cxDBTextTel: TcxDBTextEdit
            Left = 478
            Top = 141
            DataBinding.DataField = 'TEL'
            DataBinding.DataSource = dsMain
            TabOrder = 5
            Width = 128
          end
          object cxDBTextInvoiceNum: TcxDBTextEdit
            Left = 267
            Top = 143
            DataBinding.DataField = 'INVOICE_NUM'
            DataBinding.DataSource = dsMain
            TabOrder = 2
            Width = 130
          end
          object cxDBTextOrderNo: TcxDBTextEdit
            Left = 479
            Top = 56
            DataBinding.DataField = 'ORDER_NO'
            DataBinding.DataSource = dsMain
            Properties.ReadOnly = True
            TabOrder = 6
            Width = 128
          end
          object cxDBLookupSupCode: TcxDBLookupComboBox
            Left = 269
            Top = 93
            DataBinding.DataField = 'SUP_CODE'
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
            TabOrder = 7
            Width = 129
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 266
            Top = 59
            DataBinding.DataField = 'ORDER_DATE'
            DataBinding.DataSource = dsMain
            TabOrder = 8
            Width = 136
          end
          object Memo1: TMemo
            Left = 16
            Top = 8
            Width = 49
            Height = 177
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            Lines.Strings = (
              'Memo1')
            ScrollBars = ssBoth
            TabOrder = 9
            Visible = False
          end
          object cxDBTextCompName: TcxDBTextEdit
            Left = 269
            Top = 112
            DataBinding.DataField = 'SUP_NAME'
            DataBinding.DataSource = dsMain
            TabOrder = 10
            Width = 128
          end
        end
      end
    end
    object PanelSearchTop: TPanel
      Left = 1
      Top = 1
      Width = 1170
      Height = 41
      Align = alTop
      TabOrder = 2
      object Label5: TLabel
        Left = 16
        Top = 11
        Width = 39
        Height = 13
        Caption = #35746#21333#21495':'
      end
      object Label6: TLabel
        Left = 520
        Top = 7
        Width = 27
        Height = 13
        Caption = #21378#21830':'
      end
      object Label7: TLabel
        Left = 192
        Top = 10
        Width = 51
        Height = 13
        Caption = #35746#21333#26085#26399':'
      end
      object Label8: TLabel
        Left = 374
        Top = 8
        Width = 14
        Height = 13
        Caption = '~~'
      end
      object cxTextSupName: TcxTextEdit
        Left = 699
        Top = 4
        TabOrder = 0
        Width = 225
      end
      object cxTextOrderNo: TcxTextEdit
        Left = 64
        Top = 8
        TabOrder = 1
        Width = 121
      end
      object cxDateOrderDateBegin: TcxDateEdit
        Left = 248
        Top = 6
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 2
        Width = 121
      end
      object cxDateOrderDateEnd: TcxDateEdit
        Left = 392
        Top = 4
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 3
        Width = 121
      end
      object cxCmpSupCode: TcxLookupComboBox
        Left = 552
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
  end
  inherited pnltop: TPanel
    Width = 1172
    inherited tlb1: TToolBar
      Width = 1170
      inherited btnserch: TToolButton
        OnClick = btnserchClick
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
      end
      inherited btnprint: TToolButton
        Left = 1001
        Top = 2
      end
      object BtnSN: TToolButton
        Left = 1078
        Top = 2
        Caption = #20837#24211#21333
        ImageIndex = 93
        OnClick = BtnSNClick
      end
    end
  end
  inherited ImageList: TImageList
    Left = 936
    Top = 240
  end
  inherited dsMain: TUniDataSource
    Left = 584
    Top = 401
  end
  inherited TblMain: TUniTable
    TableName = 'pur_order_base'
    MasterSource = dsQryMain
    MasterFields = 'order_no'
    DetailFields = 'ORDER_NO'
    OnNewRecord = TblMainNewRecord
    Left = 600
    Top = 345
    object TblMainORDER_NO: TStringField
      FieldName = 'ORDER_NO'
      Required = True
      Size = 64
    end
    object TblMainORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
    object TblMainSUP_CODE: TStringField
      FieldName = 'SUP_CODE'
      Size = 64
    end
    object TblMainINVOICE_NUM: TStringField
      FieldName = 'INVOICE_NUM'
      Size = 128
    end
    object TblMainAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object TblMainCOMP_ACCT: TStringField
      FieldName = 'COMP_ACCT'
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
    object TblMainSUP_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SUP_NAME'
      LookupDataSet = QrySupCode
      LookupKeyFields = 'COMP_NO'
      LookupResultField = 'COMP_NAME'
      KeyFields = 'SUP_CODE'
      Lookup = True
    end
  end
  inherited dlgSave1: TSaveDialog
    Left = 272
    Top = 97
  end
  inherited TblDtl: TUniTable
    TableName = 'pur_order_dtl'
    MasterFields = 'order_no'
    DetailFields = 'ORDER_NO'
    BeforeDelete = TblDtlBeforeDelete
    OnNewRecord = TblDtlNewRecord
    Left = 688
    Top = 345
    object TblDtlORDER_NO: TStringField
      FieldName = 'ORDER_NO'
      Required = True
      Size = 64
    end
    object TblDtlSTOR_IN_NO: TStringField
      FieldName = 'STOR_IN_NO'
      Required = True
      Size = 64
    end
    object TblDtlMAT_CODE: TStringField
      FieldName = 'MAT_CODE'
      Size = 64
    end
    object TblDtlMAT_NAME: TStringField
      FieldName = 'MAT_NAME'
      Size = 128
    end
    object TblDtlMAT_UNIT: TStringField
      FieldName = 'MAT_UNIT'
      Size = 32
    end
    object TblDtlORDER_NUM: TFloatField
      FieldName = 'ORDER_NUM'
    end
    object TblDtlPRICE: TFloatField
      FieldName = 'PRICE'
      OnChange = TblDtlPRICEChange
    end
    object TblDtlAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object TblDtlMEMO: TStringField
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
    Left = 688
    Top = 401
  end
  object QryMain: TUniQuery
    SQL.Strings = (
      'select a.`order_no`,a.`order_date`,a.`sup_code`,b.`comp_name`'
      'from pur_order_base a '
      'join  `kc_comp_base` b on a.`sup_code`=b.`comp_no`'
      ''
      'order by a.order_date desc '
      'limit 1,1000')
    Left = 320
    Top = 368
    object QryMainORDER_NO: TStringField
      FieldName = 'ORDER_NO'
      Required = True
      Size = 64
    end
    object QryMainORDER_DATE: TDateField
      FieldName = 'ORDER_DATE'
    end
    object QryMainSUP_CODE: TStringField
      FieldName = 'SUP_CODE'
      Size = 64
    end
    object QryMainCOMP_NAME: TStringField
      FieldName = 'COMP_NAME'
      ReadOnly = True
      Size = 256
    end
  end
  object dsQryMain: TUniDataSource
    DataSet = QryMain
    Left = 384
    Top = 369
  end
  object QrySupCode: TUniQuery
    SQL.Strings = (
      'select * from kc_comp_base')
    Left = 1032
    Top = 80
  end
  object dsQrySupCode: TUniDataSource
    DataSet = QrySupCode
    Left = 968
    Top = 81
  end
  object DsQryMat: TUniDataSource
    DataSet = QryMatCode
    Left = 1016
    Top = 161
  end
  object QryMatCode: TUniQuery
    SQL.Strings = (
      'select * from kc_matter_base')
    Left = 1080
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
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveCaption
    end
  end
  object QryTemp: TUniQuery
    Left = 488
    Top = 360
  end
end

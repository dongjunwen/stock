inherited FrmStorValid: TFrmStorValid
  Left = 419
  Top = 283
  Caption = #20020#26399#26597#35810
  ClientWidth = 1136
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1136
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1134
      Height = 407
      Align = alClient
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 1132
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
          Left = 416
          Top = 21
          Width = 66
          Height = 13
          Caption = #20020#26399#26102#38388'('#26376')'
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
        object cxSpinEdit1: TcxSpinEdit
          Left = 488
          Top = 18
          TabOrder = 3
          Value = 13
          Width = 73
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 49
        Width = 1132
        Height = 357
        Align = alClient
        TabOrder = 1
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 1130
          Height = 355
          Align = alClient
          Caption = 'Panel3'
          TabOrder = 0
          object cxGrid1: TcxGrid
            Left = 1
            Top = 1
            Width = 1128
            Height = 353
            Align = alClient
            TabOrder = 0
            object cxGrid1DBTableView1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsStorInfo
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = #24635#35745':0'
                  Kind = skCount
                  Column = cxGrid1DBTableView1SelNo
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsView.Footer = True
              OptionsView.Indicator = True
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
              object cxGrid1DBTableView1ValidDate: TcxGridDBColumn
                Caption = #21040#26399#26085#26399
                DataBinding.FieldName = 'VALIDATE_DATE'
              end
              object cxGrid1DBTableView1BSnNo: TcxGridDBColumn
                Caption = 'SN'#21495
                DataBinding.FieldName = 'BSN_NO'
                Width = 95
              end
              object cxGrid1DBTableView1Memo: TcxGridDBColumn
                Caption = #22791#27880
                DataBinding.FieldName = 'MEMO'
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
  end
  inherited pnltop: TPanel
    Width = 1136
    inherited tlb1: TToolBar
      Width = 1134
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
    Filter = '*.xls|*.xls'
  end
  object QryStorInfo: TUniQuery
    SQL.Strings = (
      'call SP_STORVALID_PROC(:matcode,:validMonth)')
    Left = 240
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'matCode'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'validMonth'
      end>
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
  object dsStorInfo: TUniDataSource
    AutoEdit = False
    DataSet = QryStorInfo
    Left = 336
    Top = 265
  end
end

inherited FrmMatInfo: TFrmMatInfo
  Left = 231
  Top = 164
  Caption = #29289#26009#20449#24687
  ClientHeight = 467
  ClientWidth = 1092
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1092
    Height = 434
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 1090
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 9
        Top = 16
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #29289#26009#32534#30721
      end
      object lbl2: TLabel
        Left = 211
        Top = 16
        Width = 62
        Height = 13
        AutoSize = False
        Caption = #29289#26009#21517#31216
      end
      object edtCode: TEdit
        Left = 72
        Top = 12
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object edtValue: TEdit
        Left = 272
        Top = 12
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 42
      Width = 1090
      Height = 391
      Align = alClient
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 1088
        Height = 389
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsMain
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#35745':0'
              Kind = skCount
              Column = cxGrid1DBTableView1MatNo
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Content = cxStyle1
          Styles.ContentOdd = cxStyle3
          Styles.Selection = cxStyle2
          Styles.GroupByBox = cxStyle3
          Styles.Header = cxStyle1
          object cxGrid1DBTableView1MatNo: TcxGridDBColumn
            DataBinding.FieldName = 'MAT_CODE'
          end
          object cxGrid1DBTableView1MatName: TcxGridDBColumn
            DataBinding.FieldName = 'MAT_NAME'
          end
          object cxGrid1DBTableView1MatGauge: TcxGridDBColumn
            DataBinding.FieldName = 'MAT_GAUGE'
          end
          object cxGrid1DBTableView1MatUnit: TcxGridDBColumn
            DataBinding.FieldName = 'MAT_UNIT'
          end
          object cxGrid1DBTableView1MatType: TcxGridDBColumn
            Caption = #31649#29702#31867#22411
            DataBinding.FieldName = 'MAT_TYPE'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              'SN'
              #25209#21495)
          end
          object cxGrid1DBTableView1Memo: TcxGridDBColumn
            DataBinding.FieldName = 'MEMO'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1092
    inherited tlb1: TToolBar
      Width = 1090
      inherited btnserch: TToolButton
        OnClick = btnserchClick
      end
      inherited btnImport: TToolButton
        Visible = False
      end
      inherited btnExport: TToolButton
        Visible = False
      end
      inherited btnprint: TToolButton
        ImageIndex = 152
        Wrap = False
        Visible = False
      end
    end
  end
  inherited ImageList: TImageList
    Left = 880
    Top = 152
  end
  inherited dsMain: TUniDataSource
    Left = 336
    Top = 121
  end
  inherited TblMain: TUniTable
    TableName = 'kc_matter_base'
    Left = 384
    Top = 193
    object TblMainMAT_CODE: TStringField
      DisplayLabel = #29289#26009#32534#21495
      DisplayWidth = 37
      FieldName = 'MAT_CODE'
      Required = True
      Size = 64
    end
    object TblMainMAT_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      DisplayWidth = 37
      FieldName = 'MAT_NAME'
      Size = 128
    end
    object TblMainMAT_GAUGE: TStringField
      DisplayLabel = #35268#26684#22411#21495
      DisplayWidth = 27
      FieldName = 'MAT_GAUGE'
      Size = 128
    end
    object TblMainMAT_UNIT: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 35
      FieldName = 'MAT_UNIT'
      Size = 24
    end
    object TblMainMAT_TYPE: TStringField
      DisplayLabel = #29289#26009#31867#22411
      DisplayWidth = 12
      FieldName = 'MAT_TYPE'
      Size = 24
    end
    object TblMainMEMO: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 42
      FieldName = 'MEMO'
      Size = 1024
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clTeal
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end

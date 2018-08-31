inherited FrmCompBase: TFrmCompBase
  Left = 280
  Top = 166
  Caption = #20844#21496#22522#26412#36164#26009
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1079
      Height = 48
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #20844#21496#20195#30721
      end
      object Label2: TLabel
        Left = 208
        Top = 16
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #20844#21496#21517#31216
      end
      object EdtCompCode: TEdit
        Left = 80
        Top = 16
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object EdtCompName: TEdit
        Left = 264
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
      Width = 1079
      Height = 359
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1077
        Height = 357
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
            FieldName = 'COMP_NO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMP_NAME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOME_PAGE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMP_PRESENT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADDRESS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTACT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOBILE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMP_MAIL_ADDR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPEN_BANK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMP_ACCT'
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
        Width = 1077
        Height = 357
        Align = alClient
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsMain
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#35745':0'
              Kind = skCount
              Column = cxGrid1DBTableView1Column1
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Content = cxStyle2
          Styles.ContentOdd = cxStyle3
          Styles.Selection = cxStyle4
          Styles.GroupByBox = cxStyle1
          Styles.Header = cxStyle2
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            DataBinding.FieldName = 'COMP_NO'
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            DataBinding.FieldName = 'COMP_NAME'
          end
          object cxGrid1DBTableView1Column3: TcxGridDBColumn
            DataBinding.FieldName = 'HOME_PAGE'
          end
          object cxGrid1DBTableView1Column4: TcxGridDBColumn
            DataBinding.FieldName = 'COMP_PRESENT'
          end
          object cxGrid1DBTableView1Column5: TcxGridDBColumn
            DataBinding.FieldName = 'ADDRESS'
          end
          object cxGrid1DBTableView1Column6: TcxGridDBColumn
            DataBinding.FieldName = 'TEL'
          end
          object cxGrid1DBTableView1Column7: TcxGridDBColumn
            DataBinding.FieldName = 'CONTACT'
          end
          object cxGrid1DBTableView1Column8: TcxGridDBColumn
            DataBinding.FieldName = 'MOBILE'
          end
          object cxGrid1DBTableView1Column9: TcxGridDBColumn
            DataBinding.FieldName = 'COMP_MAIL_ADDR'
          end
          object cxGrid1DBTableView1Column10: TcxGridDBColumn
            DataBinding.FieldName = 'OPEN_BANK'
          end
          object cxGrid1DBTableView1Column11: TcxGridDBColumn
            DataBinding.FieldName = 'COMP_ACCT'
          end
          object cxGrid1DBTableView1Column12: TcxGridDBColumn
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
    inherited tlb1: TToolBar
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
        Visible = False
      end
    end
  end
  inherited ImageList: TImageList
    Top = 128
  end
  inherited dsMain: TUniDataSource
    Top = 129
  end
  inherited TblMain: TUniTable
    TableName = 'kc_comp_base'
    Left = 656
    Top = 145
    object TblMainCOMP_NO: TStringField
      DisplayLabel = #20844#21496#20195#30721
      DisplayWidth = 16
      FieldName = 'COMP_NO'
      Required = True
      Size = 64
    end
    object TblMainCOMP_NAME: TStringField
      DisplayLabel = #20844#21496#21517#31216
      DisplayWidth = 21
      FieldName = 'COMP_NAME'
      Size = 256
    end
    object TblMainHOME_PAGE: TStringField
      DisplayLabel = #20027#39029
      DisplayWidth = 23
      FieldName = 'HOME_PAGE'
      Size = 128
    end
    object TblMainCOMP_PRESENT: TStringField
      DisplayLabel = #27861#20154#20195#34920
      DisplayWidth = 20
      FieldName = 'COMP_PRESENT'
      Size = 64
    end
    object TblMainCOMP_TYPE: TStringField
      DisplayLabel = #20844#21496#31867#22411
      DisplayWidth = 13
      FieldName = 'COMP_TYPE'
      Size = 4
    end
    object TblMainADDRESS: TStringField
      DisplayLabel = #20844#21496#22320#22336
      DisplayWidth = 20
      FieldName = 'ADDRESS'
      Size = 128
    end
    object TblMainTEL: TStringField
      DisplayLabel = #30005#35805
      DisplayWidth = 12
      FieldName = 'TEL'
      Size = 32
    end
    object TblMainCONTACT: TStringField
      DisplayLabel = #32852#31995#20154
      DisplayWidth = 17
      FieldName = 'CONTACT'
      Size = 64
    end
    object TblMainMOBILE: TStringField
      DisplayLabel = #25163#26426#21495#30721
      DisplayWidth = 17
      FieldName = 'MOBILE'
      Size = 32
    end
    object TblMainCOMP_MAIL_ADDR: TStringField
      DisplayLabel = #20844#21496#37038#20214#22320#22336
      DisplayWidth = 20
      FieldName = 'COMP_MAIL_ADDR'
      Size = 64
    end
    object TblMainOPEN_BANK: TStringField
      DisplayLabel = #24320#25143#38134#34892
      DisplayWidth = 20
      FieldName = 'OPEN_BANK'
      Size = 128
    end
    object TblMainCOMP_ACCT: TStringField
      DisplayLabel = #38134#34892#36134#21495
      DisplayWidth = 21
      FieldName = 'COMP_ACCT'
      Size = 64
    end
    object TblMainMEMO: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 28
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
      Color = clWindow
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clTeal
    end
    object cxStyle5: TcxStyle
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

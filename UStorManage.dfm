inherited FrmStorManage: TFrmStorManage
  Left = 224
  Top = 126
  Width = 1156
  BorderStyle = bsSizeable
  Caption = 'S/N'#21644#25209#21495#31649#29702
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1140
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1138
      Height = 80
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 53
        Top = 16
        Width = 51
        Height = 13
        Caption = #21333#25454#31867#22411':'
      end
      object Label2: TLabel
        Left = 264
        Top = 16
        Width = 51
        Height = 13
        Caption = #21333#25454#32534#21495':'
      end
      object Label3: TLabel
        Left = 484
        Top = 16
        Width = 51
        Height = 13
        Caption = #21830#21697#20195#30721':'
      end
      object Label4: TLabel
        Left = 697
        Top = 16
        Width = 51
        Height = 13
        Caption = #21830#21697#21517#31216':'
      end
      object Label5: TLabel
        Left = 896
        Top = 14
        Width = 39
        Height = 13
        Caption = #24635#25968#37327':'
        Visible = False
      end
      object LablDegree: TLabel
        Left = 501
        Top = 56
        Width = 27
        Height = 13
        Caption = #24230#25968':'
      end
      object LablSN: TLabel
        Left = 80
        Top = 56
        Width = 30
        Height = 13
        Caption = 'SN'#21495':'
      end
      object LablValDate: TLabel
        Left = 264
        Top = 56
        Width = 39
        Height = 13
        Caption = #26377#25928#26399':'
      end
      object cxTextFormType: TcxTextEdit
        Left = 120
        Top = 11
        Properties.ReadOnly = True
        TabOrder = 0
        Width = 121
      end
      object cxTextFormNo: TcxTextEdit
        Left = 320
        Top = 12
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 121
      end
      object cxTextMatCode: TcxTextEdit
        Left = 552
        Top = 11
        Properties.ReadOnly = True
        TabOrder = 2
        Width = 121
      end
      object cxTextTotalNum: TcxTextEdit
        Left = 937
        Top = 9
        Properties.ReadOnly = True
        TabOrder = 3
        Visible = False
        Width = 121
      end
      object cxTextMatName: TcxTextEdit
        Left = 752
        Top = 11
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 121
      end
      object cxTextDegree: TcxTextEdit
        Left = 552
        Top = 51
        TabOrder = 5
        Width = 121
      end
      object cxTextSN: TcxTextEdit
        Left = 120
        Top = 51
        TabOrder = 6
        OnKeyPress = cxTextSNKeyPress
        Width = 121
      end
      object cxDateVal: TcxDateEdit
        Left = 320
        Top = 50
        TabOrder = 7
        Width = 121
      end
      object cxCheckBox1: TcxCheckBox
        Left = 736
        Top = 48
        Caption = #40664#35748#24230#25968
        TabOrder = 8
        Visible = False
        Width = 121
      end
      object cxCheckBox2: TcxCheckBox
        Left = 864
        Top = 48
        Caption = #40664#35748#26377#25928#26399
        TabOrder = 9
        Visible = False
        Width = 121
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 81
      Width = 1138
      Height = 327
      Align = alClient
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 1136
        Height = 325
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 1
          Top = 1
          Width = 1134
          Height = 323
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.SaveBookmark.Visible = False
            NavigatorButtons.GotoBookmark.Visible = False
            NavigatorButtons.Filter.Visible = False
            DataController.DataSource = dsMain
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = #32479#35745':0'
                Kind = skCount
                Column = cxGrid1DBTableView1Num
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = #24635#35745':0'
                Kind = skCount
                Column = cxGrid1DBTableView1Column1
              end
              item
                Format = #24635#35745':0'
                Kind = skSum
                Column = cxGrid1DBTableView1Num
              end>
            DataController.Summary.SummaryGroups = <
              item
                Links = <
                  item
                    Column = cxGrid1DBTableView1Num
                  end>
                SummaryItems = <
                  item
                    Format = #24635#35745':0'
                    Kind = skCount
                    FieldName = 'BSN_NO'
                    Column = cxGrid1DBTableView1BSNO
                  end>
              end>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsView.Navigator = True
            OptionsView.Footer = True
            OptionsView.Indicator = True
            Styles.GroupByBox = cxStyle1
            object cxGrid1DBTableView1Column1: TcxGridDBColumn
              Caption = #24207#21495
              OnGetDataText = cxGrid1DBTableView1Column1GetDataText
              Options.Editing = False
              Width = 85
            end
            object cxGrid1DBTableView1BSNO: TcxGridDBColumn
              Caption = 'SN'#21495
              DataBinding.FieldName = 'BSN_NO'
              Width = 139
            end
            object cxGrid1DBTableView1ValDate: TcxGridDBColumn
              Caption = #26377#25928#26399
              DataBinding.FieldName = 'VALIDATE_DATE'
              PropertiesClassName = 'TcxDateEditProperties'
              Width = 68
            end
            object cxGrid1DBTableView1Degree: TcxGridDBColumn
              Caption = #24230#25968
              DataBinding.FieldName = 'DEGREE'
              Width = 88
            end
            object cxGrid1DBTableView1Num: TcxGridDBColumn
              Caption = #25968#37327
              DataBinding.FieldName = 'IN_NUM'
              Visible = False
            end
            object cxGrid1DBTableView1Memo: TcxGridDBColumn
              Caption = #22791#27880
              DataBinding.FieldName = 'MEMO'
              Width = 270
            end
            object cxGrid1DBTableView1Column2: TcxGridDBColumn
              DataBinding.FieldName = 'STOR_IN_NO'
              Visible = False
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
    Width = 1140
    inherited tlb1: TToolBar
      Width = 1138
      Height = 32
      inherited btnserch: TToolButton
        Visible = False
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
  inherited ImageList: TImageList
    Left = 1056
    Top = 64
  end
  inherited dsMain: TUniDataSource
    Left = 784
    Top = 265
  end
  inherited TblMain: TUniTable
    TableName = 'kc_stor_in'
    AfterPost = TblMainAfterPost
    BeforeDelete = TblMainBeforeDelete
    AfterDelete = TblMainAfterDelete
    OnNewRecord = TblMainNewRecord
    Left = 704
    Top = 257
  end
  inherited dlgSave1: TSaveDialog
    Filter = 'Microsoft  Excel '#25991#20214'|*.xlsx'
    Left = 152
    Top = 201
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 112
    Top = 312
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
  object QryTemp: TUniQuery
    Left = 584
    Top = 288
  end
  object QryMatInfo: TUniQuery
    SQL.Strings = (
      'select * from kc_matter_base where mat_code=:matCode')
    Left = 496
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'matCode'
      end>
  end
end

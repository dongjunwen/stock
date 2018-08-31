inherited FrmStorOut: TFrmStorOut
  Left = 295
  Top = 149
  Width = 1118
  Height = 486
  BorderStyle = bsSizeable
  Caption = #20986#24211#31649#29702
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 1102
    Height = 415
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1100
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
      object LablSN: TLabel
        Left = 80
        Top = 56
        Width = 30
        Height = 13
        Caption = 'SN'#21495':'
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
      object cxTextSN: TcxTextEdit
        Left = 120
        Top = 51
        TabOrder = 5
        OnKeyPress = cxTextSNKeyPress
        Width = 121
      end
      object cxCheckBox1: TcxCheckBox
        Left = 736
        Top = 48
        Caption = #40664#35748#24230#25968
        TabOrder = 6
        Visible = False
        Width = 121
      end
      object cxCheckBox2: TcxCheckBox
        Left = 864
        Top = 48
        Caption = #40664#35748#26377#25928#26399
        TabOrder = 7
        Visible = False
        Width = 121
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 81
      Width = 1100
      Height = 333
      Align = alClient
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 1098
        Height = 331
        Align = alClient
        Caption = 'Panel4'
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 1
          Top = 1
          Width = 1096
          Height = 329
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.Insert.Enabled = False
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
            OptionsData.Inserting = False
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
              Width = 75
            end
            object cxGrid1DBTableView1Degree: TcxGridDBColumn
              Caption = #24230#25968
              DataBinding.FieldName = 'DEGREE'
              Width = 88
            end
            object cxGrid1DBTableView1Num: TcxGridDBColumn
              Caption = #25968#37327
              DataBinding.FieldName = 'OUT_NUM'
            end
            object cxGrid1DBTableView1Memo: TcxGridDBColumn
              Caption = #22791#27880
              DataBinding.FieldName = 'MEMO'
              Width = 270
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object Memo1: TMemo
          Left = 800
          Top = 48
          Width = 217
          Height = 177
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          Lines.Strings = (
            'Memo1')
          ScrollBars = ssBoth
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
  inherited pnltop: TPanel
    Width = 1102
    inherited tlb1: TToolBar
      Width = 1100
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
        OnClick = btnImportClick
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
    Left = 744
    Top = 249
  end
  inherited TblMain: TUniTable
    TableName = 'kc_stor_out'
    BeforePost = TblMainBeforePost
    AfterPost = TblMainAfterPost
    AfterDelete = TblMainAfterDelete
    OnNewRecord = TblMainNewRecord
    Left = 568
    Top = 201
    object TblMainSTOR_OUT_NO: TStringField
      FieldName = 'STOR_OUT_NO'
      Required = True
      Size = 64
    end
    object TblMainBSN_NO: TStringField
      FieldName = 'BSN_NO'
      Required = True
      Size = 256
    end
    object TblMainSTOR_IN_NO: TStringField
      FieldName = 'STOR_IN_NO'
      Size = 64
    end
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
    object TblMainOUT_NUM: TFloatField
      FieldName = 'OUT_NUM'
    end
    object TblMainDEGREE: TFloatField
      FieldName = 'DEGREE'
    end
    object TblMainVALIDATE_DATE: TDateTimeField
      FieldName = 'VALIDATE_DATE'
    end
    object TblMainMEMO: TStringField
      FieldName = 'MEMO'
      Size = 1024
    end
  end
  inherited dlgSave1: TSaveDialog
    Filter = 'Microsoft  Excel '#25991#20214'|*.xls|*.xls'
    Left = 232
    Top = 225
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 72
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
  object QryTemp: TUniQuery
    Left = 464
    Top = 224
  end
  object QryStorIn: TUniQuery
    Left = 384
    Top = 240
  end
  object QryMatInfo: TUniQuery
    SQL.Strings = (
      'select * from kc_matter_base where mat_code=:matCode')
    Left = 472
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'matCode'
      end>
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xls'
    Filter = 'Microsoft  Excel '#25991#20214'|*.xls|*.xls'
    Left = 160
    Top = 216
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 178
    Top = 323
  end
end

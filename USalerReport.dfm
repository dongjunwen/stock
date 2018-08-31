inherited FrmSalerReport: TFrmSalerReport
  Left = 255
  Top = 195
  Caption = #38144#21806#20154#21592#19994#32489
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1006
      Height = 48
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 16
        Width = 24
        Height = 13
        Caption = #22995#21517
      end
      object Label2: TLabel
        Left = 259
        Top = 12
        Width = 24
        Height = 13
        Caption = #26376#20221
      end
      object Label3: TLabel
        Left = 371
        Top = 12
        Width = 14
        Height = 13
        Caption = '~~'
      end
      object cxDateBegin: TcxDateEdit
        Left = 291
        Top = 11
        Properties.InputKind = ikStandard
        Properties.ShowTime = False
        TabOrder = 0
        Width = 81
      end
      object cxDateEnd: TcxDateEdit
        Left = 395
        Top = 11
        Properties.InputKind = ikStandard
        TabOrder = 1
        Width = 81
      end
      object cxLookupEmpNo: TcxLookupComboBox
        Left = 49
        Top = 11
        Properties.KeyFieldNames = 'EMP_NO'
        Properties.ListColumns = <
          item
            Caption = #20195#30721
            FieldName = 'EMP_NO'
          end
          item
            Caption = #22995#21517
            FieldName = 'EMP_NAME'
          end>
        Properties.ListSource = dsEmp
        Properties.OnChange = cxLookupEmpNoPropertiesChange
        Properties.OnCloseUp = cxLookupEmpNoPropertiesCloseUp
        TabOrder = 2
        Width = 80
      end
      object cxTextEmpName: TcxTextEdit
        Left = 128
        Top = 10
        TabOrder = 3
        Width = 121
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 1006
      Height = 359
      Align = alClient
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 1004
        Height = 357
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSalerReport
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1TotalAmount
            end
            item
              Format = '0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1TotalProfit
            end
            item
              Format = '0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1ActAmount
            end
            item
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          Styles.GroupByBox = cxStyle1
          object cxGrid1DBTableView1SelNo: TcxGridDBColumn
            Caption = #24207#21495
            OnGetDataText = cxGrid1DBTableView1SelNoGetDataText
          end
          object cxGrid1DBTableView1YM: TcxGridDBColumn
            Caption = #26376#20221
            DataBinding.FieldName = 'order_date'
          end
          object cxGrid1DBTableView1SalerName: TcxGridDBColumn
            Caption = #38144#21806#21592
            DataBinding.FieldName = 'SALER_NAME'
            Width = 71
          end
          object cxGrid1DBTableView1CustName: TcxGridDBColumn
            Caption = #23458#25143#21517#31216
            DataBinding.FieldName = 'SUP_NAME'
            Width = 88
          end
          object cxGrid1DBTableView1TotalAmount: TcxGridDBColumn
            Caption = #24635#36135#27454
            DataBinding.FieldName = 'total_amount'
            Width = 79
          end
          object cxGrid1DBTableView1TotalProfit: TcxGridDBColumn
            Caption = #24635#21033#28070
            DataBinding.FieldName = 'total_profit'
            Width = 86
          end
          object cxGrid1DBTableView1ActAmount: TcxGridDBColumn
            Caption = #32047#35745#24050#20184#27454#37329#39069
            DataBinding.FieldName = 'act_acmount_total'
            Width = 117
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Memo1: TMemo
        Left = 712
        Top = 88
        Width = 233
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
      inherited btnExport: TToolButton
        Caption = 'st'
      end
      inherited btnprint: TToolButton
        Visible = False
      end
    end
  end
  inherited dlgSave1: TSaveDialog
    Left = 168
    Top = 201
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
  object QrySalerReport: TUniQuery
    Left = 512
    Top = 216
  end
  object dsSalerReport: TUniDataSource
    DataSet = QrySalerReport
    Left = 624
    Top = 224
  end
  object dsEmp: TUniDataSource
    DataSet = QryEmp
    Left = 560
    Top = 377
  end
  object QryEmp: TUniQuery
    SQL.Strings = (
      'select * from kc_emp_base')
    Left = 496
    Top = 368
  end
end

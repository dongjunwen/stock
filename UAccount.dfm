inherited FrmAccount: TFrmAccount
  Left = 258
  Top = 215
  Caption = #36134#21495#31649#29702
  ClientWidth = 762
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TPanel
    Width = 762
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 760
      Height = 48
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 49
      Width = 760
      Height = 359
      Align = alClient
      Caption = 'Panel2'
      TabOrder = 1
    end
  end
  inherited pnltop: TPanel
    Width = 762
    inherited tlb1: TToolBar
      Width = 760
      inherited btnfresh: TToolButton
        Wrap = True
      end
      inherited btnImport: TToolButton
        Left = 0
        Top = 24
      end
      inherited btnExport: TToolButton
        Left = 77
        Top = 24
      end
      inherited btnFirst: TToolButton
        Left = 154
        Top = 24
      end
      inherited btnBefore: TToolButton
        Left = 231
        Top = 24
      end
      inherited btnNext: TToolButton
        Left = 308
        Top = 24
      end
      inherited btnLast: TToolButton
        Left = 385
        Top = 24
      end
      inherited btnprint: TToolButton
        Left = 462
        Top = 24
        Wrap = False
      end
    end
  end
  inherited TblMain: TUniTable
    Left = 608
  end
end

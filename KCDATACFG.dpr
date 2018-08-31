program KCDATACFG;

uses
  Forms,
  UDataCfg in 'UDataCfg.pas' {FrmDataCfg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmDataCfg, FrmDataCfg);
  Application.Run;
end.

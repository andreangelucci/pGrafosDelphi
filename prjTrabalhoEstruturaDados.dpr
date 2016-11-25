program prjTrabalhoEstruturaDados;

uses
  Vcl.Forms,
  uniFrmPrincipal in 'uniFrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

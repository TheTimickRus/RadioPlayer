Program RadioPlay;

Uses
  System.StartUpCopy,
  FMX.Forms,
  MainUnit in 'MainUnit.pas',
  SelectRadioUnit in 'SelectRadioUnit.pas',
  Bass in 'Bass.pas',
  FuncUnit in 'FuncUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelectRadioForm, SelectRadioForm);
  Application.Run;
end.

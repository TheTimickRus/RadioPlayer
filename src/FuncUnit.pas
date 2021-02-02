Unit FuncUnit;

Interface

Uses
  WinAPI.Windows, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, IDHTTP, FMX.Memo, ShellAPI;

  Function SecToMin(S: String): String;
  Procedure CheckLabels(Status, Plays, Traffic, Time: String);

Implementation

Uses
  MainUnit;

Function SecToMin(S: String): String;
var
  S1, S2, S3: String;
begin
  S1 := FloatToStr(StrToFloat(S) / 60);
  S1 := FloatToStr(Trunc(StrToFloat(S1)));
  S3 := FloatToStr(StrToFloat(S) / 3600);
  S3 := FloatToStr(Trunc(StrToFloat(S3)));
  S1 := IntToStr(StrToInt(S1) - StrToInt(S3) * 60);
  S2 := IntToStr(StrToInt(S) - StrToInt(S3) * 3600);
  S2 := IntToStr(StrToInt(S2) - StrToInt(S1) * 60);

  if StrToInt(S1) < 10 then S1 := '0' + S1;
  if StrToInt(S2) < 10 then S2 := '0' + S2;
  if StrToInt(S3) < 10 then S3 := '0' + S3;

  if StrToInt(S3) <> 0 then Result := S3 + ':' + S1 + ':' + S2 else Result := S1 + ':' + S2
end;

Function MbOrTb(Float: Extended): String;
begin
  if Float < 1024 then Result := FormatFloat('0', Float) + ' KB' else
   if Float / 1024 < 1024 then Result := Format('%.1n', [Float / 1024]) + ' MB' else
     Result := Format('%.1n', [Float / (1024 * 1024)]) + ' GB';
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

Procedure CheckLabels(Status, Plays, Traffic, Time: String);
begin
  MainForm.Label0.Text := 'Статус: ' + Status;
  MainForm.Label1.Text := 'Играет: ' + Plays;

  if Traffic <> '---' then Traffic := MbOrTb(StrToFloat(Traffic));
  MainForm.Label2.Text := 'Трафик: ' + Traffic;

  if Time <> '---' then Time := SecToMin(Time);
  MainForm.Label3.Text := 'Прошло: ' + Time;
end;

end.

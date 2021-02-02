Unit MainUnit;

Interface

Uses
  WinAPI.Windows, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Rtti,
  FMX.Platform, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, Bass, FMX.ListBox,
  FMX.Menus, FuncUnit, FMX.Ani, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IDHTTP, SelectRadioUnit, ShellAPI, FMX.ScrollBox, FMX.Memo;

Type
  TMainForm = class(TForm)
    _StyleBook: TStyleBook;
    _Timer: TTimer;
    _PopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MainButton: TButton;
    VolTrackBar: TTrackBar;
    Label3: TLabel;
    VolLabel: TLabel;
    InfoPanel: TPanel;
    Label0: TLabel;
    L0_CA: TColorAnimation;
    Label1: TLabel;
    Label2: TLabel;
    SelectedRadio: TButton;
    Label4: TLabel;
    L4_CA: TColorAnimation;

    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure MainButtonClick(Sender: TObject);
    Procedure VolTrackBarChange(Sender: TObject);
    Procedure _TimerTimer(Sender: TObject);
    Procedure MenuItem1Click(Sender: TObject);
    Procedure SelectedRadioClick(Sender: TObject);
    Procedure MenuItem2Click(Sender: TObject);
  Public
    Size, URLValue, Status, Plays, Traffic, Time: String;
  end;

  TConnectThread = Class(TThread)
  Protected
    Procedure Execute; OverRide;
  end;

var
  MainForm: TMainForm;
  MediaStream: HStream;
  ConnectThread: TConnectThread;
  Buff: Boolean;

Implementation
{$R *.fmx}

//======================================= [ Инициализация ] =======================================\\
Procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not BASS_Init(-1, 44100, BASS_DEVICE_SPEAKERS, 0, nil) then begin
    if MessageBox(0, PChar('Не удалось инициализировать библиотеку "BASS.dll"! Программа работать НЕ будет!' + #13#10 + 'Прервать работу программы?'), PChar('Ошибка!'), MB_YESNO + MB_ICONERROR) = IDYES then
      Close;
  end;

  Status := 'Подключение отсутствует...';
end;

Procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BASS_Free();
end;
//======================================= [ Инициализация ] =======================================\\



//======================================= [ Основное ] =======================================\\
Procedure TConnectThread.Execute;
begin
  Buff := True;
  if MediaStream <> 0 then BASS_StreamFree(MediaStream);
  BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1);
  MediaStream := BASS_StreamCreateURL(PChar(MainForm.URLValue), 0, 0 {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF}, nil, nil);
  if MediaStream = 0 then begin
    ShowMessage('Не удалось создать поток :(');
    Exit;
  end;
  BASS_ChannelSetAttribute(MediaStream, BASS_ATTRIB_VOL, MainForm.VolTrackBar.Value);
  BASS_ChannelPlay(MediaStream, False);

  Buff := False;
  if Assigned(ConnectThread) then FreeAndNil(ConnectThread);
end;

Procedure TMainForm.MainButtonClick(Sender: TObject);
begin
  if (Tag = 0) and (URLValue <> '') then begin
    ConnectThread := TConnectThread.Create(False);

    MainButton.Text := 'Стоп';
    Tag := 1;
  end else if Tag = 1 then begin
    BASS_StreamFree(MediaStream);

    Buff := False;
    if Assigned(ConnectThread) then FreeAndNil(ConnectThread);

    MainButton.Text := 'Старт';
    Tag := 0;
  end;
end;

Procedure TMainForm.SelectedRadioClick(Sender: TObject);
begin
  SelectRadioForm.ShowModal;
end;

Procedure TMainForm.VolTrackBarChange(Sender: TObject);
begin
  VolLabel.Text := IntToStr(Round(VolTrackBar.Value * 100)) + ' %';
  BASS_ChannelSetAttribute(MediaStream, BASS_ATTRIB_VOL, VolTrackBar.Value);
end;

Procedure TMainForm._TimerTimer(Sender: TObject);
var
  Meta: PAnsiChar;
  P: Integer;
begin
// Статус
  if BASS_ChannelIsActive(MediaStream) = BASS_ACTIVE_PLAYING then Status := 'Подключено!' else Status := 'Подключение отсутствует...';
  if Buff then Status := 'Буферизация...';
// Статус

// Играет
  Meta := BASS_ChannelGetTags(MediaStream, BASS_TAG_META);
  if Meta <> nil then begin
    P := Pos('StreamTitle=', String(Meta));
    if (P = 0) then Exit;
    P := P + 13;
    Meta := PAnsiChar(AnsiString(Copy(Meta, P, Pos(';', String(Meta)) - P - 1)));
  end;
  if Meta = '' then Plays := '---' else Plays := String(UTF8String(Meta));
// Играет

// Трафик
  Traffic := IntToStr((BASS_ChannelGetPosition(MediaStream, 0) DIV 1024) DIV 3);
  if Traffic = '0' then Traffic := '---';

// Трафик

// Время
  Time := FloatToStrF(BASS_ChannelBytes2Seconds(MediaStream, BASS_ChannelGetPosition(MediaStream, 0)), FFFixed, 8, 0);
  if Time = '-1' then Time := '---';
// Время

  CheckLabels(Status, Plays, Traffic, Time);
end;
//======================================= [ Основное ] =======================================\\


//======================================= [ Меню ] =======================================\\
Procedure TMainForm.MenuItem1Click(Sender: TObject);
var
  Clipboard: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipBoardService, Clipboard) then
    Clipboard.SetClipboard(TValue.From(Plays));
end;

Procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('https://vk.com/audio?q=' + MainForm.Plays), nil, nil, SW_SHOW);
end;
//======================================= [ Меню ] =======================================\\

end.

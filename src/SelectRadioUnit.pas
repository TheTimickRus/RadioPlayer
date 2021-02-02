Unit SelectRadioUnit;

Interface

Uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView, FMX.Layouts,
  FMX.ListBox, FMX.Edit, FMX.SearchBox, FMX.TreeView;

Type
  TSelectRadioForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    NameLabel: TLabel;

    TreeView1: TTreeView;

    Item1: TTreeViewItem;
    Item1_01: TTreeViewItem;
    Item1_02: TTreeViewItem;
    Item1_03: TTreeViewItem;
    Item1_04: TTreeViewItem;
    Item1_05: TTreeViewItem;
    Item1_06: TTreeViewItem;
    Item1_07: TTreeViewItem;
    Item1_08: TTreeViewItem;
    Item1_09: TTreeViewItem;
    Item1_10: TTreeViewItem;
    Item1_11: TTreeViewItem;
    Item1_12: TTreeViewItem;
    Item1_13: TTreeViewItem;
    Item1_14: TTreeViewItem;
    Item1_15: TTreeViewItem;
    Item1_16: TTreeViewItem;
    Item1_17: TTreeViewItem;
    Item1_18: TTreeViewItem;
    Item1_19: TTreeViewItem;
    Item1_20: TTreeViewItem;
    Item1_21: TTreeViewItem;
    Item1_22: TTreeViewItem;
    Item1_23: TTreeViewItem;
    Item1_24: TTreeViewItem;
    Item1_25: TTreeViewItem;
    Item1_26: TTreeViewItem;

    Item2: TTreeViewItem;
    Item2_1: TTreeViewItem;
    Item2_2: TTreeViewItem;
    Item2_3: TTreeViewItem;
    Item2_4: TTreeViewItem;
    Item2_5: TTreeViewItem;

    Item3: TTreeViewItem;
    Item4: TTreeViewItem;
    Item5: TTreeViewItem;
    Item6: TTreeViewItem;

    Procedure Button1Click(Sender: TObject);
    Procedure Button2Click(Sender: TObject);
    Procedure TreeView1Change(Sender: TObject);
    Procedure TreeView1DblClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  end;

const
// Рекорд
  RadioRecord = 'http://air.radiorecord.ru:8101/rr_320';
  MegaMix     = 'http://air.radiorecord.ru:805/mix_320';
  Deep        = 'http://air.radiorecord.ru:805/deep_320';
  EDM         = 'http://air.radiorecord.ru:805/club_320';
  FutureHouse = 'http://air.radiorecord.ru:805/fut_320';
  TranceMiss  = 'http://air.radiorecord.ru:805/tm_320';
  Chill       = 'http://air.radiorecord.ru:805/chil_320';
  Mini        = 'http://air.radiorecord.ru:805/mini_320';
  PirateSt    = 'http://air.radiorecord.ru:805/ps_320';
  RussianMix  = 'http://air.radiorecord.ru:805/rus_320';
  VipHouse    = 'http://air.radiorecord.ru:805/vip_320';
  Super90     = 'http://air.radiorecord.ru:805/sd90_320';
  Breaks      = 'http://air.radiorecord.ru:805/brks_320';
  DubStep     = 'http://air.radiorecord.ru:805/dub_320';
  DanceCore   = 'http://air.radiorecord.ru:805/dc_320';
  Techno      = 'http://air.radiorecord.ru:805/techno_320';
  HardStyle   = 'http://air.radiorecord.ru:805/teo_320';
  Trap        = 'http://air.radiorecord.ru:805/trap_320';
  OldSchool   = 'http://air.radiorecord.ru:805/pump_320';
  Rock        = 'http://air.radiorecord.ru:805/rock_320';
  MedlFM      = 'http://air.radiorecord.ru:805/mdl_320';
  GopFM       = 'http://air.radiorecord.ru:805/gop_320';
  Black       = 'http://air.radiorecord.ru:805/yo_320';
  RaveFM      = 'http://air.radiorecord.ru:805/rave_320';
  GOA         = 'http://air.radiorecord.ru:805/goa_320';
  Trop        = 'http://air.radiorecord.ru:805/trop_320';
  Naft        = 'http://air.radiorecord.ru:805/naft_320';
// Рекорд

// Европа Плюс
  EuropePlus  = 'http://ep256.hostingradio.ru:8052/europaplus256.mp3';
  Top40       = 'http://eptop128server.streamr.ru:8033/eptop128';
  Party       = 'http://epdop.hostingradio.ru:8033/epparty128.mp3';
  Light       = 'http://emg02.hostingradio.ru/ep-light128.mp3';
  New         = 'http://emg02.hostingradio.ru/ep-new128.mp3';
  RaB         = 'http://eprnb128server.streamr.ru:8061/eprnb128';
// Европа Плюс

// Love
  Love        = 'http://stream.variant.fm:8000/LOVE-192';
// Love

// ТНТ Music Радио
  TNTMUSRD    = 'http://ic7.101.ru:8000/e16_1?userid=0&setst=2rgcqqub0s76uquednkj8ouit5&city=0';
// ТНТ Music Радио

// ENERGY
  ENERGY      = 'http://ic3.101.ru:8000/v1_1?userid=0&setst=80gu1fa85f28gdka3scfhsckv1&city=0';
// ENERGY

// Maximum
  MAX         = 'http://icecast.radiomaximum.cdnvideo.ru/maximum.mp3';
// Maximum

var
  SelectRadioForm: TSelectRadioForm;

Implementation

{$R *.fmx}

Uses
  MainUnit, Bass;

Procedure TSelectRadioForm.Button1Click(Sender: TObject);
var
  S: String;
begin
// Рекорд
  if Item1.IsSelected    then MainForm.URLValue := RadioRecord;
  if Item1_01.IsSelected then MainForm.URLValue := MegaMix;
  if Item1_02.IsSelected then MainForm.URLValue := Deep;
  if Item1_03.IsSelected then MainForm.URLValue := EDM;
  if Item1_04.IsSelected then MainForm.URLValue := FutureHouse;
  if Item1_05.IsSelected then MainForm.URLValue := TranceMiss;
  if Item1_06.IsSelected then MainForm.URLValue := Chill;
  if Item1_07.IsSelected then MainForm.URLValue := Mini;
  if Item1_08.IsSelected then MainForm.URLValue := PirateSt;
  if Item1_09.IsSelected then MainForm.URLValue := RussianMix;
  if Item1_10.IsSelected then MainForm.URLValue := VipHouse;
  if Item1_11.IsSelected then MainForm.URLValue := Super90;
  if Item1_12.IsSelected then MainForm.URLValue := Breaks;
  if Item1_13.IsSelected then MainForm.URLValue := DubStep;
  if Item1_14.IsSelected then MainForm.URLValue := DanceCore;
  if Item1_15.IsSelected then MainForm.URLValue := Techno;
  if Item1_16.IsSelected then MainForm.URLValue := HardStyle;
  if Item1_17.IsSelected then MainForm.URLValue := Trap;
  if Item1_18.IsSelected then MainForm.URLValue := OldSchool;
  if Item1_19.IsSelected then MainForm.URLValue := Rock;
  if Item1_20.IsSelected then MainForm.URLValue := MedlFM;
  if Item1_21.IsSelected then MainForm.URLValue := GopFM;
  if Item1_22.IsSelected then MainForm.URLValue := Black;
  if Item1_23.IsSelected then MainForm.URLValue := RaveFM;
  if Item1_24.IsSelected then MainForm.URLValue := GOA;
  if Item1_25.IsSelected then MainForm.URLValue := Trop;
  if Item1_26.IsSelected then MainForm.URLValue := Naft;
// Рекорд

// Европа Плюс
  if Item2.IsSelected   then MainForm.URLValue := EuropePlus;
  if Item2_1.IsSelected then MainForm.URLValue := Top40;
  if Item2_2.IsSelected then MainForm.URLValue := Party;
  if Item2_3.IsSelected then MainForm.URLValue := Light;
  if Item2_4.IsSelected then MainForm.URLValue := New;
  if Item2_5.IsSelected then MainForm.URLValue := RaB;
// Европа Плюс

// Love
  if Item3.IsSelected   then MainForm.URLValue := Love;
// Love

// ТНТ Music Радио
  if Item4.IsSelected   then MainForm.URLValue := TNTMUSRD;
// ТНТ Music Радио

// ENERGY
  if Item5.IsSelected   then MainForm.URLValue := ENERGY;
// ENERGY

// Maximum
  if Item6.IsSelected   then MainForm.URLValue := MAX;
// Maximum

  if BASS_ChannelIsActive(MediaStream) = BASS_ACTIVE_PLAYING then begin
    MainForm.MainButtonClick(nil);
    MainForm.MainButtonClick(nil);
  end else MainForm.MainButtonClick(nil);

  S := NameLabel.Text;
  Delete(S, Pos('(', S) - 1, 100);
  if S[Length(S)] <> '"' then S := S + '"';
  MainForm.Label4.Text := S;

  SelectRadioForm.Close;
end;

Procedure TSelectRadioForm.Button2Click(Sender: TObject);
begin
  SelectRadioForm.Close;
end;

Procedure TSelectRadioForm.TreeView1Change(Sender: TObject);
begin
// Рекорд
  if Item1.IsSelected    then NameLabel.Text := 'Выбрана станция: "' + Item1.Text + '"';
  if Item1_01.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_01.Text + '"';
  if Item1_02.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_02.Text + '"';
  if Item1_03.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_03.Text + '"';
  if Item1_04.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_04.Text + '"';
  if Item1_05.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_05.Text + '"';
  if Item1_06.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_06.Text + '"';
  if Item1_07.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_07.Text + '"';
  if Item1_08.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_08.Text + '"';
  if Item1_09.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_09.Text + '"';
  if Item1_10.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_10.Text + '"';
  if Item1_11.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_11.Text + '"';
  if Item1_12.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_12.Text + '"';
  if Item1_13.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_13.Text + '"';
  if Item1_14.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_14.Text + '"';
  if Item1_15.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_15.Text + '"';
  if Item1_16.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_16.Text + '"';
  if Item1_17.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_17.Text + '"';
  if Item1_18.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_18.Text + '"';
  if Item1_19.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_19.Text + '"';
  if Item1_20.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_20.Text + '"';
  if Item1_21.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_21.Text + '"';
  if Item1_22.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_22.Text + '"';
  if Item1_23.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_23.Text + '"';
  if Item1_24.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_24.Text + '"';
  if Item1_25.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_25.Text + '"';
  if Item1_26.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item1_26.Text + '"';
// Рекорд

// Европа Плюс
  if Item2.IsSelected   then NameLabel.Text := 'Выбрана станция: "' + Item2.Text + '"';
  if Item2_1.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item2_1.Text + '"';
  if Item2_2.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item2_2.Text + '"';
  if Item2_3.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item2_3.Text + '"';
  if Item2_4.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item2_4.Text + '"';
  if Item2_5.IsSelected then NameLabel.Text := 'Выбрана станция: "' + Item2_5.Text + '"';
// Европа Плюс

// Love
  if Item3.IsSelected   then NameLabel.Text := 'Выбрана станция: "' + Item3.Text + '"';
// Love

// ТНТ Music Радио
  if Item4.IsSelected   then NameLabel.Text := 'Выбрана станция: "' + Item4.Text + '"';
// ТНТ Music Радио

// ENERGY
  if Item5.IsSelected   then NameLabel.Text := 'Выбрана станция: "' + Item5.Text + '"';
// ENERGY

// Maximum
  if Item6.IsSelected   then NameLabel.Text := 'Выбрана станция: "' + Item6.Text + '"';
// Maximum
end;

Procedure TSelectRadioForm.TreeView1DblClick(Sender: TObject);
begin
  Button1Click(nil);
end;

end.

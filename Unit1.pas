unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.MultiView, FMX.Controls.Presentation,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit, FMX.DateTimeCtrls,
  FMX.MediaLibrary, FMX.MediaLibrary.Actions, FMX.StdActns, FireDac.Stan.Param,
  System.Permissions,FMX.DialogService, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  System.ImageList, FMX.ImgList, FMX.Objects, FMX.Filter, Data.DB,
  System.IOUtils,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Platform,
  FMX.Ani,
  FMX.Media,
  Androidapi.Helpers,
  Androidapi.JNI.Media,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  System.Sensors,
  System.Sensors.Components,
  FMX.WebBrowser,
  FMX.Maps;


type
 TArrayProcessor<T> = procedure(const value: T) of object;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Button1: TButton;
    MultiView1: TMultiView;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    ClearImageAction1: TAction;
    Panel4: TPanel;
    TabItem3: TTabItem;
    Memo1: TMemo;
    FlowLayout1: TFlowLayout;
    Label3: TLabel;
    Name: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Panel5: TPanel;
    FlowLayout2: TFlowLayout;
    BtnIncreaseSize: TButton;
    BtnReduceSize: TButton;
    ComboBox1: TComboBox;
    ToolBar3: TToolBar;
    BtnDeleteAll: TButton;
    BtnAnonSync: TButton;
    BtnEmptyEdits: TButton;
    Button2: TButton;
    Button3: TButton;
    ImageList1: TImageList;
    Label6: TLabel;
    Label7: TLabel;
    BtnStartRec: TButton;
    BtnStopRec: TButton;
    BtnPlayRec: TButton;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    Image3: TImage;
    BtnTakePhoto: TButton;
    FloatAnimation1: TFloatAnimation;
    Image4: TImage;
    Image2: TImage;
    Image1: TImage;
    LblStatus: TLabel;
    BtnConfirm: TButton;
    Panel9: TPanel;
    BtnTerminate: TButton;
    Panel10: TPanel;
    Label1: TLabel;
    TabCont_Image_Memo: TTabControl;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    ImageContainer: TImage;
    MemoRecordNote: TMemo;
    TabItem6: TTabItem;
    LocationSensor1: TLocationSensor;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Switch1: TSwitch;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItemLatitude: TListBoxItem;
    ListBoxItemLongitude: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItemAdminArea: TListBoxItem;
    ListBoxItemCountryCode: TListBoxItem;
    ListBoxItemCountryName: TListBoxItem;
    ListBoxItemFeatureName: TListBoxItem;
    ListBoxItemLocality: TListBoxItem;
    ListBoxItemPostalCode: TListBoxItem;
    ListBoxItemSubAdminArea: TListBoxItem;
    ListBoxItemSubLocality: TListBoxItem;
    ListBoxItemSubThoroughfare: TListBoxItem;
    ListBoxItemThoroughfare: TListBoxItem;
    TabControl2: TTabControl;
    TabItemImage: TTabItem;
    ImageDisplay: TImage;
    TabItemNote: TTabItem;
    TabItem9: TTabItem;
    Layout1: TLayout;
    PnlLelf: TPanel;
    ListView1: TListView;
    PnlBottom: TPanel;
    BtnImageDisplay: TButton;
    BtnPayVoiceDB: TButton;
    BtnNoteDisplay: TButton;
    EdLat: TEdit;
    EdLong: TEdit;
    PlnTopMemo: TPanel;
    BtnEditNote: TButton;
    PnlHostMemo: TPanel;
    MemoNote: TMemo;
    PnlImage_Memo: TPanel;
    FLImage_Memo: TFlowLayout;
    BtnCurrImage: TButton;
    BtnCurrCood: TButton;
    BtnCurrNote: TButton;
    Button4: TButton;
    Edit1: TEdit;
    TIStartpage: TTabItem;
    PlnStartHost: TPanel;
    PlnStartTitle: TPanel;
    Label8: TLabel;
    FlowLayout3: TFlowLayout;
    GroupBox1: TGroupBox;
    ComboBox3: TComboBox;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Edit3: TEdit;
    LblAddress: TLabel;
    LblEmail: TLabel;
    LblProjectRef: TLabel;
    LblContact: TLabel;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure PreviousTabAction1Update(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnIterateClick(Sender: TObject);
    procedure BtnTakePhotoClick(Sender: TObject);

    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure ClearImageAction1Execute(Sender: TObject);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure BtnDeleteAllClick(Sender: TObject);
    procedure BtnAnonSyncClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject);
    procedure BtnEmptyEditsClick(Sender: TObject);
    procedure BtnIncreaseSizeClick(Sender: TObject);
    procedure BtnReduceSizeClick(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure BtnTerminateClick(Sender: TObject);
    procedure BtnStartRecClick(Sender: TObject);
    procedure BtnStopRecClick(Sender: TObject);
    procedure BtnPlayRecClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnPayVoiceDBClick(Sender: TObject);
    procedure NextTabAction1Update(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure TabItem9MouseEnter(Sender: TObject);
    procedure BtnImageDisplayClick(Sender: TObject);
    procedure BtnNoteDisplayClick(Sender: TObject);
    procedure BtnEditNoteClick(Sender: TObject);
    procedure BtnCurrImageClick(Sender: TObject);
    procedure BtnCurrNoteClick(Sender: TObject);
    procedure BtnCurrCoodClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private const
    StoragePermission = 'android.permission.WRITE_EXTERNAL_STORAGE';
    //Audio
    StorageWritePermission = 'android.permission.WRITE_EXTERNAL_STORAGE';
    StorageReadPermission = 'android.permission.READ_EXTERNAL_STORAGE';
    AudioPermission = 'android.permission.RECORD_AUDIO';
  private
    { Private declarations }
    FRawBitmap: TBitmap;
    FEffect: TFilter;
    TerminateThread: Boolean;
    FMediaRecorder: JMediaRecorder;
    FFileName: string;
    RecordingRef: integer;

    FGeocoder: TGeocoder;
    procedure OnGeocodeReverseEvent(const Address: TCivicAddress);

    procedure processArray<T>(const Arr: array of T;
                             Processor: TArrayProcessor<T>);
    procedure iteratecontrols(AParent: TFMXObject);
    procedure IncreaseComponentSize(AParent: TFMXObject; ScaleFactor: real);
    procedure ReduceComponentSize(AParent: TFMXObject; scalefactor: real);
    procedure ListAllStyleElements(Control: TStyledControl);
    procedure ListStyleResources(Control : TStyledControl);


    procedure DisplayRationale(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const APostRationaleProc: TProc);

    procedure TakePicturePermissionRequestResult(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const AGrantResults: TClassicPermissionStatusDynArray);

    procedure AudioRationale(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const APostRationaleProc: TProc);

    procedure AudioPermissionRequestResult(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const AGrantResults: TClassicPermissionStatusDynArray);

    procedure StartRecording;

    procedure UpdateEffect;
    procedure UpdateUI;
    procedure SelectedNameView(Name: string);
    function UpdateData: integer;
    procedure Empty_Controls(AParent: TFMXObject);
    procedure ComponentDefaultFont(AParent: TFMXObject; ScaleFactor: real);

    procedure WriteAudiotoDB(PK: Integer);
    procedure PlayNote(PK_Record: integer);

    procedure SelectedNameMemo(Name: string);
  public
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;
  ScaleState: single;

const
  DefaultFontSize : Real = 14;

implementation

{$R *.fmx}


{$IFDEF ANDROID}
{$ENDIF}

uses UnDM, UnLocation;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
    FRawBitMap := TBitmap.Create(0,0);
end;

destructor TForm1.Destroy;
begin
  FreeAndNil(FRawBitmap);
  inherited Destroy;
end;

procedure TForm1.OnGeocodeReverseEvent(const Address: TCivicAddress);
begin

  ListBoxItemAdminArea.ItemData.Detail       := 'Closest Address';
  ListBoxItemCountryCode.ItemData.Detail     := Address.CountryCode;
  ListBoxItemCountryName.ItemData.Detail     := Address.CountryName;
  ListBoxItemFeatureName.ItemData.Detail     := Address.FeatureName;
  ListBoxItemLocality.ItemData.Detail        := Address.Locality;
  ListBoxItemPostalCode.ItemData.Detail      := Address.PostalCode;
  ListBoxItemSubAdminArea.ItemData.Detail    := Address.SubAdminArea;
  ListBoxItemSubLocality.ItemData.Detail     := Address.SubLocality;
  ListBoxItemSubThoroughfare.ItemData.Detail := Address.SubThoroughfare;
  ListBoxItemThoroughfare.ItemData.Detail    := Address.Thoroughfare;


end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
 {$IFDEF ANDROID}
  if Switch1.IsChecked then
  begin
    var PermissionAccessCoarseLocation := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
    var PermissionAccessFineLocation := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);

    TPermissionsService.DefaultService.RequestPermissions([PermissionAccessCoarseLocation, PermissionAccessFineLocation],
       procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
       begin
         if AGrantResults[0] = TPermissionStatus.Granted then
           LocationSensor1.Active := Switch1.IsChecked
         else
           Switch1.IsChecked := False;
       end,
       procedure (const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc)
       var
         RationaleMsg: string;
       begin
         for var i := Low(APermissions) to High(APermissions) do
         begin
           if APermissions[i] = PermissionAccessCoarseLocation then
             RationaleMsg := RationaleMsg + 'The app needs to access the CoarseLocation for defining location' + sLineBreak + sLineBreak
           else if APermissions[i] = PermissionAccessFineLocation then
             RationaleMsg := RationaleMsg + 'The app needs to access the FineLocation for defining location';
         end;

         TDialogService.ShowMessage(RationaleMsg, procedure(const AResult: TModalResult)
           begin
             APostRationaleProc;
           end);
       end
    )
  end
  else
    LocationSensor1.Active := False;
{$ELSE}
  LocationSensor1.Active := Switch1.IsChecked;
{$ENDIF}
end;


procedure TForm1.AudioRationale(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const APostRationaleProc: TProc);
begin
    TDialogService.ShowMessage('The app needs to access the device''s storage to save the Voice notes',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TForm1.AudioPermissionRequestResult(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const AGrantResults: TClassicPermissionStatusDynArray);
begin

    if (Length(AGrantResults) = 3) and
     (AGrantResults[0] = TPermissionStatus.Granted) and
     (AGrantResults[1] = TPermissionStatus.Granted) and
     (AGrantResults[2] = TPermissionStatus.Granted)
  then
  begin
    StartRecording;
  end
  else
  begin
    TDialogService.ShowMessage('Cannot Record Notes because the required permission has not been granted');
  end;

end;

procedure TForm1.StartRecording;
begin

     TThread.CreateAnonymousThread(
       procedure
       begin

             TThread.Synchronize(TThread.CurrentThread, procedure
              begin

              LblStatus.Text := 'Recording in progress';

              end);

       end
      ).start;

  {$IFDEF ANDROID}
  FMediaRecorder := TJMediaRecorder.Create;
  FMediaRecorder.setAudioSource(TJMediaRecorder_AudioSource.JavaClass.MIC);
  FMediaRecorder.setOutputFormat(TJMediaRecorder_OutputFormat.JavaClass.THREE_GPP);
  FFileName := TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp');
  FMediaRecorder.setOutputFile(StringToJString(FFileName));
  FMediaRecorder.setAudioEncoder(TJMediaRecorder_AudioEncoder.JavaClass.AMR_NB);
  FMediaRecorder.prepare;
  FMediaRecorder.start;
  {$ENDIF}

  Timer1.Enabled := true;

  //showmessage('Should Have Started');

end;




procedure TForm1.Empty_Controls(AParent: TFMXObject);
begin

     TThread.CreateAnonymousThread(procedure
     var
       I: integer;
       Child: TFMXObject;
     begin

        For I := 0 to AParent.ChildrenCount - 1 do
        begin

           Child := AParent.children[i];

           Empty_Controls(Child); //recursion

           if Child.name <> '' then
           begin

              TThread.Synchronize(TThread.CurrentThread, procedure
              begin

                If Child is TEdit then
                begin
                  if TEdit(Child).Text <> '' then
                  TEdit(Child).Text := ''
                 end;

              end)

           end;//Child

        end;//i

     end).Start;
end;



procedure TForm1.DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
begin

  TDialogService.ShowMessage('The app needs to access the device''s storage to save the photos',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TForm1.TabItem9MouseEnter(Sender: TObject);
var
  URLString: string;
 // MapCenter: TMapCoordinate;
begin

  //if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
  //begin
 //   MapView1.ControlOptions := MapView1.ControlOptions + [TMapControlOption.MyLocation];
   // MapView1.LayerOptions := MapView1.LayerOptions + [TMapLayerOption.UserLocation];
  //end;

    FormatSettings.DecimalSeparator := '.';

    URLString := Format('https://maps.google.com/maps?q=%2.6f,%2.6f', [51.316965 , -2.534651]);
//
//    EdLat.Text := '51.316965';
//    EdLong.Text := '-2.534651';
//
//    MapCenter := TMapCoordinate.Create(StrToFloat(edLat.Text,
//                                       TFormatSettings.Invariant),
//                                       StrToFloat(edLong.Text,
//                                       TFormatSettings.Invariant));
//    MapView1.Location := MapCenter;


  //WebBrowser2.Navigate(URLString);
end;

procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
var
  ScaleFactor: Single;
begin
  if Image.Width > 1024 then
  begin
    ScaleFactor := Image.Width / 1024;
    Image.Resize(Round(Image.Width / ScaleFactor), Round(Image.Height / ScaleFactor));
  end;
  FRawBitmap.Assign(Image);
  ImageContainer.Bitmap.Assign(Image);
  UpdateEffect;

end;


procedure TForm1.TakePicturePermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
begin

  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
  begin
    TakePhotoFromCameraAction1.Execute;
  end
  else
  begin
    TDialogService.ShowMessage('Cannot take photos because the required permission has not been granted');
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

    TThread.CreateAnonymousThread(procedure
     begin

              TThread.Synchronize(TThread.CurrentThread, procedure
              begin

                BtnStopRecClick(Sender);

                showmessage('Voice note Limit reached');

                Timer1.Enabled := false;
              end)

     end).Start;



end;

procedure TForm1.UpdateEffect;
begin
  if Assigned(FEffect) then
  begin
    FEffect.ValuesAsBitmap['Input'] := FRawBitmap;
    ImageContainer.Bitmap := FEffect.ValuesAsBitmap['Output'];
  end;
end;

procedure TForm1.ComponentDefaultFont(AParent: TFMXObject; ScaleFactor: real);
var
 I, x: Integer;
 Child: TFMXObject;
 Item : TListBoxItem;
begin


  for I := 0 to AParent.childrenCount - 1 do
  begin

     Child := AParent.Children[I];

          If TControl(child) is TEdit then
          begin

              TEdit(Child).StyledSettings := TEdit(Child).StyledSettings - [TStyledSetting.Size];
              TEdit(Child).TextSettings.Font.size := DefaultfontSize;

          end;

          If TControl(child) is TLabel then
          begin

              TLabel(Child).StyledSettings := TLabel(Child).StyledSettings - [TStyledSetting.Size];
              TLabel(Child).TextSettings.Font.size := DefaultfontSize;

          end;


          If TControl(child) is TDateEdit then
          begin

            TDateEdit(Child).StyledSettings := TDateEdit(Child).StyledSettings - [TStyledSetting.Size];
            TDateEdit(Child).Font.Size := DefaultfontSize;
          end;

          If TControl(child) is TComboBox then
          begin

            for x := 0 to TComboBox(Child).Count-1 do begin
             Item := TComboBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
             Item.Font.Size := DefaultfontSize;
           //  Item.Height := Item.Height * ScaleFactor;
            end;

          end;

          If TControl(child) is TListBox then
          begin

            for x := 0 to TListBox(Child).Count-1 do begin
             Item := TListBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
             Item.Font.Size := DefaultfontSize;
            // Item.Height := Item.Height * ScaleFactor;
            end;
          end;


          //Recursion
          ComponentDefaultFont(Child, ScaleFactor);

  end;//i

end;


procedure TForm1.ReduceComponentSize(AParent: TFMXObject; scalefactor: real);
var
 I, x: Integer;
 Child: TFMXObject;
 Item : TListBoxItem;
 DropDownButton: Tcontrol;
 StyleObj: TFMXObject;
begin



  for I := 0 to AParent.childrenCount - 1 do
  begin
     Child := AParent.Children[I];

          If TControl(child) is TButton then
          begin

            TButton(Child).Width := TButton(Child).Width /ScaleFactor;
            TButton(Child).Height := TButton(Child).Height /ScaleFactor;


            TButton(Child).StyledSettings := TButton(Child).StyledSettings - [TStyledSetting.Size];

            TButton(Child).TextSettings.Font.Size := TButton(Child).TextSettings.Font.Size/ScaleFactor;

            //For Styled Button like camara
            if TButton(Child).StyleLookup <> '' then
            begin
              TButton(Child).Scale.x := TButton(Child).scale.x / ScaleFactor;
              TButton(Child).Scale.y := TButton(Child).scale.y / ScaleFactor;
            end;
          end;

          If TControl(child) is TLabel then
          begin

            TLabel(Child).Width := TLabel(Child).Width /ScaleFactor;
            TLabel(Child).Height := TLabel(Child).Height /ScaleFactor;

            TLabel(Child).StyledSettings := TLabel(Child).StyledSettings - [TStyledSetting.Size];

            TLabel(Child).TextSettings.Font.Size := TLabel(Child).TextSettings.Font.Size/ScaleFactor;
          end;


          If TControl(child) is TComboBox then
          begin

            TComboBox(Child).Width := TComboBox(Child).Width/scalefactor;
            TComboBox(Child).Height := TComboBox(Child).Height/scalefactor;


            for x := 0 to TComboBox(Child).Count-1 do begin
             Item := TComboBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];

             Item.Font.Size := Item.Font.Size/scalefactor;
             Item.Height := Item.height/scalefactor;

            end;

          end;

          If TControl(child) is TListBox then
          begin

            TListBox(Child).Width := TListBox(Child).Width/scalefactor;
            TListBox(Child).Height := TListBox(Child).Height/scalefactor;


            for x := 0 to TListBox(Child).Count-1 do begin
             Item := TListBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];

             Item.Font.Size := Item.Font.Size/scalefactor;

             Item.Height := Item.height/scalefactor;

            end;

          end;


          If TControl(child) is TListView then
          begin
              TListView(Child).Scale.x := TListView(Child).scale.x / ScaleFactor;
              TListView(Child).Scale.y := TListView(Child).scale.y / ScaleFactor;

          end;


          If TControl(child) is TEdit then
          begin


              TEdit(Child).Width := TEdit(Child).Width/scalefactor;
              TEdit(Child).Height := TEdit(Child).Height/scalefactor;

              TEdit(Child).StyledSettings := TEdit(Child).StyledSettings - [TStyledSetting.Size];
              TEdit(Child).TextSettings.Font.size := Round(TEdit(Child).TextSettings.Font.size/scalefactor);


          end;


          If TControl(child) is TDateEdit then
          begin

            TDateEdit(Child).Width := TDateEdit(Child).Width / ScaleFactor;
            TDateEdit(Child).Height := TDateEdit(Child).Height / ScaleFactor;

            TDateEdit(Child).StyledSettings := TDateEdit(Child).StyledSettings - [TStyledSetting.Size];
            TDateEdit(Child).TextSettings.Font.Size := TDateEdit(Child).TextSettings.Font.Size / ScaleFactor;

           // StyleObj := TDateEdit(Child).FindStyleResource('arrow');// as TControl;

          end;

                    //16-3-25
          If TControl(child) is TMultiview then
          begin
              TMultiview(Child).Scale.x := TMultiview(Child).scale.x / ScaleFactor;
              TMultiview(Child).Scale.y := TMultiview(Child).scale.y / ScaleFactor;

              TMultiview(Child).Width := TMultiview(Child).Width / ScaleFactor;
          end;

          If TControl(child) is TMemo then
          begin

            TMemo(Child).Width := TMemo(Child).Width / ScaleFactor;
            TMemo(Child).Height := TMemo(Child).height / ScaleFactor;

            TMemo(Child).StyledSettings := TMemo(Child).StyledSettings - [TStyledSetting.Size];
            TMemo(Child).Font.Size := TMemo(Child).Font.size / ScaleFactor;
          end;

          If TControl(child) is TToolBar then
          begin
              //TToolBar(Child).Scale.x := TToolBar(Child).scale.x / ScaleFactor;
              //TToolBar(Child).Scale.y := TToolBar(Child).scale.y / ScaleFactor;

            TToolBar(Child).Width := TToolBar(Child).Width / ScaleFactor;
            TToolBar(Child).Height := TToolBar(Child).height / ScaleFactor;

          end;

            // showmessage(Child.StyleName + ' Recursion');
             ReduceComponentSize(Child, ScaleFactor);

  end;//i


end;



procedure TForm1.IncreaseComponentSize(AParent: TFMXObject; ScaleFactor: real); //double
var
 I, x: Integer;
 Child: TFMXObject;
 Item : TListBoxItem;
begin


  for I := 0 to AParent.childrenCount - 1 do
  begin

     Child := AParent.Children[I];


          If TControl(child) is TEdit then
          begin

              TEdit(Child).Width := TEdit(Child).Width * ScaleFactor;
              TEdit(Child).Height := TEdit(Child).height * ScaleFactor;

              TEdit(Child).StyledSettings := TEdit(Child).StyledSettings - [TStyledSetting.Size];
              TEdit(Child).TextSettings.Font.size := Round(TEdit(Child).TextSettings.Font.size * ScaleFactor);

              TEdit(Child).Repaint;

          end;

          If TControl(child) is TLabel then
          begin

              TLabel(Child).Width := TLabel(Child).Width * ScaleFactor;
              TLabel(Child).Height := TLabel(Child).height * ScaleFactor;

              TLabel(Child).StyledSettings := TLabel(Child).StyledSettings - [TStyledSetting.Size];
              TLabel(Child).TextSettings.Font.size := TLabel(Child).TextSettings.Font.size * ScaleFactor;

          end;


          If TControl(child) is TDateEdit then
          begin

            TDateEdit(Child).Width := TDateEdit(Child).Width * ScaleFactor;
            TDateEdit(Child).Height := TDateEdit(Child).height * ScaleFactor;

            TDateEdit(Child).StyledSettings := TDateEdit(Child).StyledSettings - [TStyledSetting.Size];
            TDateEdit(Child).Font.Size := TDateEdit(Child).Font.size * ScaleFactor;
          end;

          If TControl(child) is TButton then
          begin

            TButton(Child).Width := TButton(Child).Width * ScaleFactor;
            TButton(Child).Height := TButton(Child).height * ScaleFactor;

            TButton(Child).StyledSettings := TButton(Child).StyledSettings - [TStyledSetting.Size];
            TButton(Child).Font.Size := TButton(Child).Font.size * ScaleFactor;

            //For Styled Button like camara
            if TButton(Child).StyleLookup <> '' then
            begin
              TButton(Child).Scale.x := TButton(Child).scale.x * ScaleFactor;
              TButton(Child).Scale.y := TButton(Child).scale.y * ScaleFactor;

            end;
          end;

          If TControl(child) is TListView then
          begin
              TListView(Child).Scale.x := TListView(Child).scale.x * ScaleFactor;
              TListView(Child).Scale.y := TListView(Child).scale.y * ScaleFactor;
          end;

          //16-3-24
          If TControl(child) is TMultiview then
          begin
              TMultiview(Child).Scale.x := TMultiview(Child).scale.x * ScaleFactor;
              TMultiview(Child).Scale.y := TMultiview(Child).scale.y * ScaleFactor;

              TMultiview(Child).Width := TMultiview(Child).Width * ScaleFactor;
          end;

          If TControl(child) is TMemo then
          begin

            TMemo(Child).Width := TMemo(Child).Width * ScaleFactor;
            TMemo(Child).Height := TMemo(Child).height * ScaleFactor;

            TMemo(Child).StyledSettings := TMemo(Child).StyledSettings - [TStyledSetting.Size];
            TMemo(Child).Font.Size := TMemo(Child).Font.size * ScaleFactor;
          end;


          If TControl(child) is TComboBox then
          begin

            TComboBox(Child).Width := TComboBox(Child).Width * ScaleFactor;
            TComboBox(Child).Height := TComboBox(Child).height * ScaleFactor;

            for x := 0 to TComboBox(Child).Count-1 do begin
             Item := TComboBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
             Item.Font.Size := Item.Font.Size * ScaleFactor;
             Item.Height := Item.Height * ScaleFactor;
            end;

          end;

          If TControl(child) is TListBox then
          begin

            TListBox(Child).Width := TListBox(Child).Width * ScaleFactor;
            TListBox(Child).Height := TListBox(Child).height * ScaleFactor;

            for x := 0 to TListBox(Child).Count-1 do begin
             Item := TListBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
             Item.Font.Size := Item.Font.Size * ScaleFactor;
             Item.Height := Item.Height * ScaleFactor;
            end;

          end;

          If TControl(child) is TToolBar then
          begin
             // TToolBar(Child).Scale.x := TToolBar(Child).scale.x * ScaleFactor;
             // TToolBar(Child).Scale.y := TToolBar(Child).scale.y * ScaleFactor;


            TToolBar(Child).Width := TToolBar(Child).Width * ScaleFactor;
            TToolBar(Child).Height := TToolBar(Child).height * ScaleFactor;

          end;


             //showmessage(Child.name + ' Recursion');
               IncreaseComponentSize(Child, ScaleFactor);

  end;//i

end;

procedure TForm1.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
 ShowShareSheetAction1.Bitmap := ImageContainer.Bitmap;
end;

procedure TForm1.iteratecontrols(AParent: TFMXObject);
var
  I: Integer;
  Child: TFMXObject;
begin

  For I := 0 to AParent.ChildrenCount - 1 do
  begin

     Child := AParent.children[i];

     iterateControls(Child); //recursion

     if Child.name <> '' then
     begin

       If Child is TEdit then
       begin

        if TEdit(Child).Text = '' then
               showmessage(Child.Name +  ' Edit Must have a Value');
       end;

       if Child is TDateEdit then
       begin

        if TDateEdit(Child).IsEmpty then
              showmessage(Child.Name + ' DateEdit Must have a Value');
       end;

       if Child is TComboBox then
       begin

        If TComboBox(Child).ItemIndex = -1 then
             showmessage(Child.Name + ' ComboBox Must have a Value');
       end;

     end;  //Child <> ''

  end;

end;


procedure TForm1.processArray<T>(const Arr: array of T;
                                 Processor: TArrayProcessor<T>);
var
  I: integer;
begin

  for I := Low(Arr) to High(arr) do
  begin
    processor(Arr[I]);
  end;

end;


procedure TForm1.BtnAnonSyncClick(Sender: TObject);
begin

   TThread.CreateAnonymousThread(
    procedure
    var
      i: integer;
      BlobStream: TStream;
      FileStream: TFileStream;
      MemoryStream: TmemoryStream;
      RawBitMap: TBitMap;
    begin

        dm.FDConnection1.Connected := true;

        dm.FDQuery1.sql.clear;
        dm.FDQuery1.sql.add('Select * FROM "NAMES"');
        dm.FDQuery1.Open;

          While not dm.FDQuery1.EOF And (TerminateThread <> true) do
          begin

            BlobStream := dm.FDQuery1.CreateBlobStream(dm.FDQuery1.FieldByName('PHOTO'), bmRead);
            MemoryStream := TMemoryStream.Create;
            MemoryStream.CopyFrom(BlobStream, 0);
            MemoryStream.Position := 0;

            ImageContainer.Bitmap.LoadFromStream(MemoryStream);

            label1.text := (inttostr(dm.FDQuery1.FieldByName('P_KEY').asinteger)
                            + ' ' + dm.FDQuery1.FieldByName('SITE').asstring);

            TThread.Sleep(2000);


            dm.FDQuery1.Next;

            MemoryStream.Free;
            BlobStream.Free;

          end;

         TerminateThread := False;

         FRawBitmap.SetSize(0, 0);
         ImageContainer.Bitmap.SetSize(0, 0);
         ImageContainer.Bitmap.Assign(FRawBitmap);
         Label1.Text := 'Current Image';
    end

   ).Start;

end;

procedure TForm1.BtnConfirmClick(Sender: TObject);
var
  MemoryStream: TMemoryStream;
  BlobStream: TStream;
  PKValue: integer;
begin

  if Imagecontainer.Bitmap.isempty then
  begin
    showmessage('Image Required - take picture');
    exit;
  end;

  IterateControls(TabItem1);

  If (Name.Text <> '') AND
     (Edit2.Text <> '') AND
     (ComboBox2.ItemIndex <> -1) then
  begin

     try

        BlobStream := TStringStream.Create(MemoRecordNote.Text, TEncoding.UTF8);


        MemoryStream := TMemoryStream.Create;

        ImageContainer.Bitmap.SaveToStream(MemoryStream);
        MemoryStream.Position := 0;

        DM.FDConnection1.Connected := true;

        DM.FDQuery1.sql.clear;

        DM.FDQuery1.sql.add('insert into "NAMES" (SITE, DEPARTMENT, PHOTO, MEMO_NOTE, LATITUDE, LONGITUDE)');
        DM.FDQuery1.sql.add('Values(:Site, :Department, :image, :MemoNote, :Latitude, :Longitude)');

        DM.FDQuery1.Params.ParamByName('Site').AsString := Name.Text;
        DM.FDQuery1.Params.ParamByName('Department').AsString := ComboBox1.Items[ComboBox1.ItemIndex];
        DM.FDQuery1.ParamByName('image').LoadFromStream(MemoryStream, ftBlob);

        DM.FDQuery1.ParamByName('MemoNote').LoadFromStream(BlobStream, ftBlob);

        DM.FDQuery1.Params.ParamByName('Latitude').AsFloat := strtofloat('51.22344');
        DM.FDQuery1.Params.ParamByName('Longitude').AsFloat := strtofloat('-2.223');

        DM.FDQuery1.ExecSQL;

        DM.FDConnection1.Connected := false;

        PKValue := UpdateData;  //Returns Newly inserted PK Value

        Name.text := '';
        Edit2.text := '';

         FRawBitmap.SetSize(0, 0);
         ImageContainer.Bitmap.SetSize(0, 0);
         ImageContainer.Bitmap.Assign(FRawBitmap);

     finally
      MemoryStream.Free;
     end;

    WriteAudiotoDB(PKValue);

    showmessage('Insert Done');

  end;//if

end;


procedure TForm1.BtnCurrCoodClick(Sender: TObject);
begin
  TabCont_Image_Memo.TabIndex := 2;
end;

procedure TForm1.BtnCurrImageClick(Sender: TObject);
begin
  TabCont_Image_Memo.TabIndex := 0;
end;

procedure TForm1.BtnCurrNoteClick(Sender: TObject);
begin
  TabCont_Image_Memo.TabIndex := 1;
end;

procedure TForm1.WriteAudiotoDB(PK: integer);
var
  MemoryStream: TMemoryStream;
  FileName: string;
begin

     try

        MemoryStream := TMemoryStream.Create;

        FileName := TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp');

        MemoryStream.LoadFromFile(FileName);

        MemoryStream.Position := 0;

        DM.FDConnection1.Connected := true;

        DM.FDQuery1.SQL.Clear;
        DM.FDQuery1.SQL.Add('UPDATE "NAMES" SET RECORDING = :Voice');
        DM.FDQuery1.SQL.Add('WHERE P_KEY = :PK');
        DM.FDQuery1.Params.ParamByName('PK').AsInteger := PK;
        DM.FDQuery1.Params.ParamByName('Voice').LoadFromStream(MemoryStream, ftBlob);

        // Execute the query
        DM.FDQuery1.ExecSQL;

        DM.FDConnection1.Connected := false;

        //showmessage('Voice Insert Done');

     finally
      MemoryStream.Free;
     end;

end;


procedure TForm1.BtnDeleteAllClick(Sender: TObject);
var
  RawBitMap : TBitMap;
begin
  dm.FDConnection1.Connected := true;

  dm.FDQuery1.sql.clear;
  dm.FDQuery1.sql.add('DELETE From "NAMES"');

  dm.FDQuery1.ExecSQL;

  dm.FDQuery1.sql.clear;
  dm.FDQuery1.sql.add('DELETE From "SITE_LOCATION"');

  dm.FDQuery1.ExecSQL;


  UpdateData;

  RawBitMap := TBitMap.Create;
  RawBitMap.SetSize(0,0);
  ImageDisplay.Bitmap.SetSize(0, 0);
  ImageDisplay.Bitmap.Assign(RawBitMap);

  TDialogService.ShowMessage('All Records Deleted');

end;

procedure TForm1.UpdateUI;
begin

end;


procedure TForm1.BtnIterateClick(Sender: TObject);
var
  BlobStream: TStream;
  FileStream: TFileStream;
  MemoryStream: TmemoryStream;
  RawBitMap: TBitMap;
begin

  showmessage('Doesn''t Work - use Threads - left in to illustrate non-working code!');
  exit;


  dm.FDConnection1.Connected := true;

  dm.FDQuery1.sql.clear;
  dm.FDQuery1.sql.add('Select * FROM "NAMES"');
      dm.FDQuery1.sql.add(' WHERE SITE = ' + Trim(quotedstr('Larry')));
  dm.FDQuery1.Open;

  While not dm.FDQuery1.EOF do
  begin


             RawBitMap := TBitMap.Create;
             RawBitMap.SetSize(0,0);
             ImageContainer.Bitmap.SetSize(0, 0);
             ImageContainer.Bitmap.Assign(RawBitMap);

             BlobStream := dm.FDQuery1.CreateBlobStream(dm.FDQuery1.FieldByName('PHOTO'), bmRead);
             MemoryStream := TMemoryStream.Create;
             MemoryStream.CopyFrom(BlobStream, 0);

             MemoryStream.Position := 0;

             ImageContainer.Bitmap.LoadFromStream(MemoryStream);

      MemoryStream.Free;
      BlobStream.Free;
     sleep(1000);

   dm.FDQuery1.Next;

  end;


  dm.FDConnection1.Connected := false;

end;

procedure TForm1.BtnNoteDisplayClick(Sender: TObject);
begin
  Tabcontrol2.TabIndex := 1;
end;

procedure TForm1.BtnPayVoiceDBClick(Sender: TObject);
begin

  PlayNote(RecordingRef);    //Need this vali=ue from the ListView to get the PK value

end;

procedure TForm1.PlayNote(PK_Record:integer);
var
  MemoryStream: TMemorystream;
  TempFileName: string;
  BlobStream: TStream;
  PK: Integer;
begin


  MemoryStream := TMemoryStream.Create;

  try
    // Retrieve the BLOB from the database
    DM.FDQuery1.SQL.Clear;
    DM.FDQuery1.SQL.Add('SELECT RECORDING, P_KEY FROM "NAMES" WHERE P_KEY = :PK');
    DM.FDQuery1.Params.ParamByName('PK').AsInteger := PK_Record;
    DM.FDQuery1.Open;

    if not DM.FDQuery1.FieldByName('RECORDING').IsNull then
    begin


      BlobStream := DM.FDQuery1.CreateBlobStream(DM.FDQuery1.FieldByName('RECORDING'), bmRead);


      TBlobField(DM.FDQuery1.FieldByName('RECORDING')).SaveToStream(MemoryStream);
      MemoryStream.Position := 0;


      // Create a temporary file
      TempFileName := TPath.GetTempFileName + '.3gp'; // Adjust the extension to match the media format
      MemoryStream.SaveToFile(TempFileName);

      // Play the file using TMediaPlayer
      MediaPlayer1.FileName := TempFileName;
      MediaPlayer1.Play;
    end
    else
      ShowMessage('No recording found for the specified key.');
  finally
    MemoryStream.Free;
  end;


end;


procedure TForm1.BtnPlayRecClick(Sender: TObject);
begin

  MediaPlayer1.FileName := TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp');

  if MediaPlayer1.Media <> nil then
  begin
      LblStatus.Text := 'Recording Playing...';
      MediaPlayer1.Play;

     If (MediaPlayer1.State = TMediaState.Stopped) then
     begin

       //showmessage('stopped');

          TThread.CreateAnonymousThread(
           procedure
           begin

                 TThread.Synchronize(TThread.CurrentThread, procedure
                  begin
                           LblStatus.Text := 'Recording Finished';
                  end);

           end
          ).start;

     end;

  end else
    showmessage('No Media to Play');






end;

procedure TForm1.BtnReduceSizeClick(Sender: TObject);
begin
  If ScaleState <> 1 then
  begin
    ReduceComponentSize(Form1, 1.25);
    ScaleState := ScaleState - 1;
  end else
  begin
   Showmessage('Minimum Reached');
   exit;
  end;
end;

procedure TForm1.BtnStartRecClick(Sender: TObject);
begin
  try
    if TOSVersion.Check(11) then
    begin

      StartRecording;

    end
    else
    begin

       PermissionsService.RequestPermissions([StorageWritePermission,
                                              StorageReadPermission,
                                              AudioPermission],
                                              AudioPermissionRequestResult,
                                              AudioRationale);
    end;

  except
    on E: Exception do
    begin
      ShowMessage('An error occurred: ' + E.Message);
    end;

  end;
end;



procedure TForm1.BtnTakePhotoClick(Sender: TObject);
begin

  ClearImageAction1.Enabled := not ImageContainer.Bitmap.IsEmpty;

  try
    if TOSVersion.Check(11) then
    begin

    TakePhotoFromCameraAction1.Execute ;
    end
    else
    begin

       PermissionsService.RequestPermissions([StoragePermission], TakePicturePermissionRequestResult, DisplayRationale);
    end;

  except
    on E: Exception do
    begin
      ShowMessage('An error occurred: ' + E.Message);
    end;

  end;


end;

procedure TForm1.BtnTerminateClick(Sender: TObject);
begin
   TerminateThread:= True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

       DM.FDConnection1.Connected := true;

        DM.FDQuery1.sql.clear;

        DM.FDQuery1.sql.add('insert into "SITE_LOCATION" (SITE_NAME)');
        DM.FDQuery1.sql.add('Values(:Site)');

        DM.FDQuery1.Params.ParamByName('Site').AsString := Edit1.text;

        DM.FDQuery1.ExecSQL;


        DM.FDQuery1.sql.clear;
        DM.FDQuery1.sql.add('Select * FROM "SITE_LOCATION"');
        DM.FDQuery1.sql.add(' WHERE "SITE_NAME" = ' +
                            QuotedStr(Edit1.text));
        DM.FDQuery1.Open;

        Showmessage('PK ' + inttostr(DM.FDQuery1.fieldbyName('PK_KEY').asinteger));



end;

procedure TForm1.BtnStopRecClick(Sender: TObject);
begin

  {$IFDEF ANDROID}
  if Assigned(FMediaRecorder) then
  begin
    FMediaRecorder.stop;
    FMediaRecorder.release;
    FMediaRecorder := nil;
    Timer1.Enabled := false;
    LblStatus.Text := 'Recording Stopped';
  end;
  {$ENDIF}


end;

procedure TForm1.BtnImageDisplayClick(Sender: TObject);
begin
  Tabcontrol2.TabIndex := 0;
end;

procedure TForm1.BtnIncreaseSizeClick(Sender: TObject);
begin

  If ScaleState <> 3 then
  begin
   IncreaseComponentSize(self, 1.25);

   ScaleState := ScaleState + 1;
  end else
  begin
    Showmessage('Maximum Reached');
   exit;
  end;
end;

procedure TForm1.BtnEditNoteClick(Sender: TObject);
var
  name: string;
  ListItem: TListViewItem;
  BlobStream: TStream;
begin

  ListItem := TListViewItem(ListView1.Items[ListView1.Itemindex]);
  Name := ListItem.Text;

     try

       BlobStream := TStringStream.Create(MemoNote.Text, TEncoding.UTF8);


        DM.FDConnection1.Connected := true;

        DM.FDQuery1.SQL.Clear;
        DM.FDQuery1.SQL.Add('UPDATE "NAMES" SET MEMO_NOTE = :Note');
        DM.FDQuery1.SQL.Add('WHERE SITE = :Site');

        DM.FDQuery1.Params.ParamByName('Site').AsString := Name;
        DM.FDQuery1.Params.ParamByName('Note').LoadFromStream(BlobStream, ftBlob);

        DM.FDQuery1.ExecSQL;

        DM.FDConnection1.Connected := false;

     finally
      BlobStream.Free;
     end;

end;

procedure TForm1.BtnEmptyEditsClick(Sender: TObject);
begin
  Empty_Controls(Form1);
end;

procedure TForm1.ListAllStyleElements(Control: TStyledControl);
var
 StyleObj: TFMXObject;
 I: Integer;
begin

  Control.ApplyStyleLookup;

  for I := 0 to Control.ChildrenCount -1 do
  begin
      StyleObj := Control.Children[I];
      Showmessage('Class Type: ' + StyleObj.ClassName);

      if StyleObj is TControl then
       ListAllStyleElements(TStyledControl(StyleObj));
  end;


end;

procedure TForm1.ListStyleResources(Control : TStyledControl);
var
  StyleObj: TFMXObject;
  I: integer;
begin

  StyleObj := Control.FindStyleResource('arrow');
  if assigned(StyleObj) then
   showmessage('arrow found');  //dropbutton

end;

procedure TForm1.ListView1Change(Sender: TObject);
var
  name: string;
  ListItem: TListViewItem;
begin

  ListItem := TListViewItem(ListView1.Items[ListView1.Itemindex]);

  Name := ListItem.Text;

  //RecordingRef := Name;  need to formalise name or PK as the reference

  BtnPayVoiceDB.Enabled := true;

  SelectedNameView(Name);

  SelectedNameMemo(Name);

end;

procedure TForm1.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  URLString: String;
  LSettings: TFormatSettings;
  LDecSeparator : Char;
begin
  LDecSeparator := FormatSettings.DecimalSeparator;
  LSettings := FormatSettings;
  try
    FormatSettings.DecimalSeparator := '.';
    // Show current location
    ListBoxItemLatitude.ItemData.Detail  := Format('%2.6f', [NewLocation.Latitude]);
    ListBoxItemLongitude.ItemData.Detail := Format('%2.6f', [NewLocation.Longitude]);

    // Show Map using Google Maps
    URLString := Format('https://maps.google.com/maps?q=%2.6f,%2.6f', [ NewLocation.Latitude, NewLocation.Longitude]);
  finally
    FormatSettings.DecimalSeparator := LDecSeparator;
  end;
 // WebBrowser1.Navigate(URLString);
  //WebBrowser2.Navigate(URLString);

  // Setup an instance of TGeocoder
  try
    if not Assigned(FGeocoder) then
    begin
      if Assigned(TGeocoder.Current) then
        FGeocoder := TGeocoder.Current.Create;
      if Assigned(FGeocoder) then
        FGeocoder.OnGeocodeReverse := OnGeocodeReverseEvent;
    end;
  except
    ListBoxGroupHeader1.Text := 'Geocoder service error.';
  end;

  // Translate location to address
  if Assigned(FGeocoder) and not FGeocoder.Geocoding then
    FGeocoder.GeocodeReverse(NewLocation);

end;

procedure TForm1.NextTabAction1Update(Sender: TObject);
begin
    // BtnPayVoiceDB.Enabled := false;
   //  LblStatus.Text := '';
end;

procedure TForm1.SelectedNameMemo(Name: string);
var
  BlobStream: TStream;
  Stringlist: TStringList;
begin

  DM.FDConnection1.Connected := true;

  DM.FDQuery1.sql.clear;
  DM.FDQuery1.sql.add('Select * FROM "NAMES"');
  DM.FDQuery1.sql.add(' WHERE "SITE" = ' +
                            Trim(QuotedStr(Name)));
  DM.FDQuery1.Open;

  Try
    BlobStream := DM.FDQuery1.CreateBlobStream(DM.FDQuery1.FieldByName('MEMO_NOTE'), bmRead);

    StringList:= TStringList.create;

    StringList.LoadFromStream(BlobStream);

    MemoNote.lines.Clear;

    MemoNote.Lines.Assign(StringList);

  Finally
    StringList.free;
    BlobStream.Free;
  End;

  //Reference to Recording 23-3-24
  RecordingRef := DM.FDQuery1.FieldByName('P_KEY').AsInteger;

  DM.FDConnection1.Connected := false;

end;


procedure TForm1.SelectedNameView(Name: string);
var
  BlobStream: TStream;
  FileStream: TFileStream;
  MemoryStream: TmemoryStream;
  RawBitMap: TBitMap;
begin

  DM.FDConnection1.Connected := true;

  DM.FDQuery1.sql.clear;
  DM.FDQuery1.sql.add('Select * FROM "NAMES"');
  DM.FDQuery1.sql.add(' WHERE "SITE" = ' +
                            Trim(QuotedStr(Name)));
  DM.FDQuery1.Open;

  //showmessage('validate');

  BlobStream := DM.FDQuery1.CreateBlobStream(DM.FDQuery1.FieldByName('PHOTO'), bmRead);

  RawBitMap := TBitMap.Create;
  RawBitMap.SetSize(0,0);
  ImageDisplay.Bitmap.SetSize(0, 0);
  ImageDisplay.Bitmap.Assign(RawBitMap);

  MemoryStream := TMemoryStream.Create;
  MemoryStream.CopyFrom(BlobStream, 0);
  MemoryStream.Position := 0;

  ImageDisplay.Bitmap.LoadFromStream(MemoryStream);

  MemoryStream.Free;
  BlobStream.Free;

  //Reference to Recording 23-3-24
  RecordingRef := DM.FDQuery1.FieldByName('P_KEY').AsInteger;

 DM.FDConnection1.Connected := false;



end;

procedure TForm1.ClearImageAction1Execute(Sender: TObject);
begin
  FRawBitmap.SetSize(0, 0);
  ImageContainer.Bitmap.SetSize(0, 0);
  ImageContainer.Bitmap.Assign(FRawBitmap);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin


  case Combobox1.ItemIndex of
    0: Form1.StyleBook := DM.StyleBook1;
    1: Form1.StyleBook := DM.StyleBook2;
    2: Form1.StyleBook := DM.StyleBook3;
    3: Form1.StyleBook := DM.StyleBook4;
    4: Form1.StyleBook := DM.StyleBook5;
  else
     Form1.StyleBook := DM.StyleBook2;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  ScaleState := 1;
  ImageContainer.Bitmap.Assign(FRawBitMap);

end;

Function TForm1.UpdateData: Integer;
begin

  DM.FDConnection1.Connected := true;

  DM.FDQuery1.sql.clear;
  DM.FDQuery1.sql.add('Select * FROM "NAMES"');
  DM.FDQuery1.Open;

  ListView1.items.Clear;  //Was data 22-3-24

  While not dm.FDQuery1.EOF do
  begin

    with TListViewItem(ListView1.Items.Add) do
    begin
      Text := DM.FDQuery1.fieldbyname('SITE').asstring;// [1000 + Random(1234567)]);
      Detail := InttoStr(DM.FDQuery1.fieldbyname('P_KEY').asInteger);
      //Format('%d kg of paper', [1000 + Random(1234)]);
    end;

    DM.FDQuery1.Next;
  end;

  result := DM.FDQuery1.fieldbyname('P_KEY').asInteger;

end;


procedure TForm1.FormShow(Sender: TObject);
begin
    Form1.StyleBook := DM.StyleBook2;

    UpdateData ;

    ComponentDefaultFont(Form1, 12);

end;

procedure TForm1.Panel2Resize(Sender: TObject);
var
  ScreenService: IFMXScreenService;
begin

  If TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService))
  then
  begin

    if screenService.GetScreenOrientation in [TscreenOrientation.Portrait,
                                              TscreenOrientation.InvertedPortrait] then
    begin
    // showmessage('Portrait Orientation ' + floattostr(Panel2.width));
     If Panel2.width >300 then Panel2.width := 300;
     If Panel2.width <200 then Panel2.width := 200;

     If PnlImage_Memo.height >170 then PnlImage_Memo.height := 170;
     If PnlImage_Memo.height <170  then PnlImage_Memo.height := 170;

    end
    else
    begin
     //showmessage('Landscape Orientation')
     If Panel2.width >500 then Panel2.width := 500;
     If Panel2.width <200 then Panel2.width := 200;

     If PnlImage_Memo.height >45 then PnlImage_Memo.height := 45;
     If PnlImage_Memo.height <45 then PnlImage_Memo.height := 45;


    end;


  end;

end;

procedure TForm1.PreviousTabAction1Update(Sender: TObject);
begin

  //BtnPayVoiceDB.Enabled := false;
  //LblStatus.Text := '';
end;

end.

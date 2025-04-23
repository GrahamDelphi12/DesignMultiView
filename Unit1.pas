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
  {$IFDEF ANDROID}
      Androidapi.Helpers,
      Androidapi.JNI.Media,
      Androidapi.JNI.JavaTypes,
      Androidapi.JNI.Os,
  {$ENDIF}
  System.Sensors,
  System.Sensors.Components,
  FMX.WebBrowser,
  FMX.Maps,
  System.Threading,
  DateUtils,
  System.generics.collections, System.Rtti, FMX.Grid.Style, FMX.Grid;


 type
   TImage_Memo = record
   ImageTag: integer;
   ImageName: string;
   MemoTag: integer;
   MemoName: string;
   MemoStream :TMemoryStream;
   ImageStream : TMemoryStream;
  end;

  TImage_Memo_Store = Array of TImage_Memo;

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
    PnlImages: TPanel;
    PlnNotes: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    ClearImageAction1: TAction;
    Panel4: TPanel;
    TabItem3: TTabItem;
    Memo1: TMemo;
    PnlDeptsCreated: TPanel;
    BtnIncreaseSize: TButton;
    BtnReduceSize: TButton;
    ComboBox1: TComboBox;
    ToolBar3: TToolBar;
    BtnDeleteAll: TButton;
    Button2: TButton;
    Button3: TButton;
    ImageList1: TImageList;
    Label6: TLabel;
    Label7: TLabel;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
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
    TabItem6: TTabItem;
    LocationSensor1: TLocationSensor;
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
    TIStartpage: TTabItem;
    PlnStartHost: TPanel;
    PlnStartTitle: TPanel;
    Label8: TLabel;
    PnlHostCreateRecord: TPanel;
    BtnShow: TButton;
    Button5: TButton;
    PnlHostSiteSelect: TPanel;
    PnlHostSitePhoto: TPanel;
    TabConHostSelectSite: TTabControl;
    TIAddSite: TTabItem;
    TIChooseSite: TTabItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Splitter2: TSplitter;
    FlowLayout3: TFlowLayout;
    FlowLayout4: TFlowLayout;
    LOCreateSite: TLayout;
    EdID: TEdit;
    Label10: TLabel;
    LOProRef: TLayout;
    Label13: TLabel;
    EdProjectRef: TEdit;
    LOContact: TLayout;
    Label14: TLabel;
    EdContact: TEdit;
    LOEmail: TLayout;
    Label12: TLabel;
    EdEmail: TEdit;
    LOAddress: TLayout;
    Label11: TLabel;
    EdAddress: TEdit;
    LOProject: TLayout;
    Label16: TLabel;
    MemNote: TMemo;
    LOSiteShow: TLayout;
    Label9: TLabel;
    CBOrganisations: TComboBox;
    LOAddressShow: TLayout;
    LblAddress: TLabel;
    LOEmailShow: TLayout;
    LblEmail: TLabel;
    LOProjectShow: TLayout;
    LblProjectRef: TLabel;
    LOContaxtShow: TLayout;
    LblContact: TLabel;
    LOProjectNotesShow: TLayout;
    Label15: TLabel;
    MemProjectDescription: TMemo;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MemoDepartments: TMemo;
    Button7: TButton;
    PnlDeptCreate: TPanel;
    LOSiteName: TLayout;
    Label5: TLabel;
    LblSite_Name: TLabel;
    BtnAddNewSite: TButton;
    BtnSelectSite: TButton;
    LbSite_Name: TLabel;
    LblSiteCode: TLabel;
    PnlPopup: TPanel;
    BtnShowAddDept: TButton;
    EdNewLocation: TEdit;
    PlnVoice: TPanel;
    BtnTakePhoto: TButton;
    FloatAnimation1: TFloatAnimation;
    Image2: TImage;
    VertScrollBox1: TVertScrollBox;
    FlowLayout2: TFlowLayout;
    BtnDeleteSelected: TButton;
    Layout2: TLayout;
    BtnOK: TButton;
    BtnCancel: TButton;
    MemoShowNote: TMemo;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Switch1: TSwitch;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItemLatitude: TListBoxItem;
    ListBoxItemLongitude: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItemAdminArea: TListBoxItem;
    ListBoxItemFeatureName: TListBoxItem;
    ListBoxItemSubLocality: TListBoxItem;
    ListBoxItemPostalCode: TListBoxItem;
    ListBoxItemCountryCode: TListBoxItem;
    ListBoxItemCountryName: TListBoxItem;
    ListBoxItemLocality: TListBoxItem;
    ListBoxItemSubAdminArea: TListBoxItem;
    ListBoxItemSubThoroughfare: TListBoxItem;
    ListBoxItemThoroughfare: TListBoxItem;
    WebBrowser1: TWebBrowser;
    LONavCoods: TLayout;
    LblLat: TLabel;
    LblLong: TLabel;
    PlnMemo: TPanel;
    Label2: TLabel;
    MemMainNotes: TMemo;
    MemoRecordNote: TMemo;
    BtnPlay: TButton;
    Image5: TImage;
    LOVoiceNotes: TLayout;
    BtnPlayRec: TButton;
    Layout5: TLayout;
    Image1: TImage;
    Label21: TLabel;
    BtnStopRec: TButton;
    Layout4: TLayout;
    Image4: TImage;
    Label4: TLabel;
    BtnStartRec: TButton;
    Layout3: TLayout;
    Image3: TImage;
    Label3: TLabel;
    BtnCreateOrgRec: TButton;
    BtnReadLog: TButton;
    LblDeptCode: TLabel;
    FLOThumbNails: TFlowLayout;
    SGOrg: TStringGrid;
    SGLoc: TStringGrid;
    SGDetail: TStringGrid;
    BtnDatabase: TButton;
    LblDeptName: TLabel;
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
    procedure ListView1Change(Sender: TObject);
    procedure BtnIncreaseSizeClick(Sender: TObject);
    procedure BtnReduceSizeClick(Sender: TObject);
    procedure PlnNotesResize(Sender: TObject);
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
    procedure BtnCreateOrgRecClick(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
    procedure CBOrganisationsChange(Sender: TObject);
    procedure TabConHostSelectSiteChange(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure BtnAddNewSiteClick(Sender: TObject);
    procedure BtnSelectSiteClick(Sender: TObject);
    procedure BtnShowAddDeptClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure EdNewLocationClick(Sender: TObject);
    procedure VertScrollBox1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure BtnDeleteSelectedClick(Sender: TObject);
    procedure BtnReadLogClick(Sender: TObject);
    procedure BtnDatabaseClick(Sender: TObject);
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
    {$IFDEF ANDROID}
      FMediaRecorder: JMediaRecorder;
    {$ENDIF}

    FFileName: string;
    RecordingRef: string;//integer;

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
    procedure SelectedNameView(DeptRef: string);
    Function UpdateListviewData(CallingProcedure: string): Integer;
    procedure Empty_Controls(AParent: TFMXObject);
    procedure ComponentDefaultFont(AParent: TFMXObject; ScaleFactor: real);

    procedure WriteAudiotoDB(PK: string); //Integer
    procedure PlayNote(PK_Record: String); // integer

    procedure SelectedNameMemo(Name: string);

    Procedure UpdateOrganisationData;
    Procedure UpdateLocationData;
    //
    procedure ImageDblClick(Sender: TObject);
    procedure CalculateFlowLayoutHeight(FLO: TFlowLayOut);

    procedure DoMapDispay(Lat, Long : string);
    //

    function WriteSelectedDetailsToRecord: TImage_Memo_Store;

    procedure WriteToLog(const Msg: string);

    procedure ReadLogFile;


    procedure CreateReviewThumbNails(SiteRefLookUp: string; Image: TBitMap);

    procedure ImageFullSizeDblClick(Sender: TObject);

    procedure Cycle_Threads;

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

procedure TForm1.WriteToLog(const Msg: string);
var
  LogFile: TextFile;
  LogPath: string;
begin
  // Set the path for the log file
  LogPath := TPath.Combine(TPath.GetDocumentsPath, 'AppLog.txt');

  // Append the message to the log file
  AssignFile(LogFile, LogPath);
  if FileExists(LogPath) then
    Append(LogFile)
  else
    Rewrite(LogFile);

  try
    Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ': ' + Msg);
  finally
    CloseFile(LogFile);
  end;
end;

procedure TForm1.ReadLogFile;
var
  StringList: TStringList;
  FileStream : TFileStream;
  LogPath: string;
begin
  StringList := TStringList.Create;
  try

    LogPath := TPath.Combine(TPath.GetDocumentsPath, 'AppLog.txt');

    StringList.LoadFromFile(LogPath); // Replace with the file's path
    ShowMessage(StringList.Text);               // Display the file's content

      // Clear the file's content
    FileStream := TFileStream.Create(LogPath, fmOpenWrite);
    try
      FileStream.Size := 0; // Truncate the file to 0 bytes
    finally
      FileStream.Free; // Free the stream
    end;


  finally
    StringList.Free;                            // Free memory
  end;
end;

procedure TForm1.Cycle_Threads;
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

        dm.FDQDetails.sql.clear;
        dm.FDQDetails.sql.add('Select * FROM "NAMES"');
        dm.FDQDetails.Open;

          While not dm.FDQDetails.EOF And (TerminateThread <> true) do
          begin

            BlobStream := dm.FDQDetails.CreateBlobStream(dm.FDQDetails.FieldByName('PHOTO'), bmRead);
            MemoryStream := TMemoryStream.Create;
            MemoryStream.CopyFrom(BlobStream, 0);
            MemoryStream.Position := 0;

            ImageContainer.Bitmap.LoadFromStream(MemoryStream);

            label1.text := (inttostr(dm.FDQDetails.FieldByName('P_KEY').asinteger)
                            + ' ' + dm.FDQDetails.FieldByName('SITECODE').asstring);

            TThread.Sleep(2000);


            dm.FDQDetails.Next;

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


procedure TForm1.CreateReviewThumbNails(SiteRefLookUp: string; Image: TBitMap);
var
  ScaleFactor: Single;
  Img: TImage;
  Memo : TMemo;

begin

     // ImageContainer.Bitmap.Assign(Image);


      if Image.Width > 1024 then
      begin
        ScaleFactor := Image.Width / 1024;
        Image.Resize(Round(Image.Width / ScaleFactor), Round(Image.Height / ScaleFactor));
      end;

      writetolog('In CreateReviewThumbNails 1');

           FLOThumbNails.BeginUpdate;

            Img := TImage.Create(FLOThumbNails);//LOImagesTaken
            Img.Parent := FLOThumbNails; //LOImagesTaken// Assign parent to FlowLayout
            Img.Align := TAlignLayout.None; // Allow free placement
            Img.WrapMode := TImageWrapMode.Stretch; // Stretch the image to fit
            Img.Width := 120; // Set width (adjust as needed)
            Img.Height := 100; // Set height (adjust as needed)
            Img.HitTest := True;
            Img.name := 'Image_' + FormatDateTime('yyyyMMdd_HHmmsszzz', Now);
            Img.tag := StrtoInt(SiteRefLookUp);//Maintain ref or original

            writetolog('In CreateReviewThumbNails 2');

            Img.OnDblClick :=  ImageFullSizeDblClick;//ImageDblClick;

              //
//               Memo := TMemo.Create(FLOThumbNails);//LOImagesTaken
//               Memo.Parent := FLOThumbNails; //LOImagesTaken// Assign parent to FlowLayout
//               Memo.Align := TAlignLayout.None; // Allow free placement
//               Memo.Width := 120; // Set width (adjust as needed)
//               Memo.Height := 20; // Set height (adjust as needed)
//               Memo.HitTest := True;
//               Memo.name := 'Memo_' + FormatDateTime('yyyyMMdd_HHmmsszzz', Now);
               //Memo.Tag := Img.Tag;
              //
           // Img.Bitmap.Assign(ImageContainer.Bitmap);
            Img.Bitmap.Assign(Image);

            FLOThumbNails.EndUpdate;

            CalculateFlowLayoutHeight(FLOThumbNails);

            //VertScrollbox1.RealignContent;
end;


function TForm1.WriteSelectedDetailsToRecord: TImage_Memo_Store;
var
  ImageStream: TMemoryStream;
  MemoStream : TMemoryStream;
  i, x : Integer;
  ImagetoRecord: TImage;
  MemotoRecord: TMemo;
  Image_Memo_Store : TImage_Memo_Store; //Array
begin

  x := 0;
  SetLength(Image_Memo_Store, Trunc(FlowLayOut2.ControlsCount/3));


      for i := 0 to FlowLayOut2.ControlsCount - 1 do
      begin

          if (FlowLayOut2.Controls[i] is TImage) OR
                 (FlowLayOut2.Controls[i] is TMemo) then
          begin

             if FlowLayOut2.Controls[i] is TImage then
             begin
                ImagetoRecord := TImage(FlowLayOut2.Controls[i]);

                Image_Memo_Store[x].ImageTag := ImagetoRecord.Tag;
                Image_Memo_Store[x].ImageName := ImagetoRecord.Name;


                if Assigned(ImagetoRecord.Bitmap) then
                begin
                    Image_Memo_Store[x].ImageStream := TMemoryStream.Create;
                    ImagetoRecord.Bitmap.SaveToStream(Image_Memo_Store[x].ImageStream);

                end else
                begin
                 WriteToLog('Bitmap is nil for Image: ' + ImagetoRecord.Name);
                end;

             end;

            WriteToLog('In procedure: Check for Memo');

            if FlowLayOut2.Controls[i] is TMemo then
            begin

              WriteToLog('In procedure: Have Memo');

              MemotoRecord := TMemo(FlowLayOut2.Controls[i]);

              WriteToLog('In procedure: MemoRecord.tag = ' + inttostr(MemotoRecord.Tag));

              Image_Memo_Store[x].MemoTag := MemotoRecord.Tag;
              Image_Memo_Store[x].MemoName := MemotoRecord.Name;

              WriteToLog('In procedure: Tag = ' + inttostr(Image_Memo_Store[x].MemoTag)
                         + ' Name = ' + Image_Memo_Store[x].MemoName) ;

              if Assigned(MemotoRecord) then
              begin
                 WriteToLog('In procedure: Memo assigned');
                 Image_Memo_Store[x].MemoStream := TMemoryStream.Create;
                 MemotoRecord.Lines.SaveToStream(Image_Memo_Store[x].MemoStream);
                 WriteToLog('In procedure: Memo assignment completed for Tag = '
                             + inttostr(Image_Memo_Store[x].MemoTag));

              end;

            end;

          end; //Image or Memo Found

          if (Image_Memo_Store[x].MemoTag =
                              Image_Memo_Store[x].ImageTag) then
          begin

                if (Image_Memo_Store[x].MemoTag <> 0) then
                begin
                    WriteToLog('Image ' + inttostr(Image_Memo_Store[x].ImageTag));
                    WriteToLog('Mmeo ' + inttostr(Image_Memo_Store[x].MemoTag));
                    Inc(x);
                    WriteToLog('x value after inc = ' + inttostr(x));
                end;

          end;//inc conditions separated for clarity



      end; //flow

      result := Image_Memo_Store;

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




procedure TForm1.EdNewLocationClick(Sender: TObject);
begin
  EdNewLocation.Text := '';
end;

procedure TForm1.Empty_Controls(AParent: TFMXObject);
begin

    writetolog('in empty controls with Layout 4');

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

     writetolog('Finished empty controls with Layout 4');
end;



procedure TForm1.DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
begin

  TDialogService.ShowMessage('The app needs to access the device''s storage to save the photos',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TForm1.TabConHostSelectSiteChange(Sender: TObject);
begin


  writetolog('In TabConHostSelectSiteChange - calling UpdateOrganisationData');
  UpdateOrganisationData;

  UpdateLocationData;

  If TIAddSite.IsSelected then
  ListBox1.Visible := true else
  Listbox1.Visible := false;

  If TIChooseSite.IsSelected then
  Begin
    //showmessage('choose site');
    WebBrowser1.Visible := true;
   // DoMapDispay('','');
  End else
    WebBrowser1.Visible := false;



  If TIAddSite.IsSelected then
  begin

     TThread.CreateAnonymousThread(procedure
     begin

              TThread.Synchronize(TThread.CurrentThread, procedure
              begin

                LblSiteCode.Text := '';
                LbSite_Name.Text := '';

              end)

     end).Start;

  end;

end;

procedure TForm1.DoMapDispay(Lat, Long : string);
var
  URLString: string;
  LatVal, LongVal: double;
begin


    LatVal := StrToFloat(Lat);
    LongVal := StrtoFloat(Long);

   // URLString := Format('https://maps.google.com/maps?q=%2.6f,%2.6f', [51.316965 , -2.534651]);
    URLString := Format('https://maps.google.com/maps?q=%2.6f,%2.6f', [LatVal , LongVal]);


    WebBrowser1.Navigate(URLString);

end;


procedure TForm1.TabControl1Change(Sender: TObject);
begin

  If TabItem2.IsSelected Then
  begin
   UpdateListviewData('TabControl1Change');//2-4-25
  end;

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

procedure TForm1.ImageFullSizeDblClick(Sender: TObject);
var
  tagValue : integer;
  BlobStream: TStream;
  MemoryStream: TmemoryStream;
begin

  if Sender is TImage then
  begin

    TagValue := (sender as TImage).tag;

    DM.FDConnection1.Connected := true;

        DM.FDQDetails.sql.clear;
        DM.FDQDetails.sql.add('Select * FROM SITE_DETAIL');
        DM.FDQDetails.sql.add('WHERE Image_tag = :pImage');

        DM.FDQDetails.Params.ParamByName('pImage').AsInteger := TagValue;

        DM.FDQDetails.Open;

        writetolog('Records found  number = ' + inttostr(DM.FDQDetails.RecordCount));

        BlobStream := dm.FDQDetails.CreateBlobStream(dm.FDQDetails.FieldByName('IMAGE_CONTENTS'), bmRead);
        MemoryStream := TMemoryStream.Create;
        MemoryStream.CopyFrom(BlobStream, 0);
        MemoryStream.Position := 0;

        ImageDisplay.Bitmap.LoadFromStream(MemoryStream);

        writetolog('Reading new DB table for Image with Tag = ' + Inttostr(TagValue));

    DM.FDConnection1.Connected := false;
  end;

end;

procedure TForm1.ImageDblClick(Sender: TObject);
var
  y: Integer;
  MemoInstance: TMemo;
  tagValue : integer;
  BlobStream: TStream;
  MemoryStream: TmemoryStream;
begin

  MemoShowNote.Lines.Clear;

  if Sender is TImage then
  begin
    ImageContainer.Bitmap.Assign((Sender as TImage).Bitmap);

  end;

  for y := FlowLayout2.ControlsCount - 1 downto 0 do
  begin
    // Check if the control is a TMemo
    if (FlowLayout2.Controls[y] is TMemo) then
    begin
      MemoInstance := TMemo(FlowLayout2.Controls[y]);

      // Match the Tag property of the TImage and TMemo instances
      if (TImage(Sender).Tag = MemoInstance.Tag) then
      begin
        MemoShowNote.lines.Assign(MemoInstance.Lines); // Correctly assign the instance content
        Break; // Exit the loop after finding the match
      end;
    end;
  end;
end;

procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
var
  ScaleFactor: Single;
  Img: TImage;
  Checkbox : TCheckBox;
  Memo : TMemo;
begin
  if Image.Width > 1024 then
  begin
    ScaleFactor := Image.Width / 1024;
    Image.Resize(Round(Image.Width / ScaleFactor), Round(Image.Height / ScaleFactor));
  end;
  FRawBitmap.Assign(Image);
  ImageContainer.Bitmap.Assign(Image);
  UpdateEffect;

           FlowLayout2.BeginUpdate;


            Img := TImage.Create(FlowLayout2);//LOImagesTaken
            Img.Parent := FlowLayout2; //LOImagesTaken// Assign parent to FlowLayout
            Img.Align := TAlignLayout.None; // Allow free placement
            Img.WrapMode := TImageWrapMode.Stretch; // Stretch the image to fit
            Img.Width := 120; // Set width (adjust as needed)
            Img.Height := 100; // Set height (adjust as needed)
            Img.HitTest := True;
            Img.name := 'Image_' + FormatDateTime('yyyyMMdd_HHmmsszzz', Now);
            Img.tag := random(10000);

            Img.OnDblClick :=  ImageDblClick;

             Checkbox := TCheckBox.Create(FlowLayout2);
             Checkbox.Parent := FlowLayout2;
             Checkbox.Align := TAlignLayout.Top;
             Checkbox.Text := 'Select'; // Set checkbox label
             Checkbox.Tag := Img.Tag;
              //
               Memo := TMemo.Create(FlowLayout2);//LOImagesTaken
               Memo.Parent := FlowLayout2; //LOImagesTaken// Assign parent to FlowLayout
               Memo.Align := TAlignLayout.None; // Allow free placement
               Memo.Width := 120; // Set width (adjust as needed)
               Memo.Height := 20; // Set height (adjust as needed)
               Memo.HitTest := True;
               Memo.name := 'Memo_' + FormatDateTime('yyyyMMdd_HHmmsszzz', Now);
               Memo.Tag := Img.Tag;
              //
            Img.Bitmap.Assign(ImageContainer.Bitmap);

            FlowLayout2.EndUpdate;

            CalculateFlowLayoutHeight(FlowLayout2);

            VertScrollbox1.RealignContent;


end;

procedure TForm1.CalculateFlowLayoutHeight(FLO: TFlowLayOut);
var
  MaxY, I: Integer;
  Child: TControl;
begin
  MaxY := 0;

  // Iterate through FlowLayout children and find the maximum Y + Height
  for I := 0 to FLO.ControlsCount - 1 do  //FlowLayout2
  begin
    Child := TControl(FLO.Controls[I]);
    if (Child.Position.Y + Child.Height) > MaxY then
      MaxY := Round(Child.Position.Y + Child.Height);
  end;

  // Update the FlowLayout height to fit its content
  FLO.Height := MaxY;

  // Force the VertScrollBox to update its scrollbar
  //VertScrollBox1.Realign;
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


procedure TForm1.BtnAddNewSiteClick(Sender: TObject);
begin
  TabConHostSelectSite.TabIndex := 1;

end;

procedure TForm1.BtnCancelClick(Sender: TObject);
begin

  EdNewLocation.Text := '';
  PnlPopup.visible := false;

end;

procedure TForm1.BtnConfirmClick(Sender: TObject);
var
  ImageStream: TMemoryStream;
  MemoStream : TMemoryStream;
  PKValue: integer;
  i, x : Integer;
  ImagetoRecord: TImage;
  MemotoRecord: TMemo;
  Image_Memo_StoreResult : TImage_Memo_Store; //Array
  Image_tag, Memo_tag: integer;
  Image_Name, Memo_Name: string;
  Site_Dept_Code : string;
begin

   Site_Dept_Code:= LblSiteCode.text + '_' + LblDeptCode.text;

  {$IFDEF ANDROID}
    if Imagecontainer.Bitmap.isempty then
    begin
      showmessage('Image Required - take picture');
      exit;
    end;
  {$ENDIF}

  //Prepare Database
   DM.FDQDetails.sql.clear;
   DM.FDQDetails.sql.add('DELETE FROM Site_Detail');
   DM.FDQDetails.sql.add('WHERE Site_Dept_Code = :pToDelete');
   DM.FDQDetails.Params.ParamByName('pToDelete').Asstring := Site_Dept_Code;
   DM.FDQDetails.ExecSQL;

   WriteToLog('Deletion done for ' + Site_Dept_Code);

  Image_Memo_StoreResult := WriteSelectedDetailsToRecord;

  WriteToLog('Back from WriteSelectedDetailsToRecord');


  ImagetoRecord := TImage.Create(self);

  ImagetoRecord.WrapMode := TImageWrapMode.Stretch; // Stretch the image to fit
  ImagetoRecord.Width := 120;
  ImagetoRecord.Height := 100;
  ImagetoRecord.HitTest := True;
  ImagetoRecord.name := 'Image_' + FormatDateTime('yyyyMMdd_HHmmsszzz', Now);
  ImagetoRecord.tag := random(10000);

  MemotoRecord := TMemo.Create(self);
  MemotoRecord.Width := 120;
  MemotoRecord.Height := 20;
  MemotoRecord.HitTest := True;
  MemotoRecord.name := 'Memo_' + FormatDateTime('yyyyMMdd_HHmmsszzz', Now);
  MemotoRecord.Tag := ImagetoRecord.Tag;

  for i := 0 to High(Image_Memo_StoreResult) do
  begin

       try

            WriteToLog('In array section elements = ' + inttostr(High(Image_Memo_StoreResult)));

            if Image_Memo_StoreResult[i].ImageTag <> 0 then
            begin
               Image_Tag := Image_Memo_StoreResult[i].ImageTag;
               Image_Name := Image_Memo_StoreResult[i].ImageName;

               WriteToLog('Image Name and tag done ' + inttostr(Image_Tag));
                   ImageStream := Image_Memo_StoreResult[i].ImageStream; // Use the existing stream

                WriteToLog('Assignment to ImageStream Done');

               if Assigned(ImageStream) and (ImageStream.Size > 0) then
               begin
                   ImageStream.Position := 0; // Reset stream position

                    WriteToLog('Image stream position set to 0');

                    ImageToRecord.Bitmap.LoadFromStream(ImageStream); // Load the bitmap

                    WriteToLog('Bit Map loaded');

               end
               else
               begin
                   WriteToLog('Stream is empty or nil for ImageTag: ' + IntToStr(Image_Memo_StoreResult[i].ImageTag));
                   ShowMessage('Stream is empty or nil for ImageTag: ' + IntToStr(Image_Memo_StoreResult[i].ImageTag));
               end; //Image

            end; //tag

             WriteToLog('Image done');


             WriteToLog('Tag of Memo = ' + inttostr(Image_Memo_StoreResult[i].MemoTag));

            if Image_Memo_StoreResult[i].MemoTag <> 0 then
            begin
               Memo_Tag := Image_Memo_StoreResult[i].MemoTag;
               Memo_Name := Image_Memo_StoreResult[i].MemoName;

               WriteToLog('Before Memo to Stream ' + Memo_Name);

               MemoStream := Image_Memo_StoreResult[i].MemoStream;

               if Assigned(MemoStream) and (MemoStream.Size > 0) then
               begin

                 WriteToLog('In load memo');

                 MemoStream.Position := 0; // Reset stream position

                 WriteToLog('Memo position set to 0');

                 MemotoRecord.Lines.LoadFromStream(MemoStream);

                 WriteToLog(MemotoRecord.lines.text);

               end;//Memo

            end;//tag

            DM.FDConnection1.Connected := true;

            WriteToLog('Ready for Database write');


            DM.FDQDetails.sql.clear;
            DM.FDQDetails.sql.add('INSERT into Site_Detail (Site_Dept_Code, Image_Name, Image_Tag, Memo_Name, Memo_Tag, Image_Contents, Memo_Contents)');
            DM.FDQDetails.sql.add('VALUES(:pSiteDeptCode, :pImageName, :pImageTag, :pMemoName, :pMemoTag, :pImageContents, :pMemoContents)');

            DM.FDQDetails.Params.ParamByName('pSiteDeptCode').AsString := Site_Dept_Code;


            DM.FDQDetails.Params.ParamByName('pImageName').AsString := Image_Name;
            DM.FDQDetails.Params.ParamByName('pImageTag').AsInteger := Image_Tag;

            DM.FDQDetails.Params.ParamByName('pMemoName').AsString := Memo_Name;
            DM.FDQDetails.Params.ParamByName('pMemoTag').AsInteger := Memo_tag;
            DM.FDQDetails.ParamByName('pImageContents').LoadFromStream(ImageStream, ftBlob);
            DM.FDQDetails.ParamByName('pMemoContents').LoadFromStream(MemoStream, ftBlob);

            //WriteToLog(DM.FDQDetails.sql.text);
            WriteToLog('Image Tag = ' + inttostr(Image_Tag));

            DM.FDQDetails.ExecSQL;

            WriteToLog('Database write done');

            DM.FDConnection1.Connected := false;

            //PKValue := UpdateListviewData('BtnConfirmClick');  //Returns Newly inserted PK Value

       finally
          ImageStream.Free;
          FRawBitmap.SetSize(0, 0);
          ImageContainer.Bitmap.SetSize(0, 0);
          ImageContainer.Bitmap.Assign(FRawBitmap);
       end;

  end;//Array of Images and Memos to write to database

    WriteToLog('All Done');
   // showmessage('Insert Done');

  for i := FlowLayOut2.ChildrenCount - 1 downto 0 do
  begin
    FlowLayOut2.Children[i].Free;
  end;

    //All Data written to Dept detail, now update the Report screen
    //No value returned from this function any more.
    PKValue := UpdateListviewData('BtnConfirmClick');  //Returns Newly inserted PK Value

  NextTabAction1.Execute;

end;


procedure TForm1.BtnCreateOrgRecClick(Sender: TObject);
var
  BlobStream: TStream;
  PKValue: integer;
  LastCodeID: string;
  NewCodeID: double;
  index_Item: integer;
  NewLat, NewLong: string;
  MemoryStream: TMemoryStream;
  FileName: string;
  SQLAction: string;
  Action: TCustomAction;
begin

     NewLat := '';
     NewLong := '';

     LbSite_Name.Text := '';
     LblSiteCode.text := '';
     LbLDeptCode.text := '';
     LblDeptName.text := '';


     try

        DM.FDConnection1.Connected := true;

        DM.FDQOrganisation.SQL.Clear;

        DM.FDQOrganisation.SQL.Add('SELECT * FROM ORGANAISATION');
        DM.FDQOrganisation.SQL.Add('WHERE SITE_CODE = :CheckSiteCode');

        DM.FDQOrganisation.Params.ParamByName('CheckSiteCode').AsString := LblSiteCode.text;

        //showmessage(DM.FDQOrganisation.sql.Text);

        DM.FDQOrganisation.Open;

        If (DM.FDQOrganisation.recordcount = 1) then
        begin
           SQLAction := 'Update';
           NewCodeID := strtofloat(LblSiteCode.text);

        end else
           SQLAction := 'Insert';



        writetolog('Action on SQL is ' + SQLAction);

        If SQLAction = 'Insert' then
        begin

            // showmessage('INSERT');

            DM.FDQOrganisation.SQL.Clear;

            DM.FDQOrganisation.SQL.Add('SELECT MAX(SITE_CODE) AS LastCodeID FROM ORGANAISATION');
            DM.FDQOrganisation.Open;

            LastCodeID := DM.FDQOrganisation.FieldByName('LastCodeID').AsString;

            if LastCodeID = '' then LastCodeID := '50000';

            NewCodeID := strtofloat(LastCodeID) + 1;

            //showmessage('New Value Created ' + floattostr(NewCodeID));


            DM.FDQOrganisation.sql.clear;

            DM.FDQOrganisation.sql.add('INSERT into ORGANAISATION (SITE_CODE, SITE_NAME, ADDRESS,' +
                                       'EMAIL, PHONE, CONTACT,PROJECT_REF, NOTE, ' +
                                       'LATITUDE, LONGITUDE, VOICENOTE)');
            DM.FDQOrganisation.sql.add('Values(:SiteCode, :SiteName, :SiteAddress, :SiteEmail,' +
                                       ':SitePhone, :SiteContact, :SiteProject, :SiteNote, ' +
                                       ':Latitude, :Longitude, :Voice)');
        end else//Update
        begin


            DM.FDQOrganisation.sql.clear;

            DM.FDQOrganisation.sql.add('UPDATE ORGANAISATION SET ' +
                                        'SITE_NAME = :SiteName, ' +
                                        'ADDRESS = :SiteAddress, ' +
                                        'EMAIL = :SiteEmail, ' +
                                        'PHONE = :SitePhone, ' +
                                        'CONTACT = :SiteContact, ' +
                                        'PROJECT_REF = :SiteProject, '+
                                        'NOTE = :SiteNote, ' +
                                        'LATITUDE = :Latitude, ' +
                                        'LONGITUDE = :Longitude, ' +
                                        'VOICENOTE = :Voice');
            DM.FDQOrganisation.sql.add('WHERE SITE_CODE = :SiteCode');

        end;//update

        writetolog('Before Execute = ' + DM.FDQOrganisation.sql.Text) ;

        DM.FDQOrganisation.Params.ParamByName('SiteCode').AsString := FloattoStr(NewCodeID);

        DM.FDQOrganisation.Params.ParamByName('SiteName').AsString := EdId.Text;
        DM.FDQOrganisation.Params.ParamByName('SiteAddress').AsString := EdAddress.Text;
        DM.FDQOrganisation.Params.ParamByName('SiteEmail').AsString := EdEmail.Text;

        DM.FDQOrganisation.Params.ParamByName('SiteContact').AsString := EdContact.Text;
        DM.FDQOrganisation.Params.ParamByName('SiteProject').AsString := EdProjectref.Text;

        BlobStream := TStringStream.Create(MemNote.Text, TEncoding.UTF8);
        DM.FDQOrganisation.ParamByName('SiteNote').LoadFromStream(BlobStream, ftBlob);

        MemoryStream := TMemoryStream.Create;

        If FileExists(TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp')) then
        begin
          FileName := TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp');


          MemoryStream.LoadFromFile(FileName);
          MemoryStream.Position := 0;
          DM.FDQOrganisation.Params.ParamByName('Voice').LoadFromStream(MemoryStream, ftBlob);
        end;


        if NewLat <> '' then
        begin
          NewLat := ListBoxItemLatitude.ItemData.Detail;
          NewLong := ListBoxItemLongitude.ItemData.Detail;

          DM.FDQOrganisation.Params.ParamByName('Latitude').AsFloat := StrtoFloat(NewLat);
          DM.FDQOrganisation.Params.ParamByName('Longitude').AsFloat := StrtoFloat(NewLong);
        end else
        begin
          DM.FDQOrganisation.Params.ParamByName('Latitude').AsFloat := 0.00;
          DM.FDQOrganisation.Params.ParamByName('Longitude').AsFloat := 0.00;
        end;


        DM.FDQOrganisation.ExecSQL;

        writetolog('INSERT DONE');

        DM.FDConnection1.Connected := false;

        writetolog('Before writing Audio file to DB');

        {$IFDEF ANDROID}
        WriteAudiotoDB(LblSiteCode.text); //; PKValue

        writetolog('After writing Audio file to DB');
        {$ENDIF}

        writetolog('Insert Done');

     finally
       BlobStream.Free;
       MemoryStream.Free;
     end;

      UpdateOrganisationData;

      NextTabAction1.Execute;

                TThread.CreateAnonymousThread(
           procedure
           begin

                 TThread.Synchronize(TThread.CurrentThread, procedure
                  begin

                      LblSiteCode.text := '';
                      LbSite_Name.Text := EdId.Text;
                      LblSiteCode.text := FloattoStr(NewCodeID);
                      writetolog('Site Name = ' + LbSite_Name.Text +
                                 'Site Code = ' + LblSiteCode.text);
                  end);

           end
          ).start;



      writetolog('All routines completed successfully');
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

procedure TForm1.WriteAudiotoDB(PK: String);//integer)
var
  MemoryStream: TMemoryStream;
  FileName: string;
begin

     try

        MemoryStream := TMemoryStream.Create;

        If Fileexists(TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp')) then
        begin

            writetolog('Audio File Found');

            FileName := TPath.Combine(TPath.GetDocumentsPath, 'recording.3gp');

            MemoryStream.LoadFromFile(FileName);

            MemoryStream.Position := 0;

            DM.FDConnection1.Connected := true;

    //        DM.FDQDetails.SQL.Clear;
    //        DM.FDQDetails.SQL.Add('UPDATE "NAMES" SET RECORDING = :Voice');
    //        DM.FDQDetails.SQL.Add('WHERE P_KEY = :PK');
    //        DM.FDQDetails.Params.ParamByName('PK').AsInteger := PK;
    //        DM.FDQDetails.Params.ParamByName('Voice').LoadFromStream(MemoryStream, ftBlob);

            //11-4/-25
            DM.FDQOrganisation.SQL.Clear;
            DM.FDQOrganisation.SQL.Add('UPDATE ORGANAISATION SET NOTE = :Voice');
            DM.FDQOrganisation.SQL.Add('WHERE SITE_CODE = :PK');
            DM.FDQOrganisation.Params.ParamByName('PK').AsString := PK;
            DM.FDQOrganisation.Params.ParamByName('Voice').LoadFromStream(MemoryStream, ftBlob);


            // Execute the query
            DM.FDQOrganisation.ExecSQL;

            DM.FDConnection1.Connected := false;

            //showmessage('Voice Insert Done');
        end else
        begin
          writetolog('No Audio File Found');
        end;

     finally
      MemoryStream.Free;
     end;


end;


procedure TForm1.BtnDeleteAllClick(Sender: TObject);
var
  RawBitMap : TBitMap;
begin

  DM.FDConnection1.Connected := true;

  DM.FDQDetails.sql.clear;
  DM.FDQDetails.sql.add('DELETE From ORGANAISATION');
  DM.FDQDetails.ExecSQL;

  DM.FDQDetails.sql.clear;
  DM.FDQDetails.sql.add('DELETE From SITE_LOCATION');
  DM.FDQDetails.ExecSQL;

  DM.FDQDetails.sql.clear;
  DM.FDQDetails.sql.add('DELETE From "NAMES"');
  DM.FDQDetails.ExecSQL;

  DM.FDQDetails.sql.clear;
  DM.FDQDetails.sql.add('DELETE From SITE_DETAIL');
  DM.FDQDetails.ExecSQL;


  if CBOrganisations.Items.Count > 0 then
  begin
    CBOrganisations.Items.Clear; // Removes all items from the ComboBox
  end;

  UpdateListviewData('BtnDeleteAllClick');


  RawBitMap := TBitMap.Create;
  RawBitMap.SetSize(0,0);
  ImageDisplay.Bitmap.SetSize(0, 0);
  ImageDisplay.Bitmap.Assign(RawBitMap);

  TDialogService.ShowMessage('All Records Deleted');

end;

procedure TForm1.BtnDeleteSelectedClick(Sender: TObject);
var
  DeletionList: TList<TCheckBox>;
  i, x, y: Integer;
  AssociatedImage: TImage;
  Checkbox: TCheckbox;
  AssociatedMemo: TMemo;
begin
  DeletionList := TList<TCheckBox>.Create; // Temporary list
  try
    // Collect selected checkboxes and images
    for i := 0 to FlowLayout2.ControlsCount - 1 do
    begin
      if (FlowLayout2.Controls[i] is TCheckBox) and
         (TCheckBox(FlowLayout2.Controls[i]).IsChecked) then
      begin
        DeletionList.Add(TCheckbox(FlowLayout2.Controls[i])); // Add checkbox to delete
      end;
    end;

    // Delete controls in the list
    for x := DeletionList.Count - 1 downto 0 do
    begin

        Checkbox := DeletionList[x]; // Free each control

        AssociatedImage := nil; // Initialize reference

          for y := FlowLayout2.ControlsCount - 1 downto 0 do
          begin
            if (FlowLayout2.Controls[y] is TImage) and
               (TImage(FlowLayout2.Controls[y]).Tag = Checkbox.Tag) then
            begin
              AssociatedImage := TImage(FlowLayout2.Controls[y]);
              Break;
            end;
          end;

         //
        AssociatedMemo := nil;

          for y := FlowLayout2.ControlsCount - 1 downto 0 do
          begin
            if (FlowLayout2.Controls[y] is TMemo) and
               (TMemo(FlowLayout2.Controls[y]).Tag = Checkbox.Tag) then
            begin
              AssociatedMemo := TMemo(FlowLayout2.Controls[y]); //11-4-25
              Break;
            end;
          end;

        //11-4-25
        if AssociatedMemo <> nil then
        begin
          AssociatedMemo.Free;
        end;

        if (AssociatedImage <> nil) then
        begin
          AssociatedImage.Free;
          Checkbox.Free;
        end;

    end;//Deletion List

  finally
    DeletionList.Free; // Free the temporary list
  end;

end;

procedure TForm1.UpdateUI;
begin

end;


procedure TForm1.VertScrollBox1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin

  Handled := true;

  VertScrollBox1.AniCalculations.ViewportPosition := PointF(
  VertScrollBox1.AniCalculations.ViewportPosition.X,
  VertScrollBox1.AniCalculations.ViewportPosition.Y //- 50 // Adjust scroll step as needed
  );

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

  dm.FDQDetails.sql.clear;
  dm.FDQDetails.sql.add('Select * FROM "NAMES"');
      dm.FDQDetails.sql.add(' WHERE SITECODE = ' + Trim(quotedstr('Larry')));
  dm.FDQDetails.Open;

  While not dm.FDQDetails.EOF do
  begin


             RawBitMap := TBitMap.Create;
             RawBitMap.SetSize(0,0);
             ImageContainer.Bitmap.SetSize(0, 0);
             ImageContainer.Bitmap.Assign(RawBitMap);

             BlobStream := dm.FDQDetails.CreateBlobStream(dm.FDQDetails.FieldByName('PHOTO'), bmRead);
             MemoryStream := TMemoryStream.Create;
             MemoryStream.CopyFrom(BlobStream, 0);

             MemoryStream.Position := 0;

             ImageContainer.Bitmap.LoadFromStream(MemoryStream);

      MemoryStream.Free;
      BlobStream.Free;
     sleep(1000);

   dm.FDQDetails.Next;

  end;


  dm.FDConnection1.Connected := false;

end;

procedure TForm1.BtnNoteDisplayClick(Sender: TObject);
begin
  Tabcontrol2.TabIndex := 1;
end;

procedure TForm1.BtnOKClick(Sender: TObject);
var
  ReftoDept: string;
begin

  If (EdNewLocation.text = '') or (EdNewLocation.text = 'Enter Dept...') then
  begin
    showmessage('Need to enter a dept, or cancel');
  end else
  begin
   // ShowMessage('You entered: ' + EdGetDept.Text);

        DM.FDConnection1.Connected := true;

        DM.FDQLocations.sql.clear;

        DM.FDQLocations.sql.add('insert into SITE_LOCATION (SITE_CODE, SITE_NAME, AREA_DEPT_CODE, AREA_DEPT_NAME)');
        DM.FDQLocations.sql.add('Values(:SiteCode, :SiteName, :DepartmentCode, :DepartmentName)');

        //lblDeptCode.text := inttostr(random(1000));
        //lblDeptCode.Text := Format('%05d', [Random(1000)]);
        ReftoDept := Format('%.5d', [Random(1000)]);
        lblDeptCode.Text := ReftoDept;

        DM.FDQLocations.Params.ParamByName('SiteCode').AsString := LblSiteCode.Text;
        DM.FDQLocations.Params.ParamByName('SiteName').AsString := LbSite_Name.Text;
        DM.FDQLocations.Params.ParamByName('DepartmentCode').AsString := ReftoDept;//lblDeptCode.text;
        DM.FDQLocations.ParamByName('DepartmentName').AsString := EdNewLocation.Text;

        DM.FDQLocations.ExecSQL;

        DM.FDConnection1.Connected := false;

        Writetolog('New Department necessary in SITE_LOCATION with SiteName and Site Code matching Orangisation');
        Writetolog('Department Code is randon created and Department Name from edit ' + EdNewLocation.Text);
        Writetolog('This will be the master to photos and memos - Need SiteCode and DepartmentCode in SITE_DETAIL');
        WritetoLog('Repeating values of SiteCode and Department with unique Image Tag and Name');
        //Refill Combobox
        UpdateLocationData;

        LblDeptName.text := EdNewLocation.Text;//23-4-25
        EdNewLocation.Text := '';

        PnlPopup.visible := false;
  end;

end;

procedure TForm1.BtnPayVoiceDBClick(Sender: TObject);
begin

  PlayNote(RecordingRef);    //Need this vali=ue from the ListView to get the PK value

end;

procedure TForm1.PlayNote(PK_Record:String);
var
  MemoryStream: TMemorystream;
  TempFileName: string;
  BlobStream: TStream;
  PK: Integer;
begin


  MemoryStream := TMemoryStream.Create;

  try
    // Retrieve the BLOB from the database
//    DM.FDQDetails.SQL.Clear;
//    DM.FDQDetails.SQL.Add('SELECT RECORDING, P_KEY FROM "NAMES" WHERE P_KEY = :PK');
//    DM.FDQDetails.Params.ParamByName('PK').AsInteger := PK_Record;
//    DM.FDQDetails.Open;

    DM.FDQOrganisation.SQL.Clear;
    DM.FDQOrganisation.SQL.Add('SELECT NOTE, SITE_CODE FROM ORGANAISATION WHERE SITE_CODE = :PK');
    DM.FDQOrganisation.Params.ParamByName('PK').AsString := PK_Record;
    DM.FDQOrganisation.Open;


    if not DM.FDQOrganisation.FieldByName('NOTE').IsNull then
    begin


      BlobStream := DM.FDQOrganisation.CreateBlobStream(DM.FDQOrganisation.FieldByName('NOTE'), bmRead);


      TBlobField(DM.FDQOrganisation.FieldByName('RECORDING')).SaveToStream(MemoryStream);
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

procedure TForm1.BtnReadLogClick(Sender: TObject);
begin
  ReadLogFile;
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

procedure TForm1.Button7Click(Sender: TObject);
begin



      DM.FDQLocations.SQL.Clear;
      DM.FDQLocations.SQL.Add('SELECT * FROM SITE_DETAIL');
      DM.FDQLocations.Open;

        while not DM.FDQLocations.EOF do
        begin

          Showmessage(DM.FDQLocations.FieldByName('SITE_DEPT_CODE').AsString
              + ' ' + Inttostr(DM.FDQLocations.FieldByName('IMAGE_TAG').AsInteger));

          DM.FDQLocations.Next;
        end;





end;

procedure TForm1.BtnDatabaseClick(Sender: TObject);
begin

  DM.FDConnection1.Connected := true;

  DM.FDQOrganisation.SQL.Clear;
  DM.FDQOrganisation.SQL.Add('SELECT * FROM ORGANAISATION');
  DM.FDQOrganisation.Open;

  DM.PopulateStringGrid(SGOrg, DM.FDQOrganisation);

  DM.FDQLocations.SQL.Clear;
  DM.FDQLocations.SQL.Add('SELECT * FROM SITE_LOCATION');
  DM.FDQLocations.open;

  DM.PopulateStringGrid(SGLoc, DM.FDQLocations);

  DM.FDQDetails.SQL.Clear;

  DM.FDQDetails.SQL.Add('SELECT * FROM SITE_DETAIL');
  DM.FDQDetails.open;

  DM.PopulateStringGrid(SGDetail, DM.FDQDetails);
  //535
end;


procedure TForm1.BtnSelectSiteClick(Sender: TObject);
begin
  TabConHostSelectSite.TabIndex := 0;

  if Assigned(CBOrganisations) and (CBOrganisations.ItemIndex >= 0) and
                       (CBOrganisations.ItemIndex < CBOrganisations.Items.Count) then
  CBOrganisations.ItemIndex := 1;

end;

procedure TForm1.BtnShowAddDeptClick(Sender: TObject);
begin
    EdNewLocation.text:= 'Enter Dept...';
    PnlPopup.visible := true;
end;

procedure TForm1.BtnShowClick(Sender: TObject);
begin
  if TabConHostSelectSite.TabIndex = 0 then
     TabConHostSelectSite.TabIndex := 1
  else
     TabConHostSelectSite.TabIndex := 0
end;

Procedure TForm1.UpdateOrganisationData;
begin

   try

      DM.FDConnection1.Connected := true;


      DM.FDQOrganisation.SQL.Clear;
      DM.FDQOrganisation.SQL.Add('SELECT SITE_CODE FROM ORGANAISATION');
      DM.FDQOrganisation.Open;


      if Assigned(CBOrganisations) then
      begin
        CBOrganisations.Items.Clear;

      //ShowMessage('Organisation DB ' + inttostr(DM.FDQOrganisation.RecordCount));

        while not DM.FDQOrganisation.EOF do
        begin

          CBOrganisations.Items.Add(DM.FDQOrganisation.FieldByName('SITE_CODE').AsString);

          DM.FDQOrganisation.Next;
        end;

        writetolog('CBOrganisations updated');

        //11-4-25
        If (CBOrganisations.Items.Count >0) then
                                    CBOrganisations.ItemIndex := 0;

        writetolog('CBOrganisations idex set to 0');

      end;
      //else
      //  ShowMessage('Error: CBOrganisations is not assigned.');
    except
      on E: Exception do
        ShowMessage('An error occurred: ' + E.Message);
    end;

end;

Procedure TForm1.UpdateLocationData;
var
  LocationValueValid : boolean;
begin

    try

      DM.FDConnection1.Connected := true;

      DM.FDQLocations.SQL.Clear;
      DM.FDQLocations.SQL.Add('SELECT SITE_CODE, SITE_NAME, AREA_DEPT_NAME FROM SITE_LOCATION ');
      DM.FDQLocations.SQL.Add('WHERE SITE_CODE = :SiteCode');

      DM.FDQLocations.Params.ParamByName('SiteCode').AsString := LblSiteCode.text;

      writetolog('Update Memo with depts on next screen ' + DM.FDQLocations.SQL.Text);

      DM.FDQLocations.Open;

        MemoDepartments.Lines.Clear;
        MemoDepartments.Lines.Add('Departmemts Created List');
        MemoDepartments.Lines.Add('');

        while not DM.FDQLocations.EOF do
        begin


          MemoDepartments.Lines.Add(DM.FDQLocations.FieldByName('SITE_NAME').AsString + ' ' +
                                    DM.FDQLocations.FieldByName('AREA_DEPT_NAME').AsString);


          DM.FDQLocations.Next;
        end;

         writetolog('Memo update done');

    except
      on E: Exception do
        ShowMessage('An error occurred: ' + E.Message);
    end;

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
  SiteRef, DeptRef : string;
begin

  ListItem := TListViewItem(ListView1.Items[ListView1.Itemindex]);
  Name := ListItem.Text;

  SiteRef := Copy(Name,1,5);
  DeptRef := ListItem.Detail;

 // showmessage('Site Ref ' + SiteRef);
 // showmessage('DeptRef ' + DeptRef);


     try

       BlobStream := TStringStream.Create(MemoNote.Text, TEncoding.UTF8);


        DM.FDConnection1.Connected := true;

        DM.FDQDetails.SQL.Clear;
        DM.FDQDetails.SQL.Add('UPDATE "NAMES" SET MEMO_NOTE = :Note');
        DM.FDQDetails.SQL.Add(' WHERE SITECODE = :Site');
        DM.FDQDetails.SQL.Add(' AND DEPARTMENT = :Dept');

        DM.FDQDetails.Params.ParamByName('Site').AsString := SiteRef;
        DM.FDQDetails.Params.ParamByName('Dept').AsString := DeptRef;
        DM.FDQDetails.Params.ParamByName('Note').LoadFromStream(BlobStream, ftBlob);

        DM.FDQDetails.ExecSQL;

        DM.FDConnection1.Connected := false;

     finally
      BlobStream.Free;
     end;

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
  RefCode: string;
  ListItem: TListViewItem;
begin

  writetolog('Call ListView1Change');

  ListItem := TListViewItem(ListView1.Items[ListView1.Itemindex]);

  Name := Copy(ListItem.Text, 1, 5);
  RefCode := Copy(ListItem.Detail, 1, 5);

  RefCode := Name + '_' + RefCode;

  //showmessage(RefCode);

  {$IFDEF ANDROID}
    BtnPayVoiceDB.Enabled := true;
    SelectedNameView(RefCode);  //Name
  {$ENDIF}

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
  SiteRef : string;
  DeptRef : string;
begin


  //showmessage('Ref to Memo used in Names DB = ' + Name);

  SiteRef := Copy(Name,1,5);
  DeptRef := Copy(Name,6, Length(Name)-5);
  //showmessage('Site Ref ' + SiteRef);
  //showmessage('DeptRef ' + DeptRef);

  DM.FDConnection1.Connected := true;

//  DM.FDQDetails.sql.clear;
//  DM.FDQDetails.sql.add('Select * FROM "NAMES"');
//  DM.FDQDetails.sql.add(' WHERE "SITECODE" = ' +
//                            Trim(QuotedStr(Name)));
//  DM.FDQDetails.Open;


  //Need Ite and Departent to ensure correct record
  DM.FDQDetails.sql.clear;
  DM.FDQDetails.sql.add('Select * FROM "NAMES"');
  DM.FDQDetails.sql.add(' WHERE SITECODE = ' +
                            Trim(QuotedStr(SiteRef)));
  DM.FDQDetails.sql.add(' AND DEPARTMENT = ' +
                            Trim(QuotedStr(DeptRef)));
  DM.FDQDetails.Open;

  Try
    BlobStream := DM.FDQDetails.CreateBlobStream(DM.FDQDetails.FieldByName('MEMO_NOTE'), bmRead);

    StringList:= TStringList.create;

    StringList.LoadFromStream(BlobStream);

    MemoNote.lines.Clear;

    MemoNote.Lines.Assign(StringList);

  Finally
    StringList.free;
    BlobStream.Free;
  End;

  //Reference to Recording 23-3-24
  RecordingRef := inttostr(DM.FDQDetails.FieldByName('P_KEY').AsInteger);

  DM.FDConnection1.Connected := false;

end;


procedure TForm1.SelectedNameView(DeptRef: string);
var
  BlobStream: TStream;
  MemoryStream: TmemoryStream;
  BitMap : TBitMap;
  i: integer;
  RefToImage: integer;
begin

  DM.FDConnection1.Connected := true;

  for i := FLOThumbNails.ChildrenCount - 1 downto 0 do
  begin
    FLOThumbNails.Children[i].Free;
  end;

  DM.FDQDetails.sql.clear;
  DM.FDQDetails.sql.add('Select * FROM SITE_DETAIL');
  DM.FDQDetails.sql.add(' WHERE SITE_DEPT_CODE = ' +
                            Trim(QuotedStr(DeptRef)));
  DM.FDQDetails.Open;

  //showmessage('Records Found for ' + Name + ' ' + inttostr(DM.FDQDetails.RecordCount));

  While Not DM.FDQDetails.EOF Do
  Begin

      BlobStream := DM.FDQDetails.CreateBlobStream(DM.FDQDetails.FieldByName('IMAGE_CONTENTS'), bmRead);

      MemoryStream := TMemoryStream.Create;
      MemoryStream.CopyFrom(BlobStream, 0);
      MemoryStream.Position := 0;

      BitMap := TBitMap.create;
      Bitmap.LoadFromStream(MemoryStream);

      RefToImage := DM.FDQDetails.fieldbyName('Image_Tag').asInteger;
      writetolog('RefToImage = ' + Inttostr(RefToImage));

      //Create Thumb Nails for each record
      CreateReviewThumbNails(InttoStr(RefToImage), Bitmap);

      MemoryStream.Free;
      BlobStream.Free;
      BitMap.free;

      //Reference to Recording 23-3-24 - 11-4-25 recast to string;
      RecordingRef := InttoStr(DM.FDQDetails.FieldByName('P_KEY').AsInteger);

    DM.FDQDetails.Next;

  End;

  DM.FDConnection1.Connected := false;

end;

procedure TForm1.CBOrganisationsChange(Sender: TObject);
var
  BlobStream: TStream;
  StringList: TStringList;
begin

    TTask.Run(procedure
        begin

           try

               TThread.Synchronize(nil, procedure
                     var
                       ItemChosen : string;
                       LocationValueValid : Boolean;
                     begin
                       ItemChosen := '';
                       LocationValueValid := false;

                       if Assigned(CBOrganisations) and (CBOrganisations.ItemIndex >= 0) and
                       (CBOrganisations.ItemIndex < CBOrganisations.Items.Count) then
                       begin
                         if CBOrganisations.Items[CBOrganisations.ItemIndex] <> '' then
                         begin

                          ItemChosen := CBOrganisations.Items[CBOrganisations.ItemIndex];


                          LocationValueValid:= true;

                          DM.FDConnection1.Connected := true;

                          DM.FDQOrganisation.sql.clear;
                          DM.FDQOrganisation.sql.add('Select * FROM ORGANAISATION');
                          DM.FDQOrganisation.sql.add(' WHERE SITE_CODE = ' + quotedstr(ItemChosen));
                          DM.FDQOrganisation.Open;



                          //Organisation selector
                          lblAddress.Text := DM.FDQOrganisation.fieldbyName('ADDRESS').asstring;//ok
                          lblEmail.Text := DM.FDQOrganisation.fieldbyName('EMAIL').asstring; //ok
                          lblProjectRef.Text := DM.FDQOrganisation.fieldbyName('PROJECT_REF').asstring;//ok
                          LblSite_Name.text := DM.FDQOrganisation.fieldbyName('SITE_NAME').asstring;//ok
                          LBLContact.text :=  DM.FDQOrganisation.fieldbyName('CONTACT').asstring;//New
                          LBLLat.text := DM.FDQOrganisation.fieldbyName('LATITUDE').asstring;//New
                          LBLLong.text := DM.FDQOrganisation.fieldbyName('LONGITUDE').asstring;//New


                              try
                                  BlobStream := DM.FDQOrganisation.CreateBlobStream(
                                                       DM.FDQOrganisation.FieldByName('NOTE'), bmRead);//ok

                                  StringList:= TStringList.create;
                                  StringList.LoadFromStream(BlobStream);

                                  MemProjectDescription.lines.Clear;
                                  MemProjectDescription.Lines.Assign(StringList);

                              finally
                                 StringList.Free;
                                 BlobStream.Free;
                              end;

                             //Second Tab
                             LblSiteCode.text := DM.FDQOrganisation.fieldbyName('SITE_CODE').asstring;
                             LbSite_Name.Text := DM.FDQOrganisation.fieldbyName('SITE_NAME').asstring;

                             WriteToLog('CBOrganisationsChange - Selected Site from Oraganisation Table = ' + ItemChosen);
                             //LblSiteCode.text + ' ' + LbSite_Name.Text);

                             //18-4-24 UpdateLocationData;//Fill Memo with all Departments created
                                                //Next Tab
                             //testing values
                             //LBLLat.text := '51.316965';
                             //LBLLong.text := '-2.534651';

                               {$IFDEF ANDROID}
                                DoMapDispay(LBLLat.text, LBLLong.text);
                                WriteToLog('Back from DoMapDisplay');
                               {$ENDIF}


                             DM.FDConnection1.Connected := false;


                         end
                         else
                         begin
                           ShowMessage('Item is empty.');
                           LocationValueValid:= false;
                         end;
                       end ;


                     end);
           except
              on E: Exception do TThread.Queue(nil, procedure
                                               begin
                                                  ShowMessage('Error: ' + E.Message);
                                               end);
           end;//try

        end);//task


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
  LbSite_Name.Text := '';
  LblSiteCode.text := '';
  LbLDeptCode.text := '';
  LblDeptName.text := '';

end;

Function TForm1.UpdateListviewData(CallingProcedure: string): Integer;
var
 ListItem: TListViewItem;
 ReftoImage: string;
 BlobStream: TStream;
 MemoryStream: TmemoryStream;
 BitMap: TBitMap;
 i: integer;
begin

  writetolog('Call From ' + CallingProcedure + 'UpdateListviewData Start 1');

  DM.FDConnection1.Connected := true;

  //Get Dept from Master Sites
  DM.FDQLocations.sql.clear;
  DM.FDQLocations.sql.add('Select * FROM SITE_LOCATION');
  DM.FDQLocations.Open;

  writetolog('');
  writetolog('Site Locations found = ' + inttostr(DM.FDQLocations.RecordCount));

  ListView1.items.Clear;

  While not dm.FDQLocations.EOF do
  begin

    with TListViewItem(ListView1.Items.Add) do
    begin
      Text := DM.FDQLocations.fieldbyname('SITE_CODE').asstring + ' ' +
              DM.FDQLocations.fieldbyname('SITE_NAME').asString;
      Detail := DM.FDQLocations.fieldbyname('AREA_DEPT_CODE').asString + ' ' +
       DM.FDQLocations.fieldbyname('AREA_DEPT_NAME').asString;
    end;

    RefToImage := DM.FDQLocations.fieldbyname('SITE_CODE').asstring
                  + '_' +
                  DM.FDQLocations.fieldbyname('AREA_DEPT_CODE').asString;

    writetolog('UpdateListviewData 2');

    DM.FDQLocations.Next;//Location
  end;


//  result := DM.FDQDetails.fieldbyname('P_KEY').asInteger;


end;


procedure TForm1.FormShow(Sender: TObject);
begin
    Form1.StyleBook := DM.StyleBook2;

    writetolog('In Form Show calling UpdateOrganisationData');
    UpdateOrganisationData;

    //showmessage('Back from Update');
    ComponentDefaultFont(Form1, 12);  //12

    PnlPopup.Visible := false;
    LblDeptCode.text := '';

  FlowLayout2 := TFlowLayout.Create(VertScrollBox1); // Create FlowLayout dynamically
  FlowLayout2.Parent := VertScrollBox1;              // Assign parent to the scroll box
  //FlowLayout.Align := TAlignLayout.Top;            // Align FlowLayout within the scroll box


end;

procedure TForm1.PlnNotesResize(Sender: TObject);
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
     If PlnNotes.width >300 then PlnNotes.width := 300;
     If PlnNotes.width <200 then PlnNotes.width := 200;

     If PnlImage_Memo.height >170 then PnlImage_Memo.height := 170;
     If PnlImage_Memo.height <170  then PnlImage_Memo.height := 170;

     FlowLayout2.Height := 900;
     Vertscrollbox1.Height := 899;
    end
    else
    begin
     //showmessage('Landscape Orientation')
     If PlnNotes.width >500 then PlnNotes.width := 500;
     If PlnNotes.width <200 then PlnNotes.width := 200;

     If PnlImage_Memo.height >45 then PnlImage_Memo.height := 45;
     If PnlImage_Memo.height <45 then PnlImage_Memo.height := 45;

     FlowLayout2.Height := 450;
     Vertscrollbox1.Height := 449;
    end;


  end;

end;

procedure TForm1.PreviousTabAction1Update(Sender: TObject);
begin

  //BtnPayVoiceDB.Enabled := false;
  //LblStatus.Text := '';
end;

end.

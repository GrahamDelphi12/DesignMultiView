unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.MultiView, FMX.Controls.Presentation,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit, FMX.DateTimeCtrls,
  FMX.MediaLibrary, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Permissions,FMX.DialogService, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  System.ImageList, FMX.ImgList, FMX.Objects, FMX.Filter, Data.DB,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Platform;

type
 TArrayProcessor<T> = procedure(const value: T) of object;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Button1: TButton;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    Button2: TButton;
    Button3: TButton;
    ListBoxItem2: TListBoxItem;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    BtnScaleUp: TButton;
    BtnScaleDown: TButton;
    BtnIterate: TButton;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ImageContainer: TImage;
    ShowShareSheetAction1: TShowShareSheetAction;
    ClearImageAction1: TAction;
    BtnDeleteAll: TButton;
    BtnAnonSync: TButton;
    Panel4: TPanel;
    ListView1: TListView;
    ImageDisplay: TImage;
    TabItem3: TTabItem;
    Memo1: TMemo;
    BtnEmptyEdits: TButton;
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
    BtnConfirm: TButton;
    FlowLayout2: TFlowLayout;
    Button4: TButton;
    DateEdit2: TDateEdit;
    Edit3: TEdit;
    DateEdit3: TDateEdit;
    Panel6: TPanel;
    BtnSynch: TButton;
    BtnTakePhoto: TButton;
    Label1: TLabel;
    procedure ListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreviousTabAction1Update(Sender: TObject);
    procedure NextTabAction1Update(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnScaleUpClick(Sender: TObject);
    procedure BtnScaleDownClick(Sender: TObject);
    procedure BtnIterateClick(Sender: TObject);
    procedure BtnTakePhotoClick(Sender: TObject);

    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure ClearImageAction1Execute(Sender: TObject);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure BtnDeleteAllClick(Sender: TObject);
    procedure BtnSynchClick(Sender: TObject);
    procedure BtnAnonSyncClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject);
    procedure BtnEmptyEditsClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
  private const
    StoragePermission = 'android.permission.WRITE_EXTERNAL_STORAGE';
  private
    { Private declarations }
    FRawBitmap: TBitmap;
    FEffect: TFilter;
    procedure processArray<T>(const Arr: array of T;
                             Processor: TArrayProcessor<T>);
    procedure iteratecontrols(AParent: TFMXObject);
    procedure ScaleComponents(AParent: TFMXObject; ScaleFactor: real);
    procedure ResetComponents(AParent: TFMXObject; scalefactor: real);
    procedure ListAllStyleElements(Control: TStyledControl);
    procedure ListStyleResources(Control : TStyledControl);


    procedure DisplayRationale(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const APostRationaleProc: TProc);

    procedure TakePicturePermissionRequestResult(Sender: TObject;
              const APermissions: TClassicStringDynArray;
              const AGrantResults: TClassicPermissionStatusDynArray);
    procedure UpdateEffect;
    procedure UpdateUI;
    procedure SelectedNameView(Name: string);
    procedure UpdateData;
    procedure Empty_Controls(AParent: TFMXObject);

  public
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;
  ScaleState: single;

implementation

{$R *.fmx}

uses UnDM;

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

procedure TForm1.UpdateEffect;
begin
  if Assigned(FEffect) then
  begin
    FEffect.ValuesAsBitmap['Input'] := FRawBitmap;
    ImageContainer.Bitmap := FEffect.ValuesAsBitmap['Output'];
  end;
end;


procedure TForm1.ResetComponents(AParent: TFMXObject; scalefactor: real);
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

//            showmessage('Width ' + Floattostr(TButton(Child).Width ) +
//                       'Height ' + Floattostr(TButton(Child).Height ));

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

//          If TControl(child) is TListView then
//          begin
//
//            TListView(Child).Width := TListView(Child).Width/scalefactor;
//            TListView(Child).Height := TListView(Child).Height/scalefactor;
//
//
//            for x := 0 to TListView(Child).Items.Count-1 do begin
//
//             Item := TListView(Child).ItemIndex[x];
//           //  TListView(Child).Items .StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
//
//             Item.Font.Size := Item.Font.Size/scalefactor;
//             Item.Height := Item.height/scalefactor;
//
//            end;

          //end;




          If TControl(child) is TEdit then
          begin

              TEdit(Child).Width := TEdit(Child).Width/scalefactor;
              TEdit(Child).Height := TEdit(Child).Height/scalefactor;


              TEdit(Child).StyledSettings := TEdit(Child).StyledSettings - [TStyledSetting.Size];

              TEdit(Child).TextSettings.Font.size := TEdit(Child).TextSettings.Font.size/scalefactor;

          end;


          If TControl(child) is TDateEdit then
          begin

            TDateEdit(Child).Width := TDateEdit(Child).Width / ScaleFactor;
            TDateEdit(Child).Height := TDateEdit(Child).Height / ScaleFactor;

            TDateEdit(Child).StyledSettings := TDateEdit(Child).StyledSettings - [TStyledSetting.Size];

            TDateEdit(Child).TextSettings.Font.Size := TDateEdit(Child).TextSettings.Font.Size / ScaleFactor;

            StyleObj := TDateEdit(Child).FindStyleResource('arrow');// as TControl;

          end;



          if (Child.ChildrenCount >0) then
          begin
            // showmessage(Child.StyleName + ' Recursion');

             ResetComponents(Child, ScaleFactor);

          end;



  end;//i


end;



procedure TForm1.ScaleComponents(AParent: TFMXObject; ScaleFactor: real); //double
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
              TEdit(Child).TextSettings.Font.size := TEdit(Child).TextSettings.Font.size * ScaleFactor;

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

            TDateEdit(Child).StyledSettings := TDateEdit(Child).StyledSettings - [TStyledSetting.Size];//,
                                                                                                                  // Tstyledsetting.Style];
            //[TStyledSetting.Size];
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

            TComboBox(Child).Width := TListBox(Child).Width * ScaleFactor;
            TComboBox(Child).Height := TListBox(Child).height * ScaleFactor;

            for x := 0 to TListBox(Child).Count-1 do begin
             Item := TListBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
             Item.Font.Size := Item.Font.Size * ScaleFactor;
             Item.Height := Item.Height * ScaleFactor;
            end;

          end;

            if (Child.ChildrenCount >0) then;//and (TControl(child) is TDateEdit <> true) then
            begin
             //  showmessage(Child.name + ' Recursion');
               ScaleComponents(Child, ScaleFactor);

            end;


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


          While not dm.FDQuery1.EOF do
          begin

            BlobStream := dm.FDQuery1.CreateBlobStream(dm.FDQuery1.FieldByName('PHOTO'), bmRead);
            MemoryStream := TMemoryStream.Create;
            MemoryStream.CopyFrom(BlobStream, 0);
            MemoryStream.Position := 0;

            ImageContainer.Bitmap.LoadFromStream(MemoryStream);

            label1.text := (dm.FDQuery1.FieldByName('FIRST').asstring);

            TThread.Sleep(2000);


            dm.FDQuery1.Next;

            MemoryStream.Free;
            BlobStream.Free;

          end;
        end

   ).Start;

end;

procedure TForm1.BtnConfirmClick(Sender: TObject);
var
  MemoryStream: TMemoryStream;
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

        MemoryStream := TMemoryStream.Create;

        ImageContainer.Bitmap.SaveToStream(MemoryStream);
        MemoryStream.Position := 0;

        DM.FDConnection1.Connected := true;

        DM.FDQuery1.sql.clear;
        DM.FDQuery1.sql.add('insert into "NAMES" (P_KEY,FIRST,LAST, PHOTO)');
        DM.FDQuery1.sql.add('Values(:PK, :First, :Last, :image)');


        DM.FDQuery1.Params.ParamByName('PK').AsInteger := 3;
        DM.FDQuery1.Params.ParamByName('First').AsString := Name.Text;
        //DM.FDQuery1.Params.ParamByName('Last').AsString := Edit2.Text;
        DM.FDQuery1.Params.ParamByName('Last').AsString := ComboBox1.Items[ComboBox1.ItemIndex];
        DM.FDQuery1.ParamByName('image').LoadFromStream(MemoryStream, ftBlob);


        DM.FDQuery1.ExecSQL;

        DM.FDConnection1.Connected := false;

        showmessage('Insert Done');

        UpdateData;


        Name.text := '';
        Edit2.text := '';

         FRawBitmap.SetSize(0, 0);
         ImageContainer.Bitmap.SetSize(0, 0);
         ImageContainer.Bitmap.Assign(FRawBitmap);

     finally
      MemoryStream.Free;
     end;

  end;

end;


procedure TForm1.BtnDeleteAllClick(Sender: TObject);
begin
  dm.FDConnection1.Connected := true;

  dm.FDQuery1.sql.clear;
  dm.FDQuery1.sql.add('DELETE From "NAMES"');

  dm.FDQuery1.ExecSQL;
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
      dm.FDQuery1.sql.add(' WHERE FIRST = ' + Trim(quotedstr('Larry')));
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

       //application.ProcessMessages;
      MemoryStream.Free;
      BlobStream.Free;
     sleep(1000);

   dm.FDQuery1.Next;

  end;


  dm.FDConnection1.Connected := false;

end;

procedure TForm1.BtnScaleDownClick(Sender: TObject);
begin

  If ScaleState <> 1 then
  begin
    ResetComponents(self, 1.25);
    ScaleState := ScaleState - 1;
  end else
  begin
    Showmessage('Minimum Reached');
   exit;
  end;


end;

procedure TForm1.BtnScaleUpClick(Sender: TObject);
begin


  If ScaleState <> 3 then
  begin
   ScaleComponents(self, 1.25);
   ScaleState := ScaleState + 1;
  end else
  begin
    Showmessage('Maximum Reached');
   exit;
  end;

end;

procedure TForm1.BtnSynchClick(Sender: TObject);
var
  BlobStream: TStream;
  FileStream: TFileStream;
  MemoryStream: TmemoryStream;
  RawBitMap: TBitMap;
begin

    label1.text := 'Apple';

    TThread.ForceQueue(nil,
      procedure
      begin
      label1.text := 'orange';
      end,
      6000
    );

    TThread.ForceQueue(nil,
      procedure
      begin
      label1.text := 'Apple';
      end,
      7000
     );

    TThread.ForceQueue(nil,
     procedure
     begin
      label1.text := 'done';
    end,
     8000
   );

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

  SelectedNameView(Name);
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
  DM.FDQuery1.sql.add(' WHERE "FIRST" = ' +
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
     Form1.StyleBook := DM.StyleBook1;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  listbox1.itemIndex := tabcontrol1.TabIndex;

  ScaleState := 1;

  ImageContainer.Bitmap.Assign(FRawBitMap);



end;

procedure TForm1.UpdateData;
begin

  DM.FDConnection1.Connected := true;

  DM.FDQuery1.sql.clear;
  DM.FDQuery1.sql.add('Select * FROM "NAMES"');
  DM.FDQuery1.Open;

  ListView1.Data.Empty;

  While not dm.FDQuery1.EOF do
  begin

    with TListViewItem(ListView1.Items.Add) do
    begin
      Text := DM.FDQuery1.fieldbyname('FIRST').asstring;// [1000 + Random(1234567)]);
      Detail := Format('%d kg of paper', [1000 + Random(1234)]);
    end;

    DM.FDQuery1.Next;
  end;

end;


procedure TForm1.FormShow(Sender: TObject);
begin
    Form1.StyleBook := DM.StyleBook5;

    UpdateData

end;

procedure TForm1.ListBox1Change(Sender: TObject);
begin
  tabcontrol1.TabIndex := listbox1.itemIndex;
end;

procedure TForm1.NextTabAction1Update(Sender: TObject);
begin
  listbox1.itemIndex := tabcontrol1.TabIndex;
end;

procedure TForm1.Panel1Resize(Sender: TObject);
var
  ScreenService: IFMXScreenService;
begin

  If TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService))
  then
  begin

    if screenService.GetScreenOrientation in [TscreenOrientation.Portrait,
                                              TscreenOrientation.InvertedPortrait] then
    begin
    //showmessage('Portrait Orientation')
     If Panel1.width <300 then Panel1.width := 300;
     If Panel1.width >500 then Panel1.width := 500
    end
    else
    begin
     //showmessage('Landscape Orientation')
     If Panel1.width <300 then Panel1.width := 300;
     If Panel1.width >800 then Panel1.width := 800;
    end;


  end;


end;

procedure TForm1.PreviousTabAction1Update(Sender: TObject);
begin
  listbox1.itemIndex := tabcontrol1.TabIndex;
end;

end.

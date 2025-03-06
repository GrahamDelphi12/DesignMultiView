unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.MultiView, FMX.Controls.Presentation,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit, FMX.DateTimeCtrls;

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
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button4: TButton;
    Panel1: TPanel;
    Edit3: TEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    Button6: TButton;
    Button5: TButton;
    Panel2: TPanel;
    DateEdit1: TDateEdit;
    ComboBox2: TComboBox;
    BtnConfirm: TButton;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Edit2: TEdit;
    Name: TEdit;
    Label3: TLabel;
    BtnScaleUp: TButton;
    BtnScaleDown: TButton;
    procedure ListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreviousTabAction1Update(Sender: TObject);
    procedure NextTabAction1Update(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnScaleUpClick(Sender: TObject);
    procedure BtnScaleDownClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    procedure processArray<T>(const Arr: array of T;
                             Processor: TArrayProcessor<T>);
    procedure iteratecontrols(AParent: TFMXObject);
    procedure ScaleComponents(AParent: TFMXObject; ScaleFactor: double);
    procedure ResetComponents(AParent: TFMXObject; scalefactor: double);
    procedure ListAllStyleElements(Control: TStyledControl);
    procedure ListStyleResources(Control : TStyledControl);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ScaleState: single;

implementation

{$R *.fmx}

uses UnDM;


procedure TForm1.ResetComponents(AParent: TFMXObject; scalefactor: double);
var
 I, x: Integer;
 Child: TFMXObject;
 Item : TListBoxItem;
 DropDownButton: Tcontrol;
 StyleObj: TFMXObject;
  //StyleObj: Tcontrol;
begin



  for I := 0 to AParent.childrenCount - 1 do
  begin
     Child := AParent.Children[I];

//     if (Child is TEdit) or
//      (Child is TDateEdit) or
//      (Child is TButton) or
//      (Child is TLabel)  or
//      (Child is TComboBox)  or
//      (Child is TListbox) then
//      begin




          If TControl(child) is TButton then
          begin

            TButton(Child).Width := TButton(Child).Width /ScaleFactor;//ComponentWidth;
            TButton(Child).Height := TButton(Child).Height /ScaleFactor;//ComponentHeight;

            TButton(Child).StyledSettings := TButton(Child).StyledSettings - [TStyledSetting.Size];//,
                                                                              // TStyledSetting.Other,
                                                                              //   Tstyledsetting.Family,
                                                                             //    Tstyledsetting.Style];
            TButton(Child).TextSettings.Font.Size := TButton(Child).TextSettings.Font.Size/ScaleFactor;//ComponentFontSize;
          end;

          If TControl(child) is TLabel then
          begin

            TLabel(Child).Width := TLabel(Child).Width /ScaleFactor;//ComponentWidth;
            TLabel(Child).Height := TLabel(Child).Height /ScaleFactor;//ComponentHeight;

            TLabel(Child).StyledSettings := TLabel(Child).StyledSettings - [TStyledSetting.Size];//,
                                                                              // TStyledSetting.Other,
                                                                              //   Tstyledsetting.Family,
                                                                             //    Tstyledsetting.Style];
            TLabel(Child).TextSettings.Font.Size := TLabel(Child).TextSettings.Font.Size/ScaleFactor;//ComponentFontSize;
          end;


          If TControl(child) is TComboBox then
          begin

            TComboBox(Child).Width := TComboBox(Child).Width/scalefactor;//ComponentWidth;
            TComboBox(Child).Height := TComboBox(Child).Height/scalefactor;//ComponentHeight;


            for x := 0 to TComboBox(Child).Count-1 do begin
             Item := TComboBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
                                                        //    TStyledSetting.Other,
                                                        //    Tstyledsetting.Family,
                                                        //    Tstyledsetting.Style
             Item.Font.Size := Item.Font.Size/scalefactor;//ComponentFontSize;
             Item.Height := Item.height/scalefactor;//ComponentFontSize;

            end;

          end;

          If TControl(child) is TListBox then
          begin

            TListBox(Child).Width := TListBox(Child).Width/scalefactor;//ComponentWidth;
            TListBox(Child).Height := TListBox(Child).Height/scalefactor;//ComponentHeight;


            for x := 0 to TListBox(Child).Count-1 do begin
             Item := TListBox(Child).ListItems[x];
             Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size];
                                                        //    TStyledSetting.Other,
                                                        //    Tstyledsetting.Family,
                                                        //    Tstyledsetting.Style
             Item.Font.Size := Item.Font.Size/scalefactor;//ComponentFontSize;
             Item.Height := Item.height/scalefactor;//ComponentFontSize;

            end;

          end;

          If TControl(child) is TEdit then
          begin

              TEdit(Child).Width := TEdit(Child).Width/scalefactor;//ComponentWidth;
              TEdit(Child).Height := TEdit(Child).Height/scalefactor;//ComponentHeight;

              TEdit(Child).StyledSettings := TEdit(Child).StyledSettings - [TStyledSetting.Size];//,
                                                                            // TStyledSetting.Other,
                                                                            //     Tstyledsetting.Family,
                                                                            //     Tstyledsetting.Style];
              TEdit(Child).TextSettings.Font.size := TEdit(Child).TextSettings.Font.size/scalefactor;//ComponentFontSize;

          end;


          If TControl(child) is TDateEdit then
          begin

            TDateEdit(Child).Width := TDateEdit(Child).Width / ScaleFactor;//ComponentWidth;
            TDateEdit(Child).Height := TDateEdit(Child).Height / ScaleFactor;//ComponentHeight;

            TDateEdit(Child).StyledSettings := TDateEdit(Child).StyledSettings - [TStyledSetting.Size];//,
                                                                                 //TStyledSetting.Other,
                                                                                 //Tstyledsetting.Family,
                                                                                 //Tstyledsetting.Style];
            TDateEdit(Child).TextSettings.Font.Size := TDateEdit(Child).TextSettings.Font.Size / ScaleFactor;//ComponentFontSize;

            StyleObj := TDateEdit(Child).FindStyleResource('arrow');// as TControl;

             if assigned(StyleObj) then
             begin
             //    showmessage('arrow found ' + StyleObj.StyleName);  //dropbutton

             end;


          end;



          if (Child.ChildrenCount >0) then// and (TControl(child) is TDateEdit <> true) then
          begin
            // showmessage(Child.StyleName + ' Recursion');

             ResetComponents(Child, ScaleFactor);

          end;



    // end;//Target component type
  end;//i


end;



procedure TForm1.ScaleComponents(AParent: TFMXObject; ScaleFactor: double);
var
 I, x: Integer;
 Child: TFMXObject;
 Item : TListBoxItem;
begin


  for I := 0 to AParent.childrenCount - 1 do
  begin

     Child := AParent.Children[I];

     //showmessage('Interate ' + inttostr(I) + ' ' + Child.name);
//     if (Child is TTabcontrol) or
//      (Child is TEdit) or
//      (Child is TDateEdit) or
//      (Child is TButton) or
//      (Child is TLabel)  or
//      (Child is TComboBox)  or
//      (Child is TListbox) then
//      begin


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
                                                                                // TStyledSetting.Other,
                                                                                // Tstyledsetting.Family                                                                  // Tstyledsetting.Style];
            //[TStyledSetting.Size];
            TDateEdit(Child).Font.Size := TDateEdit(Child).Font.size * ScaleFactor;
          end;

          If TControl(child) is TButton then
          begin

            TButton(Child).Width := TButton(Child).Width * ScaleFactor;
            TButton(Child).Height := TButton(Child).height * ScaleFactor;

            TButton(Child).StyledSettings := TButton(Child).StyledSettings - [TStyledSetting.Size];
            TButton(Child).Font.Size := TButton(Child).Font.size * ScaleFactor;
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


      //end;//Component types

  end;//i

end;

procedure TForm1.iteratecontrols(AParent: TFMXObject);
var
  I: Integer;
  Child: TFMXObject;
begin

  For I := 0 to AParent.ChildrenCount - 1 do
  begin
     Child := AParent.children[i];

     iterateControls(Child);

     if Child.name <> '' then
     begin

       If Child is TEdit then
       begin
        //showmessage('Component is Edit');
        if TEdit(Child).Text = '' then showmessage(Child.Name +  ' Edit Must have a Value');
       end;

       if Child is TDateEdit then
       begin
        //showmessage('Component is DateEdit');
        if TDateEdit(Child).IsEmpty then showmessage(Child.Name + ' DateEdit Must have a Value');
       end;

       if Child is TComboBox then
       begin
        //showmessage('Component is ComboBox');
        If TComboBox(Child).ItemIndex = -1 then showmessage(Child.Name + ' ComboBox Must have a Value')
       end;
     end;
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


procedure TForm1.BtnConfirmClick(Sender: TObject);
begin
  IterateControls(TabItem1);
end;

procedure TForm1.BtnScaleDownClick(Sender: TObject);
begin

  If ScaleState <> 0 then
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

  //showmessage(floattostr(ScaleState));

  If ScaleState <> 4 then
  begin
   ScaleComponents(self, 1.25);
   ScaleState := ScaleState + 1;
  end else
  begin
    Showmessage('Maximum Reached');
   exit;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  //ListAllStyleElements(DateEdit1);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

  //ListStyleresources(DateEdit1);

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

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  //ResetComponents(self, 1.5);

  case Combobox1.ItemIndex of
    0: Form1.StyleBook := DataModule2.StyleBook1;
    1: Form1.StyleBook := DataModule2.StyleBook2;
    2: Form1.StyleBook := DataModule2.StyleBook3;
    3: Form1.StyleBook := DataModule2.StyleBook4;
    4: Form1.StyleBook := DataModule2.StyleBook5;
  else
     Form1.StyleBook := DataModule2.StyleBook1
  end;

 // ResetComponents(panel1, 1.5);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  listbox1.itemIndex := tabcontrol1.TabIndex;
  //Name.Height.MaxValue;
  ScaleState := 0;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
    Form1.StyleBook := DataModule2.StyleBook5;
end;

procedure TForm1.ListBox1Change(Sender: TObject);
begin
  tabcontrol1.TabIndex := listbox1.itemIndex;
end;

procedure TForm1.NextTabAction1Update(Sender: TObject);
begin
  listbox1.itemIndex := tabcontrol1.TabIndex;
end;

procedure TForm1.PreviousTabAction1Update(Sender: TObject);
begin
  listbox1.itemIndex := tabcontrol1.TabIndex;
end;

end.

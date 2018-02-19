unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    Label2: TLabel;
    Lebel1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
i,z : integer;
chacked : bool;
begin
ListBox3.Items.Clear;
z:=0;
while z <> ListBox1.Items.Count do
  begin
    i:=0;
    chacked:=false;

      while i <> ListBox2.Items.Count do
        begin
          if chacked = false then
            if StringReplace(ListBox1.Items[z], ' ', '',[rfReplaceAll, rfIgnoreCase]) =  StringReplace(ListBox2.Items[i], ' ', '',[rfReplaceAll, rfIgnoreCase])
            then chacked := true;
        i:=i+1;
      end;
    if chacked = false
     then ListBox3.Items.Add(StringReplace(ListBox1.Items[z], ' ', '',[rfReplaceAll, rfIgnoreCase]));
    z:=z+1;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
i,z : integer;
chacked : bool;
begin
ListBox4.Items.Clear;
z:=0;
while z <> ListBox2.Items.Count do
  begin
    i:=0;
    chacked:=false;

      while i <> ListBox1.Items.Count do
        begin
          if chacked = false then
            if StringReplace(ListBox2.Items[z], ' ', '',[rfReplaceAll, rfIgnoreCase]) = StringReplace(ListBox1.Items[i], ' ', '',[rfReplaceAll, rfIgnoreCase])
            then chacked := true;
        i:=i+1;
      end;
    if chacked = false
     then ListBox4.Items.Add(ListBox2.Items[z]);
    z:=z+1;
  end;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
ListBox1.Items.LoadFromFile(GetCurrentDir+'\OPTIMA\'+ComboBox1.Text+'.txt');
ListBox2.Items.LoadFromFile(GetCurrentDir+'\�����\'+ComboBox1.Text+'.txt');

Button1.Click;
Button2.Click;

ListBox3.Items.SaveToFile(GetCurrentDir+'\'+ComboBox1.Text+'.txt');



end;

end.


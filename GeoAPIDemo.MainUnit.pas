unit GeoAPIDemo.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Edit3: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Button4: TButton;
    Memo1: TMemo;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.JSON;

procedure TForm1.Button1Click(Sender: TObject);
var
  Header: TNameValuePair;
begin
  // Get a country by its capital city

  Header := TNameValuePair.Create('apikey', 'MOEfJWv6dtiJ35Kht7iYlsjai7J1JWjB');

  var HTTP := TNetHTTPClient.Create(nil);
  try
    var Response := HTTP.Get('https://api.apilayer.com/geo/country/capital/'
                  + Edit1.Text, nil, [header]);

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Header: TNameValuePair;
begin
  // Get Country by lang code
  Header := TNameValuePair.Create('apikey', 'MOEfJWv6dtiJ35Kht7iYlsjai7J1JWjB');

  var
  HTTP := TNetHTTPClient.Create(nil);
  try
    var
    Response := HTTP.Get('https://api.apilayer.com/geo/country/lang/' +
      Edit2.Text, nil, [header]);

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Header: TNameValuePair;
begin
  // Getting Country Cities
  Header := TNameValuePair.Create('apikey', 'MOEfJWv6dtiJ35Kht7iYlsjai7J1JWjB');

  var
  HTTP := TNetHTTPClient.Create(nil);
  try
    var
    Response := HTTP.Get('https://api.apilayer.com/geo/country/cities/' +
      Edit3.Text, nil, [header]);

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Header: TNameValuePair;
begin
  // How to Get a Currency Information by Currency Symbol
  Header := TNameValuePair.Create('apikey', 'MOEfJWv6dtiJ35Kht7iYlsjai7J1JWjB');

  var
  HTTP := TNetHTTPClient.Create(nil);
  try
    var
    Response := HTTP.Get('https://api.apilayer.com/geo/country/currency/'
                + Edit4.Text, nil, [header]);

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;
end;

end.

table 70009202 "G/L Source Name Help Resource"
{
  // version GLSN10.0

  Permissions=TableData "G/L Source Name Help Resource"=im;

  fields
  {
    field(1;"Code";Code[50])
    {
      CaptionML=ENU='Code';
    }
    field(2;Url;Text[250])
    {
      CaptionML=ENU='Url';
      ExtendedDatatype=URL;
    }
    field(3;Icon;Media)
    {
      CaptionML=ENU='Icon';
    }
  }

  keys
  {
    key(Key1;"Code")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }

  procedure InitializeResources();
  begin
    InitAssistedSetupHelpPageUrl;
    InitAssistedSetupEmbedVideoUrl;
    InitUsageHelpEmbedVideoUrl;
    InitUsageHelpPageUrl;
    InitIcon70x70;
    InitIcon150x150;
    InitIcon240x240;
    InitIcon250x250;
    InitIcon417x417;
  end;

  procedure GetUrl(SetupCode : Code[50]) : Text;
  begin
    if GET(SetupCode) then
      exit(Url);
  end;

  procedure StartVideo(SetupCode : Code[50]);
  var
    VideoLink : Page "Video link";
    ClientTypeMgt : Codeunit ClientTypeManagement;
  begin
    if ClientTypeMgt.IsCommonWebClientType then begin
      VideoLink.SetURL(GetUrl(SetupCode));
      VideoLink.RUNMODAL;
    end else
      HYPERLINK(GetUrl(SetupCode));
  end;

  procedure GetSetupHelpCode() : Code[50];
  var
    SetupHelpCode : TextConst ENU='SETUPHELP';
  begin
    exit(SetupHelpCode);
  end;

  procedure GetSetupVideoCode() : Code[50];
  var
    SetupVideoCode : TextConst ENU='SETUPVIDEO';
  begin
    exit(SetupVideoCode);
  end;

  procedure GetUsageHelpCode() : Code[50];
  var
    UsageHelpCode : TextConst ENU='USAGEHELP';
  begin
    exit(UsageHelpCode);
  end;

  procedure GetUsageVideoCode() : Code[50];
  var
    UsageVideoCode : TextConst ENU='USAGEVIDEO';
  begin
    exit(UsageVideoCode);
  end;

  procedure Get70PXIconCode() : Code[50];
  var
    IconCode : TextConst ENU='GLSOURCENAMES_70PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get150PXIconCode() : Code[50];
  var
    IconCode : TextConst ENU='GLSOURCENAMES_150PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get240PXIconCode() : Code[50];
  var
    IconCode : TextConst ENU='GLSOURCENAMES_240PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get250PXIconCode() : Code[50];
  var
    IconCode : TextConst ENU='GLSOURCENAMES_250PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get417PXIconCode() : Code[50];
  var
    IconCode : TextConst ENU='GLSOURCENAMES_417PXICON';
  begin
    exit(IconCode)
  end;

  local procedure InitAssistedSetupHelpPageUrl();
  var
    SetupHelpUrl : TextConst ENU='http://Objects4NAV.com/GLSourceNames';
  begin
    InitUrl(GetSetupHelpCode,SetupHelpUrl);
  end;

  local procedure InitAssistedSetupEmbedVideoUrl();
  var
    SetupVideoUrl : TextConst ENU='https://www.youtube.com/embed/TYo1ZJ5jizs';
  begin
    InitUrl(GetSetupVideoCode,SetupVideoUrl);
  end;

  local procedure InitUsageHelpPageUrl();
  var
    UsageHelpUrl : TextConst ENU='http://Objects4NAV.com/GLSourceNames';
  begin
    InitUrl(GetUsageHelpCode,UsageHelpUrl);
  end;

  local procedure InitUsageHelpEmbedVideoUrl();
  var
    UsageVideoUrl : TextConst ENU='https://www.youtube.com/embed/Xj5TATt7Pns';
  begin
    InitUrl(GetUsageVideoCode,UsageVideoUrl);
  end;

  local procedure InitIcon70x70();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst ENU='G/L Source Name Icon 70x70';
    GLSourceNameIcon : Codeunit "G/L Source Name Icon 70x70";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get70PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon150x150();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst ENU='G/L Source Name Icon 150x150';
    GLSourceNameIcon : Codeunit "G/L Source Name Icon 150x150";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get150PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon240x240();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst ENU='G/L Source Name Icon 240x240';
    GLSourceNameIcon : Codeunit "G/L Source Name Icon 240x240";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get70PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon250x250();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst ENU='G/L Source Name Icon 250x250';
    GLSourceNameIcon : Codeunit "G/L Source Name Icon 250x250";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get250PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon417x417();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst ENU='G/L Source Name Icon 417x417';
    GLSourceNameIcon : Codeunit "G/L Source Name Icon 417x417";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get417PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitUrl(UrlCode : Code[50];UrlLink : Text);
  var
    GLSourceNameHelpResource : Record "G/L Source Name Help Resource";
  begin
    with GLSourceNameHelpResource do
      if not GET(UrlCode) then begin
        Code := UrlCode;
        Url := UrlLink;
        INSERT;
      end;
  end;

  local procedure InitIcon(IconCode : Code[50];IconDescription : Text;TempBlob : Record TempBlob);
  var
    GLSourceNameHelpResource : Record "G/L Source Name Help Resource";
    InStr : InStream;
  begin
    with GLSourceNameHelpResource do
      if not GET(IconCode) then begin
        Code := IconCode;
        TempBlob.Blob.CREATEINSTREAM(InStr);
        Icon.IMPORTSTREAM(InStr,IconDescription,'image/png');
        INSERT;
      end;
  end;
}


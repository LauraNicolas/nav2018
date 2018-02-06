table 70009202 "O4N GL SN Help Resource"
{
  // version GLSN10.0

  Permissions=TableData "O4N GL SN Help Resource"=im;

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
    SetupHelpCode : TextConst Comment='{Locked}',ENU='SETUPHELP';
  begin
    exit(SetupHelpCode);
  end;

  procedure GetSetupVideoCode() : Code[50];
  var
    SetupVideoCode : TextConst Comment='{Locked}',ENU='SETUPVIDEO';
  begin
    exit(SetupVideoCode);
  end;

  procedure GetUsageHelpCode() : Code[50];
  var
    UsageHelpCode : TextConst Comment='{Locked}',ENU='USAGEHELP';
  begin
    exit(UsageHelpCode);
  end;

  procedure GetUsageVideoCode() : Code[50];
  var
    UsageVideoCode : TextConst Comment='{Locked}',ENU='USAGEVIDEO';
  begin
    exit(UsageVideoCode);
  end;

  procedure Get70PXIconCode() : Code[50];
  var
    IconCode : TextConst Comment='{Locked}',ENU='GLSOURCENAMES_70PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get150PXIconCode() : Code[50];
  var
    IconCode : TextConst Comment='{Locked}',ENU='GLSOURCENAMES_150PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get240PXIconCode() : Code[50];
  var
    IconCode : TextConst Comment='{Locked}',ENU='GLSOURCENAMES_240PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get250PXIconCode() : Code[50];
  var
    IconCode : TextConst Comment='{Locked}',ENU='GLSOURCENAMES_250PXICON';
  begin
    exit(IconCode)
  end;

  procedure Get417PXIconCode() : Code[50];
  var
    IconCode : TextConst Comment='{Locked}',ENU='GLSOURCENAMES_417PXICON';
  begin
    exit(IconCode)
  end;

  local procedure InitAssistedSetupHelpPageUrl();
  var
    SetupHelpUrl : TextConst Comment='{Locked}',ENU='http://Objects4NAV.com/GLSourceNames';
  begin
    InitUrl(GetSetupHelpCode,SetupHelpUrl);
  end;

  local procedure InitAssistedSetupEmbedVideoUrl();
  var
    SetupVideoUrl : TextConst Comment='{Locked}',ENU='https://www.youtube.com/embed/TYo1ZJ5jizs';
  begin
    InitUrl(GetSetupVideoCode,SetupVideoUrl);
  end;

  local procedure InitUsageHelpPageUrl();
  var
    UsageHelpUrl : TextConst Comment='{Locked}',ENU='http://Objects4NAV.com/GLSourceNames';
  begin
    InitUrl(GetUsageHelpCode,UsageHelpUrl);
  end;

  local procedure InitUsageHelpEmbedVideoUrl();
  var
    UsageVideoUrl : TextConst Comment='{Locked}',ENU='https://www.youtube.com/embed/Xj5TATt7Pns';
  begin
    InitUrl(GetUsageVideoCode,UsageVideoUrl);
  end;

  local procedure InitIcon70x70();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst Comment='{Locked}',ENU='G/L Source Name Icon 70x70';
    GLSourceNameIcon : Codeunit "O4N GL SN Icon 70x70";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get70PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon150x150();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst Comment='{Locked}',ENU='G/L Source Name Icon 150x150';
    GLSourceNameIcon : Codeunit "O4N GL SN Icon 150x150";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get150PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon240x240();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst Comment='{Locked}',ENU='G/L Source Name Icon 240x240';
    GLSourceNameIcon : Codeunit "O4N GL SN Icon 240x240";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get70PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon250x250();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst Comment='{Locked}',ENU='G/L Source Name Icon 250x250';
    GLSourceNameIcon : Codeunit "O4N GL SN Icon 250x250";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get250PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitIcon417x417();
  var
    TempBlob : Record TempBlob;
    IconDescription : TextConst Comment='{Locked}',ENU='G/L Source Name Icon 417x417';
    GLSourceNameIcon : Codeunit "O4N GL SN Icon 417x417";
  begin
    GLSourceNameIcon.GetIcon(TempBlob);
    InitIcon(Get417PXIconCode,IconDescription,TempBlob);
  end;

  local procedure InitUrl(UrlCode : Code[50];UrlLink : Text);
  var
    GLSourceNameHelpResource : Record "O4N GL SN Help Resource";
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
    GLSourceNameHelpResource : Record "O4N GL SN Help Resource";
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


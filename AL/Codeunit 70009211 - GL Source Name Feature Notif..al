codeunit 70009211 "G/L Source Name Feature Notif."
{
  // version GLSN10.0


  trigger OnRun();
  begin
  end;

  var
    ShowAgainQst : TextConst ENU='Do you want to hide this notification in the future?';

  procedure ShowDetailsToUser(NewFeatureNotification : Notification);
  begin
    StartVideo('https://www.youtube.com/embed/hpyLICCzur8');
  end;

  local procedure StartVideo(Url : Text);
  var
    VideoLink : Page "Video link";
    ClientTypeMgt : Codeunit ClientTypeManagement;
  begin
    if ClientTypeMgt.IsCommonWebClientType then begin
      VideoLink.SetURL(Url);
      VideoLink.RUNMODAL;
    end else
      HYPERLINK(Url);
  end;
}


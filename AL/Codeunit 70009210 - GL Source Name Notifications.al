codeunit 70009210 "G/L Source Name Notifications"
{
  // version GLSN10.0.0.1


  trigger OnRun();
  begin
  end;

  var
    GLSourceName : Record "G/L Source Name";
    NewFeatuerNotificationIdTxt : TextConst Comment='{Locked}',ENU='1dd20373-27f8-4c68-a7b4-aab7ca199b98';
    NewFeatureMessageTxt : TextConst ENU='We have added a new feature to the General Ledger Entries.  Now you can see the Source Name column!';
    NewFeatureLinkTxt : TextConst ENU='Show me the details';
    MissingPermissionNotificationIdTxt : TextConst Comment='{Locked}',ENU='4fa8230a-53e5-4182-8423-373dc6f23f9d';
    MissingPermissionMessageText : TextConst ENU='You don''t have permissions to use our new feature that will show Source Names.  Please contact your administrator.';
    MissingPermissionLinkTxt : TextConst ENU='What should I show?';
    GLSourceNameUserSetup : Record "G/L Source Name User Setup";

  [EventSubscriber(ObjectType::Page, 20, 'OnOpenPageEvent', '', true, true)]
  local procedure CatchGLEntriesOpenPage(var Rec : Record "G/L Entry");
  begin
    if not GLSourceNameUserSetup.WRITEPERMISSION then exit;
    if not GLSourceName.READPERMISSION then
      NotifyOnMissingPermission(Rec)
    else
      NotifyOnNewFeature(Rec);
  end;

  local procedure NotifyOnMissingPermission(var Rec : Record "G/L Entry");
  var
    MissingPermissionNotification : Notification;
  begin
    if GetNotificationHasBeenShown(GetMissingPermissionNotificationId) then exit;
    with MissingPermissionNotification do begin
      ID := GetMissingPermissionNotificationId;
      MESSAGE := MissingPermissionMessageText;
      SCOPE := NOTIFICATIONSCOPE::LocalScope;
      ADDACTION(MissingPermissionLinkTxt,CODEUNIT::"G/L Source Name Perm. Notif.",'ShowAssistedSetupToUser');
      SEND;
    end;
    SetNotificationHasBeenShown(GetMissingPermissionNotificationId);
  end;

  local procedure NotifyOnNewFeature(var Rec : Record "G/L Entry");
  var
    NewFeatureNotification : Notification;
  begin
    if GetNotificationHasBeenShown(GetNewFeatuerNotificationId) then exit;
    with NewFeatureNotification do begin
      ID := GetNewFeatuerNotificationId;
      MESSAGE := NewFeatureMessageTxt;
      SCOPE := NOTIFICATIONSCOPE::LocalScope;
      ADDACTION(NewFeatureLinkTxt,CODEUNIT::"G/L Source Name Feature Notif.",'ShowDetailsToUser');
      SEND;
    end;
    SetNotificationHasBeenShown(GetNewFeatuerNotificationId);
  end;

  procedure GetMissingPermissionNotificationId() : Guid;
  var
    MissingPermissionNotificationId : Guid;
  begin
    EVALUATE(MissingPermissionNotificationId,MissingPermissionNotificationIdTxt);
    exit(MissingPermissionNotificationId);
  end;

  procedure GetNewFeatuerNotificationId() : Guid;
  var
    NewFeatuerNotificationId : Guid;
  begin
    EVALUATE(NewFeatuerNotificationId,NewFeatuerNotificationIdTxt);
    exit(NewFeatuerNotificationId);
  end;

  local procedure GetNotificationHasBeenShown(NotificationId : Guid) : Boolean;
  begin
    with GLSourceNameUserSetup do
      exit(GET(USERSECURITYID,NotificationId));
  end;

  local procedure SetNotificationHasBeenShown(NotificationId : Guid);
  begin
    with GLSourceNameUserSetup do begin
      "User Security ID" := USERSECURITYID;
      "Notification Id" := NotificationId;
      INSERT;
    end;
  end;
}


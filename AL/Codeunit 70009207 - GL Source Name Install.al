codeunit 70009207 "O4N GL Source Name Install"
{
    Subtype = Install;
    trigger OnRun();
    begin
    end;

    var
    PermissionSetToSetupGLSourceNames : TextConst ENU='G/L-SOURCE NAMES, S';
    PermissionSetToUpdateGLSourceNames : TextConst ENU='G/L-SOURCE NAMES, E';
    PermissionSetToUserGLSourceNames : TextConst ENU='G/L-SOURCE NAMES';

    
    trigger OnInstallAppPerCompany();
    var
        GLSourceNameMgt : Codeunit "O4N GL SN Mgt";
    begin
        NAVAPP.RESTOREARCHIVEDATA(DATABASE::"O4N GL SN Setup");
        NAVAPP.RESTOREARCHIVEDATA(DATABASE::"O4N GL SN User Setup");
        NAVAPP.DELETEARCHIVEDATA(DATABASE::"O4N GL SN");

        NAVAPP.DELETEARCHIVEDATA(DATABASE::"O4N GL SN Help Resource");
        NAVAPP.DELETEARCHIVEDATA(DATABASE::"O4N GL SN User Access");
        NAVAPP.DELETEARCHIVEDATA(DATABASE::"O4N GL SN Group Access");

        GLSourceNameMgt.PopulateSourceTable;
        RemoveAssistedSetup;
    end;

    trigger OnInstallAppPerDatabase();
    var
        AccessControl : Record "Access Control";
    begin
        with AccessControl do begin
            SETFILTER("Role ID",'%1|%2','SUPER','SECURITY');
            if FINDSET then repeat
                AddUserAccess("User Security ID",PermissionSetToUserGLSourceNames);
                AddUserAccess("User Security ID",PermissionSetToUpdateGLSourceNames);
                AddUserAccess("User Security ID",PermissionSetToSetupGLSourceNames);
            until NEXT = 0;
        end;
    end;

  local procedure RemoveAssistedSetup();
  var
    AssistedSetup : Record "Assisted Setup";
  begin
    with AssistedSetup do begin
      SETRANGE("Page ID",PAGE::"O4N GL SN Setup Wizard");
      if not ISEMPTY then
        DELETEALL;
    end;
  end;

  local procedure AddUserAccess(AssignToUser : Guid;PermissionSet : Code[20]);
  var
    AccessControl : Record "Access Control";
    AppMgt : Codeunit "O4N GL SN App Mgt.";
    AppGuid : Guid;
  begin
    EVALUATE(AppGuid,AppMgt.GetAppId);
    with AccessControl do begin
      INIT;
      "User Security ID" := AssignToUser;
      "App ID" := AppGuid;
      Scope := Scope::Tenant;
      "Role ID" := PermissionSet;
      if not FIND then
        INSERT(true);
    end;
  end;

}
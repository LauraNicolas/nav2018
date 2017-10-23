codeunit 70009201 "G/L Source Name Mgt"
{
  // version GLSN10.0

  Permissions=TableData "G/L Source Name"=rimd;

  trigger OnRun();
  begin
  end;

  var
    Window : Dialog;
    SourceType : Option " ",Customer,Vendor,"Bank Account","Fixed Asset";
    ProcessInfo : TextConst ENU='Populating G/L Source Names...';
    RequiredPermissionMissingErr : TextConst ENU='Required permissions for table "%1" is missing.  Can''t refresh lookup data.';
    ProcessCompleted : TextConst ENU='G/L Source Names lookup table update finished';

  procedure AddSource(SourceType : Option;SourceNo : Code[20];SourceName : Text[50]);
  var
    GLSourceName : Record "G/L Source Name";
  begin
    with GLSourceName do begin
      if not WRITEPERMISSION then exit;
      if GET(SourceType,SourceNo) then
        UpdateSource(SourceType,SourceNo,SourceName)
      else begin
        INIT;
        "Source Type" := SourceType;
        "Source No." := SourceNo;
        "Source Name" := SourceName;
        INSERT;
      end;
    end;
  end;

  procedure RemoveSource(SourceType : Option;SourceNo : Code[20]);
  var
    GLSourceName : Record "G/L Source Name";
  begin
    with GLSourceName do begin
      if not WRITEPERMISSION then exit;
      if GET(SourceType,SourceNo) then
        DELETE;
    end;
  end;

  procedure UpdateSource(SourceType : Option;SourceNo : Code[20];SourceName : Text[50]);
  var
    GLSourceName : Record "G/L Source Name";
  begin
    with GLSourceName do begin
      if not WRITEPERMISSION then exit;
      if GET(SourceType,SourceNo) then begin
        "Source Type" := SourceType;
        "Source No." := SourceNo;
        "Source Name" := SourceName;
        MODIFY;
      end else
        AddSource(SourceType,SourceNo,SourceName);
    end;
  end;

  procedure Refresh(HideMessage : Boolean);
  var
    GLSourceName : Record "G/L Source Name";
    Customer : Record Customer;
    Vendor : Record Vendor;
    BankAccount : Record "Bank Account";
    FixedAsset : Record "Fixed Asset";
  begin
    with GLSourceName do
      if not WRITEPERMISSION then
        ERROR(RequiredPermissionMissingErr);
    with Customer do
      if not READPERMISSION then
        ERROR(RequiredPermissionMissingErr);
    with Vendor do
      if not READPERMISSION then
        ERROR(RequiredPermissionMissingErr);
    with BankAccount do
      if not READPERMISSION then
        ERROR(RequiredPermissionMissingErr);
    with FixedAsset do
      if not READPERMISSION then
        ERROR(RequiredPermissionMissingErr);
    GLSourceName.DELETEALL;
    PopulateSourceTable;
    if not HideMessage then
      MESSAGE(ProcessCompleted);
  end;

  procedure PopulateSourceTable();
  var
    GLSourceName : Record "G/L Source Name";
    Customer : Record Customer;
    Vendor : Record Vendor;
    BankAccount : Record "Bank Account";
    FixedAsset : Record "Fixed Asset";
  begin
    if GLSourceName.WRITEPERMISSION and
      Customer.READPERMISSION and
      Vendor.READPERMISSION and
      BankAccount.READPERMISSION and
      FixedAsset.READPERMISSION
    then begin
      if not GLSourceName.ISEMPTY then exit;
      if Customer.ISEMPTY and Vendor.ISEMPTY and BankAccount.ISEMPTY and FixedAsset.ISEMPTY then exit;
      Window.OPEN(ProcessInfo);
      AddSourceTable(SourceType::Customer,Customer);
      AddSourceTable(SourceType::Vendor,Vendor);
      AddSourceTable(SourceType::"Bank Account",BankAccount);
      AddSourceTable(SourceType::"Fixed Asset",FixedAsset);
      Window.CLOSE;
    end;
  end;

  procedure AddSourceTable(SourceType : Option;RecVariant : Variant);
  var
    RecRef : RecordRef;
    NoField : FieldRef;
    NameField : FieldRef;
  begin
    with RecRef do begin
      GETTABLE(RecVariant);
      if FINDSET then repeat
        NoField := FIELD(1);
        NameField := FIELD(2);
        AddSource(SourceType,FORMAT(NoField.VALUE),FORMAT(NameField.VALUE));
      until NEXT = 0;
    end;
  end;
}


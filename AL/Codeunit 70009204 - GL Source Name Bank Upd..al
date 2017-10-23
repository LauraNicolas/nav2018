codeunit 70009204 "G/L Source Name Bank Upd."
{
  // version GLSN10.0


  trigger OnRun();
  begin
  end;

  var
    GLSourceNamesMgt : Codeunit "G/L Source Name Mgt";
    SourceType : Option " ",Customer,Vendor,"Bank Account","Fixed Asset";

  [EventSubscriber(ObjectType::Table, 270, 'OnAfterInsertEvent', '', true, false)]
  local procedure UpdateSourceNameOnBankAccInsert(var Rec : Record "Bank Account";RunTrigger : Boolean);
  begin
    if Rec.ISTEMPORARY then exit;
    GLSourceNamesMgt.AddSource(SourceType::"Bank Account",Rec."No.",Rec.Name);
  end;

  [EventSubscriber(ObjectType::Table, 270, 'OnAfterDeleteEvent', '', true, false)]
  local procedure UpdateSourceNameOnBankAccDelete(var Rec : Record "Bank Account";RunTrigger : Boolean);
  begin
    if Rec.ISTEMPORARY then exit;
    GLSourceNamesMgt.RemoveSource(SourceType::"Bank Account",Rec."No.");
  end;

  [EventSubscriber(ObjectType::Table, 270, 'OnAfterModifyEvent', '', true, false)]
  local procedure UpdateSourceNameOnBankAccModify(var Rec : Record "Bank Account";var xRec : Record "Bank Account";RunTrigger : Boolean);
  begin
    if Rec.ISTEMPORARY then exit;
    GLSourceNamesMgt.UpdateSource(SourceType::"Bank Account",Rec."No.",Rec.Name);
  end;
}


page 70009201 "G/L Source Name Setup"
{
  // version GLSN10.0

  CaptionML=ENU='G/L Source Name Setup';
  DeleteAllowed=false;
  InsertAllowed=false;
  PageType=Card;
  SourceTable="G/L Source Name Setup";

  layout
  {
    area(content)
    {
      group(General)
      {
        field("Registration E-Mail Address";"Registration E-Mail Address")
        {
          ApplicationArea=Basic,Suite;
          ShowMandatory=true;
          ToolTipML=ENU='The G/L Source Name Extension will be registered on this E-Mail Address.  When registering the registration key will be sent to this E-Mail Address.';
        }
        field("Next Registration Verification";"Next Registration Verification")
        {
          ApplicationArea=Basic,Suite;
          Editable=false;
        }
      }
    }
  }

  actions
  {
  }

  trigger OnOpenPage();
  begin
    if ISEMPTY then begin
      INIT;
      INSERT;
    end;
  end;
}


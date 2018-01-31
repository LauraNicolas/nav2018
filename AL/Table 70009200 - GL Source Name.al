table 70009200 "O4N GL SN"
{
  // version GLSN10.0

  DrillDownPageID="O4N GL SNs DrillDown";

  fields
  {
    field(1;"Source Type";Option)
    {
      CaptionML=ENU='Source Type';
      OptionCaptionML=ENU=' ,Customer,Vendor,Bank Account,Fixed Asset';
      OptionMembers=" ",Customer,Vendor,"Bank Account","Fixed Asset";
    }
    field(2;"Source No.";Code[20])
    {
      CaptionML=ENU='Source No.';
      TableRelation=IF ("Source Type"=CONST(Customer)) Customer
ELSE IF ("Source Type"=CONST(Vendor)) Vendor
ELSE IF ("Source Type"=CONST("Bank Account")) "Bank Account"
ELSE IF ("Source Type"=CONST("Fixed Asset")) "Fixed Asset";
    }
    field(3;"Source Name";Text[50])
    {
      CaptionML=ENU='Source Name';
    }
  }

  keys
  {
    key(Key1;"Source Type","Source No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


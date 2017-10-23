table 70009204 "G/L Source Name Group Access"
{
  // version GLSN10.0


  fields
  {
    field(1;"Permission Level";Option)
    {
      CaptionML=ENU='Permission Level';
      OptionCaptionML=ENU='Read,Update';
      OptionMembers=Read,Update;
    }
    field(2;"User Group Code";Code[20])
    {
      CaptionML=ENU='User Group Code';
      NotBlank=true;
      TableRelation="User Group";
    }
    field(4;"User Group Name";Text[50])
    {
      CalcFormula=Lookup("User Group".Name WHERE (Code=FIELD("User Group Code")));
      CaptionML=ENU='User Group Name';
      Editable=false;
      FieldClass=FlowField;
    }
    field(6;"Has Permission";Boolean)
    {
      CaptionML=ENU='Has Permission';
    }
    field(7;"Assign Permission";Boolean)
    {
      CaptionML=ENU='Assign Permission';
    }
    field(8;"Remove Permission";Boolean)
    {
      CaptionML=ENU='Remove Permission';
    }
  }

  keys
  {
    key(Key1;"Permission Level","User Group Code")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


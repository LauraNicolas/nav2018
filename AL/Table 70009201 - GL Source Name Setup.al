table 70009201 "G/L Source Name Setup"
{
  // version GLSN10.0


  fields
  {
    field(1;"Primary Key";Code[10])
    {
      CaptionML=ENU='Primary Key';
    }
    field(2;"Registration E-Mail Address";Text[50])
    {
      CaptionML=ENU='Registration E-Mail Address';
    }
    field(3;"Installation Id";Guid)
    {
      CaptionML=ENU='Installation Id';
    }
    field(4;"Registration Id";Guid)
    {
      CaptionML=ENU='Registration Id';
    }
    field(5;"Next Registration Verification";DateTime)
    {
      CaptionML=ENU='Next Registration Verification';
    }
    field(12;Status;Option)
    {
      CaptionML=ENU='Status';
      OptionCaptionML=ENU='Not Completed,Completed,Not Started,Seen,Watched,Read, ';
      OptionMembers="Not Completed",Completed,"Not Started",Seen,Watched,Read," ";
    }
    field(13;"Tour Id";Integer)
    {
      CaptionML=ENU='Tour Id';
    }
    field(14;"Video Status";Boolean)
    {
      CaptionML=ENU='Video Status';
    }
    field(15;"Help Status";Boolean)
    {
      CaptionML=ENU='Help Status';
    }
    field(16;"Tour Status";Boolean)
    {
      CaptionML=ENU='Tour Status';
    }
  }

  keys
  {
    key(Key1;"Primary Key")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


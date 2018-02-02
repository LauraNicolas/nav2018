pageextension 70009201 pageextension70009201 extends "General Ledger Entries" 
{
  // version NAVW111.0,GLSN10.0

  layout
  {
    addafter("Bal. Account No.")
    {
      field("Source Type";"Source Type")
      {
        AccessByPermission=TableData "O4N GL SN"=R;
        ApplicationArea=Basic,Suite;
        ToolTipML=ENU='Specifies the type of the master record associated with this entry';
      }
      field("Source No.";"Source No.")
      {
        AccessByPermission=TableData "O4N GL SN"=R;
        ApplicationArea=Basic,Suite;
        ToolTipML=ENU='Specifies the number of the master record associated with this entry';
        Visible=false;
      }
      field("Source Name";"O4N Source Name")
      {
        AccessByPermission=TableData "O4N GL SN"=R;
        ApplicationArea=Basic,Suite;
        ToolTipML=ENU='Specifies the name of the master record associated with this entry';
      }
    }
  }
  actions
  {
    addafter("Value Entries")
    {
      action(SourceCard)
      {
        AccessByPermission=TableData "O4N GL SN"=R;
        ApplicationArea=Basic,Suite;
        CaptionML=ENU='Source Card';
        Image=Card;
        RunObject=Codeunit "G/L Show Source Card";
        ToolTipML=ENU='Show the card for the master record defined as the source for this entry';
      }
    }
  }
}


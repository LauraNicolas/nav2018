page 70009200 "G/L Source Name List"
{
  // version GLSN10.0

  CaptionML=ENU='G/L Source Name List';
  Editable=false;
  PageType=List;
  SourceTable="G/L Source Name";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Source Type";"Source Type")
        {
          ApplicationArea=Basic,Suite;
        }
        field("Source No.";"Source No.")
        {
          ApplicationArea=Basic,Suite;
        }
        field("Source Name";"Source Name")
        {
          ApplicationArea=Basic,Suite;
        }
      }
    }
  }

  actions
  {
  }
}


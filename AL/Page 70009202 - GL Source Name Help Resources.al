page 70009202 "G/L Source Name Help Resources"
{
  // version GLSN10.0

  Editable=false;
  PageType=List;
  SourceTable="G/L Source Name Help Resource";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Code";Code)
        {
          ApplicationArea=Basic,Suite;
        }
        field(Url;Url)
        {
          ApplicationArea=Basic,Suite;
        }
        field(Icon;Icon)
        {
          ApplicationArea=Basic,Suite;
        }
      }
    }
  }

  actions
  {
  }

  trigger OnOpenPage();
  begin
    InitializeResources;
  end;
}


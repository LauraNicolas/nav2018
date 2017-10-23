page 70009206 "G/L Source Names DrillDown"
{
  // version GLSN10.0

  CaptionML=ENU='G/L Source Names DrillDown';
  Editable=false;
  PageType=List;
  SourceTable="G/L Source Name";

  layout
  {
  }

  actions
  {
  }

  trigger OnOpenPage();
  begin
    if FINDFIRST then
      GLShowSourceCard.ShowSourceNameCard(Rec);
    ERROR('');
  end;

  var
    GLShowSourceCard : Codeunit "G/L Show Source Card";
}


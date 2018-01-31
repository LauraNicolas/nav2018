tableextension 70009202 tableextension70009202 extends "G/L Entry" 
{
  // version NAVW111.0,GLSN10.0

  fields
  {
    field(70009200;"Source Name";Text[50])
    {
      CalcFormula=Lookup("O4N GL SN"."Source Name" WHERE ("Source Type"=FIELD("Source Type"),
                                                                "Source No."=FIELD("Source No.")));
      CaptionML=ENU='Source Name';
      Editable=false;
      FieldClass=FlowField;
    }
  }
  keys
  {
  }
}


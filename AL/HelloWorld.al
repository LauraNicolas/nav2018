pageextension 50100 MyCustomerExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt : Integer;

    trigger OnOpenPage();
    begin
        message('here is a new message on open page for the extension Hello world');
    end;
}
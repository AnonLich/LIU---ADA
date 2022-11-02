procedure Main () is
    
    type Int_Pointer is 
        access Integer;

    P1,P2 : Int_Pointer;
    I1, I2 : Integer;

begin
    P1 := null;

    P2 := new Integer;

    P1 := P2;


end Main;



procedure Main () is
    
    type Person_Ptr is  --pekare till en person
        access Person_Type  --person_type innehåller skonummer, namn osv på en person


begin
    
end Main;
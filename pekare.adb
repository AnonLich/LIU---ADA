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


-----------------------------------------------------------------------------------------
procedure Main () is
    
    type Person_Ptr is  --pekare till en person
        access Person_Type  --person_type innehåller skonummer, namn osv på en person

    type Person_Type is 
        record
            Name : String(1..30);
            Shoe_Size : Float;
        end record;


P3, P4 : Person_Ptr; --Deklarerar p3 och p4 till person pointer

begin
    P3 := new Person_Type;
    P3.Shoe_Size := 37.5;
    P3.all.Shoe_Size := 37.5;
    P3.all := (Name => ".....",
              Shoe_Size => 40.5);

    P4 := new Person_Type;

    P3 := P4;

end Main;

----------------------------------------------------------------------------------------------------
procedure Main () is
    
    type E_Type;

    type List_Type is
        access E_Type;

    type E_Type is
        record 
            Data : Person_Type;
            Next : List_Type;

    --Iterativt (funkar inte?)
    function Length (L : in List_Type) return Integer is
        Tmp : List_Type;
        Result : Integer;
    begin
        Result := 0
        Tmp := L;
        while L /= null loop
            Result := Result +1;
            Tmp := Tmp.Next;
        end loop;
    end Length;


    --Rekursivt
    function Length (L : in Length_Type) return Integer is
    begin
        if L = null then --Måste ALLTID kolla om listan är null
            return 0;
        else
            return 1 + Length(L.next);
        end if;
    end Length;;

L : List_Type;
I : Integer;

begin
    I := Length(L);



end Main;
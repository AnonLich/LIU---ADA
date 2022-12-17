procedure Main is

type Element_Type;

type Point_Type is
    access Element_Type;

type Element_Type is
    record
        I : Integer;
        Next : Point_Type;
    end record;

--Skapa underprogrammet Insert_First. Stoppa in ett nytt heltal på första platsen i listan

procedure Insert_First (List : in out Point_Type;
                        Data : in Integer) is
    TMP : Point_Type;
begin
    --List := new Element_Type (Data, null);
    if  List           = null then
        List          := new Element_Type; -- Allokerar minne med "new" och visar att vi vill allokera den med Element_Type.
        List.all.I    := Data;             -- .all säger "jag vill in o titta på minnesutrummet vi pekar på"
        List.all.Next := null;
    else
        TMP           := new Element_Type;
        TMP.all.I     := Data;
        TMP.all.Next  := List;
        List          := TMP;
    end if;
end Insert_First;


--Skapa proceduren insert som stoppar in ett heltal sorterat : fallande ordning

    procedure Insert (List : in out Point_Type;
                    Data : in Integer) is
        
    begin
        --List := null or Data
        if List = null then
            Insert_First(List, Data);
        elsif Data > List.all.next then
            Insert_First(List, Data);
        else
            Insert(List.all.next, Data);
        end if;
    end Insert;
end Main;
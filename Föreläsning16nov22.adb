with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is


F1,F2 : File_Type; --Alltid null från början

begin
    
    Get (Standard_Input, X); --vad vi alltid gettat
                    --% main < fil.txt --hur man gör för att ta input från en fil
    Open(F1, In_File,"A.txt");  --öppna fil --open kastar name_error när filen inte finns
    Get(F1, x);
    Put(F1, "hejhejhej");
    Skip_Line(F1); --Måste alltid visa vart vi gör kommandot. (F1)

    if End_Of_Line(F1) and End_Of_File(F1) then
        null
    end if;

    Create(F2, Out_File, "B.txt"); --kastar name_error när filen finns --kommer överskriva filen om man kör igen
    Close(F2); --Efter close kommer du inte kunna göra någpnting med datat efter. Detta görs innan
    Delete(F2); --tar bort och avslutar filen
    Reset(F2); -- stänger ner och startar upp filen

    --%cp A.txt B.txt --kopiera i terminal A-B


--NYTT HUVUDPROGRAM NEDANFÖR

    procedure Lagg_Till () is
        
    begin
        

        
    end Lagg_Till;

    procedure cp () is --gör ovanstående i ett underprogram
        
        --skapa underprogram för att kopiera en fil till en annan
        procedure Copy (From : in File_Type;
                        To   : in File_Type) is
            Ch : Character;
        begin

            while not End_Of_File(From) then
                while not End_Of_Line(From) then
                    Get(From, Ch);
                    Put(To, Ch);
                end loop;
                Skip_Line(From);
                New_Line(To);
            end loop;

        end Copy;
        
        F1,F2 : File_Type;
    begin
        Open(F1, In_File, "A.txt");
        Create(F2, Out_File, "B.txt");
        Copy(F1,F2);
        Close(F2);
        Delete(F1);

    end cp;


end Main;



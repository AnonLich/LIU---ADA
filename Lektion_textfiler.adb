with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
    
    procedure Pre_Add (F1 : in out File_Type
                       Filnamn : in String) is
    F2 : File_Type
    begin
        Open(F1, In_File, "inkop.txt");
        Create(F2, Out_File, "temp.txt");
        Copy(F1,F2);
        Close(F1);
        Close(F2);
        Open(F1, Out_File, "inkop.txt");
        Open(F2, In_File, "temp.txt");
        Copy(F2,F1);
        Delete(F2);
    end Pre_Add;

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

F1 : File_Type;

begin
   
    Pre_Add(F1, "Inköp.txt");
    Put(F1, "Mer grönsaker");
    Close(F1);

end Main;


  function Scramble_Non_Viking (Viking : in Integer) return Boolean is
      Sum_Viking : Edit_Viking(S);
      Sum : Integer := 1;

      type AtoG is
         array(Character range 'a' .. 'g');

   begin
      
      if not Check_If_Viking(S, I)then
         for I in 1 .. S'Length loop
            if I in array then

            end if;

      end if;   

   end Scramble_Non_Viking;

   --function Scramble_Non_Viking (S : in String) return String is
--   Sum_Viking : Edit_Viking(S);
--   Sum : Integer := 1;
--   Result : String(1..31);
--
--      type AtoG is
--         array(Character range 'a' .. 'g');
--
--   begin
--      if not Check_If_Viking(S, S'Length) then
--         for I in 1 .. S'Length loop
--            if I in AtoG then
--               Result(Sum) := S(I);
--               Sum := Sum + 1;
--            end if;
--         end loop;
--         return Result;
--      else
--         return S;
--      end if;
--   end Scramble_Non_Viking;
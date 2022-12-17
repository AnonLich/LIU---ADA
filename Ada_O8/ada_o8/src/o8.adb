


with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure HP is
    
    type VikingskaTal is 
        array (Character Range  'a' .. 'g') of Integer;

    VikingValue : constant VikingskaTal := (1, 7, 12, 42, 112, 365, 1024);


procedure isViking (Tal : in out String) is
    
begin
    Put("Hej");

end isViking;



procedure Read (F1 : in out File_Type;
                Tal : out String;
                File_name : in String) is
begin
   if Ada.Command_Line.Argument_Count = 1 then
      File_Name := Ada.Command_Line.Argument(1);
      Open(F1, In_File, File_Name);
      Index := 0;

      while not End_Of_File(File) loop
         Get_Line(F1, Tal);
         Index := Index + 1;
         if Tal'Length <= 20 then
            Original_Numbers(Index) := Input_String;
            Corrected_Numbers(Index) := Correct(Input_String);
            Values(Index) := Get_Value(Corrected_Numbers(Index));
         end if;
      end loop;
end Read;


F1 : File_Type;
Tal, Filnamn : String (1..31);
Index : Integer;
Original_Numbers : String_Array(1..100);
Corrected_Numbers : String_Array(1..100);

begin
    
Read(F1, Tal, File_name);
    



end HP;
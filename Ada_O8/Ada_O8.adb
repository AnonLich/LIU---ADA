with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure HP is
    
    type VikingskaTal is 
        array ('a' .. 'g') of Integer;

    VikingValue : constant Viking_Arr := (1, 7, 12, 42, 112, 365, 1024);


--procedure Read (F1, F2 : in out File_Type) is
    
--begin
--    Open(F1, In_File, "VIKINGSKA_TAL_1.txt");
--    Create(F2, Out_File, "CORRECTED_VIKING_NUMBERS.txt");
--
--    while not End_Of_Line(F1) loop
--        if VikingValue
--            Put("Hej");
--        end if;
--    end loop;

--end Read;



begin
    
    Put("Hej");



end HP;
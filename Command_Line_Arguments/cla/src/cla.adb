with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Cla is
J : Integer;
begin
J := Integer'Value(Argument(1));
   if Argument_Count <= 0 then
      Put("Inga argument angivna.");
   elsif Argument_Count < 2 or Argument_Count > 2 then
      Put("Fel antal argument angivna.");
   else
      for Count in 1..J loop
      
         Put(Argument(Count));
      end loop;

   end if;
end Cla;
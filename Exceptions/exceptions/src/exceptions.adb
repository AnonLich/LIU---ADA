with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;  use Ada.Exceptions;


procedure Test_Exceptions is
   --TYPES
   --type Date_Arr_Type is
   --  array(1 .. 5) of Date_Type;

   --PROCEDURES AND FUNCTIONS
   procedure Get_Value_Safe (Min, Max : in Integer;
                           Value : out Integer) is
   begin
      loop
         Put("Mata in värde (");
         Put(Min, Width => 0);
         Put(" - ");
         Put(Max, Width => 0);
         Put("): ");
         begin
            Get(Value);
            if Value < Min then
               Put("För litet värde.");
            elsif Value > Max then
               Put("För stort värde.");
            else
               exit;
            end if;
      exception
         when Data_Error => 
            Put("Fel datatyp.");
            Skip_Line;
      end;
      end loop;
   end Get_Value_Safe;
   --VARIABLES
   Min, Max, Value : Integer;
   S_1 : String(1 .. 5);
   S_2 : String(2 .. 7);
   S_3 : String(1 .. 10);
   --Dates : Date_Arr_Type;

begin
   Put_Line("Del 1:");
   Put("Mata in Min och Max: ");
   Get(Min);
   Get(Max);
   Get_Value_Safe(Min, Max, Value);
   Put("Du matade in heltalet ");
   Put(Value, Width => 0);
   Put('.');
   New_Line(2);
   --Skip_Line;
   --
   --Put_Line("Del 2:");
   --Put("Mata in en strÃ¤ng pÃ¥ exakt 5 tecken: ");
   --Get(S_1);
   --Put_Line("Du matade in " & S_1);
   --Put("Mata in en strÃ¤ng pÃ¥ exakt 6 tecken: ");
   --Get(S_2);
   --Put_Line("Du matade in " & S_2);
   --Put("Mata in en strÃ¤ng pÃ¥ exakt 10 tecken: ");
   --Get(S_3);
   --Put("Du matade in " & S_3);
   --New_Line(2);
   --Skip_Line;
   --
   --Put_Line("Del 3:");
   --for I in Dates'range loop
   --   Put("Mata in datum ");
   --   Put(I, Width => 0);
   --   Put(": ");
   --   Get(Dates(I));
   --end loop;
   --
   --for I in Dates'range loop
   --   Put("Datum nummer ");
   --   Put(I, Width => 0);
   --   Put(": ");
   --   Put(Dates(I));
   --   New_Line;
   --end loop;
end Test_Exceptions;
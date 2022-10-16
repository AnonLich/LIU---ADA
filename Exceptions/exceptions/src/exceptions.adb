with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Exceptions;  use Ada.Exceptions;

procedure Test_Exceptions is
   --Exceptions del 2
   --Length_Error : exception;

   --Exceptions del 3
   Format_Error : exception;
   Year_Error : exception;
   Month_Error : exception;
   Day_Error : exception;

   --TYPES
   type Date_Type is
      record
         Year,Month,Day : Integer;
      end record;

   type Date_Arr_Type is
     array(1 .. 5) of Date_Type;

   type Day_Check_Type is 
      array (1..12) of Integer;

   Arr_Check : constant Day_Check_Type := (31,28,31,30,31,30,31,31,30,31,30,31);

   --PROCEDURES AND FUNCTIONS
   --DEL 1
   --procedure Get_Value_Safe (Min, Max : in Integer;
   --                        Value : out Integer) is
   --begin
   --   loop
   --      Put("Mata in värde (");
   --      Put(Min, Width => 0);
   --      Put(" - ");
   --      Put(Max, Width => 0);
   --      Put("): ");
   --      begin
   --         Get(Value);
   --         if Value < Min then
   --            Put("För litet värde. ");
   --         elsif Value > Max then
   --            Put("För stort värde. ");
   --         else
   --            exit;
   --         end if;
   --   exception
   --      when Data_Error => 
   --         Put("Fel datatyp. ");
   --         Skip_Line;
   --      end;
   --   end loop;
   --end Get_Value_Safe;

   function Leap_Year (Year : in Integer) return Boolean is
      
   begin
      if ((Year mod 4 = 0 and (not (Year mod 100 = 0))) or Year mod 400 = 0) then
         return True;
      end if;
      return False;
   end Leap_Year;

   function Return_Days (Item : in Date_Type) return Integer is
   begin
      if Leap_Year(Item.Year) and Item.Month = 2 then
         return 29;
      else
         return Arr_Check(Item.Month);
      end if;
   end Return_Days;

   --DEL 2
   procedure Get (Item : out String) is
   Ch : Character;
   begin
      Get(Ch);
      while Ch = ' ' loop
         Get(Ch);
      end loop;
      begin 
         Item(Item'First) := Ch;
         for I in Item'First + 1..Item'Last loop
            Get(Item(I));
            if I < Item'Last and End_Of_Line then
               raise Length_Error;
            end if;
         end loop;
      end;
   end Get;

   --DEL 3
   procedure Get (Item : out Date_Type) is
      S : String(1..10);
      begin
         Get(S);
         for I in S'Range loop
            if S(5) /= '-' or S(8) /= '-' then
               raise Format_Error;
            end if;
            for I in 1..4 loop
               if S(I) not in '0'..'9' then
                  raise Format_Error;
               end if;
            end loop;
            for I in 6..7 loop
               if S(I) not in '0'..'9' then
                  raise Format_Error;
               end if;
            end loop;
            for I in 9..10 loop
               if S(I) not in '0'..'9' then
                  raise Format_Error;
               end if;
            end loop;
         end loop;
         Item.Year  := Integer'Value(S(1..4));
         Item.Month := Integer'Value(S(6..7));
         Item.Day   := Integer'Value(S(9..10));
         if Item.Year not in 1532..9000 then
            raise Year_Error;
         end if;
         if Item.Month not in 1..12 then
            raise Month_Error;
         end if;
         if Item.Day not in 1..Return_Days(Item) then
            raise Day_Error;
         end if;
         Skip_Line;
      end Get;

   procedure Put (Item : in Date_Type) is      
      type Date_Elements is array (1..3) of Integer;
      Date_E : Date_Elements;
   begin
      Date_E := (Item.Year,Item.Month,Item.Day);
      for I in Date_E'Range loop
         if I in 2..3 and Date_E(I) < 10 then
            Put("0");
         end if;
         Put(Date_E(I), Width => 0);
         if I /= Date_E'Last then
            Put("-");
         end if;
      end loop;
   end Put;

   Min, Max, Value : Integer;
   S_1 : String(1 .. 5);
   S_2 : String(2 .. 7);
   S_3 : String(1 .. 10);   
   Dates : Date_Arr_Type;

begin
   --Put_Line("Del 1:");
   --Put("Mata in Min och Max: ");
   --Get(Min);
   --Get(Max);
   --Get_Value_Safe(Min, Max, Value);
   --Put("Du matade in heltalet ");
   --Put(Value, Width => 0);
   --Put('.');
   --New_Line(2);
   --Skip_Line;
   
   --Put_Line("Del 2:");
   --Put("Mata in en sträng på exakt 5 tecken: ");
   --Get(S_1);
   --Put_Line("Du matade in " & S_1);
   --Put("Mata in en sträng på exakt 6 tecken: ");
   --Get(S_2);
   --Put_Line("Du matade in " & S_2);
   --Put("Mata in en sträng på exakt 10 tecken: ");
   --Get(S_3);
   --Put("Du matade in " & S_3);
   --New_Line(2);
   --Skip_Line;

   Put_Line("Del 3:");
   for I in Dates'range loop
      Put("Mata in datum ");
      Put(I, Width => 0);
      Put(": ");
      Get(Dates(I));
   end loop;
   
   for I in Dates'range loop
      Put("Datum nummer ");
      Put(I, Width => 0);
      Put(": ");
      Put(Dates(I));
      New_Line;
   end loop;
--exception
--   when Length_Error =>
--      Put("För få inmatade tecken:");
--      --Skip_Line;


end Test_Exceptions;
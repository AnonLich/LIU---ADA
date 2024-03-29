-- melpa661: Samarbetat med simgu167, Simeon Gustafsson, samma program
with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Test_Exceptions is
   --Exceptions
   Length_Error : exception;
   Format_Error : exception;
   Year_Error   : exception;
   Month_Error  : exception;
   Day_Error    : exception;

   --TYPES
   type Date_Type is
      record
         Year, Month, Day : Integer;
      end record;

   type Date_Arr_Type is
     array(1 .. 5) of Date_Type;

   type Day_Check_Type is 
     array (1..12) of Integer;

   Arr_Check : constant Day_Check_Type := (31,28,31,30,31,30,31,31,30,31,30,31);

   --PROCEDURES AND FUNCTIONS
   --DEL 1
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
            if Value    < Min then
               Put("För litet värde. ");
            elsif Value > Max then
               Put("För stort värde. ");
            else
               exit;
            end if;
	 exception
	    when Data_Error => 
	       Put("Fel datatyp. ");
	       Skip_Line;
         end;
      end loop;
   end Get_Value_Safe;

   procedure Del1 (Min, Max, Value : out Integer) is
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
      Skip_Line;
   end Del1;

   --DEL 2
   procedure Get (Item : out String) is
      Ch : Character;
   begin
      loop
         Get(Ch);
         if Ch /= ' ' then
            exit;
         end if;
      end loop;
      begin 
         Item(Item'First) := Ch;
         for I in Item'First + 1..Item'Last loop
               if End_of_Line then
                  raise Length_Error;
               end if;
            Get(Item(I));
         end loop;
      end;
   end Get;

   procedure Del2 (S_1,S_2,S_3 : out String) is
   begin
      Put_Line("Del 2:");
      Put("Mata in en sträng på exakt 5 tecken: ");
      Get(S_1);
      Put_Line("Du matade in " & S_1);
      Put("Mata in en sträng på exakt 6 tecken: ");
      Get(S_2);
      Put_Line("Du matade in " & S_2);
      Put("Mata in en sträng på exakt 10 tecken: ");
      Get(S_3);
      Put("Du matade in " & S_3);
      New_Line(2);
      Skip_Line;
   end Del2;

   --Funktioner för del3
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

   --DEL 3
   procedure Format_Error_Subprogram (S : in String) is
   begin
      for I in S'Range loop
         if I in 1..4 or I in 6..7 or I in 9..10 then
            if S(I) not in '0' .. '9' then
               raise Format_Error;
            end if;
         elsif S(I) /= '-' then
            raise Format_Error;
         end if;
      end loop;
   end Format_Error_Subprogram;

   procedure YMD (Item : in Date_Type) is
   begin
      if Item.Year not in 1532..9000 then
	      raise Year_Error;
      elsif Item.Month not in 1..12 then
	      raise Month_Error;
      elsif Item.Day not in 1..Return_Days(Item) then
	      raise Day_Error;
      end if;
   end YMD;

   procedure Get (Item : out Date_Type) is
      S : String(1..10);
   begin
      Get(S);
      Format_Error_Subprogram(S);
      Item.Year  := Integer'Value(S(1..4));
      Item.Month := Integer'Value(S(6..7));
      Item.Day   := Integer'Value(S(9..10));
      YMD(Item);
      exception
         when Length_Error =>
            raise Format_Error;
   end Get;

   procedure Check_10 (Item : in Integer) is
   begin
      if Item < 10 then
         Put(0, Width => 0);
      end if;
   end Check_10;

   procedure Put (Item : in Date_Type) is
   begin
   Put(Item.Year, Width => 0);
   Put('-');
   Check_10(Item.Month);
   Put(Item.Month, Width => 0);
   Put('-');
   Check_10(Item.Day);
   Put(Item.Day, Width => 0);
   end Put;

   procedure Get (Dates : out Date_Arr_Type) is --GET för del3
   begin
      Put_Line("Del 3:");
      for I in Dates'range loop
         loop
            begin
               Put("Mata in datum ");
               Put(I, Width => 0);
               Put(": ");
               Get(Dates(I));
               exit;
            exception
               when Format_Error =>
                  Put("Felaktigt format! ");
               when Year_Error =>
                  Put("Felaktigt år! ");
               when Month_Error =>
                  Put("Felaktig månad! ");
               when Day_Error =>
                  Put("Felaktig dag! ");
            end;
         end loop;
      end loop;
   end Get;

   procedure Put (Dates : in Date_Arr_Type) is --Put för del3
   begin
      for I in Dates'range loop
         Put("Datum nummer ");
         Put(I, Width => 0);
         Put(": ");
         Put(Dates(I));
         New_Line;
      end loop;
   end Put;

   Min, Max, Value : Integer;
   S_1 : String(1 .. 5);
   S_2 : String(2 .. 7);
   S_3 : String(1 .. 10);   
   Dates : Date_Arr_Type;

begin
   Del1(Min,Max,Value);
   Del2(S_1,S_2,S_3);
   Get(Dates);
   Put(Dates);
exception
   when Length_Error =>
      Put("För få inmatade tecken!");
end Test_Exceptions;
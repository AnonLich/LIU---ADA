with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
   --Exception
   Constraint_Error : exception;



   --Functions and Procedures
   procedure Reset (S : out String) is
   begin
      for I in S'range loop
         S(I) := (' ');
      end loop;
   end Reset;

   function Check_If_Viking (Line : in String;
                             Length : in Integer) return Boolean is
   begin
      for I in 1..Length loop
         if Line(I) not in 'a' .. 'g' then
            return False;
         end if;
      end loop;
      return True;
   end Check_If_Viking;

   function Edit_Viking(Line : in String) return Integer is
      Sum : Integer;
   begin
      Sum := 0;
      for I in Line'Range loop
         if Line(I) = 'a' then
            Sum := Sum + 1;
         elsif Line(I) = 'b' then
            Sum := Sum + 7;
         elsif Line(I) = 'c' then
            Sum := Sum + 12;
         elsif Line(I) = 'd' then
            Sum := Sum + 42;
         elsif Line(I) = 'e' then
            Sum := Sum + 112;
         elsif Line(I) = 'f' then
            Sum := Sum + 365;
         elsif Line(I) = 'g' then
            Sum := Sum + 1024;          
         end if;
      end loop;

      return Sum;
   end Edit_Viking;


   function Corrected_Numbers (Int : in Integer) return String is
      S : String(1..31);
      Sum : Natural;
   begin
      Sum := Int;
      Reset(S);

      for I in S'Range loop
         if (Sum >= 1024) then
            S(I) := 'g';
            Sum := Sum + 1024;
         elsif (Sum >= 365) then
            S(I) := 'f';
            Sum := Sum + 365;
         elsif (Sum >= 112) then
            S(I) := 'e';
            Sum := Sum + 112;
         elsif (Sum >= 42) then
            S(I) := 'd';
            Sum := Sum + 42;
         elsif (Sum >= 12) then
            S(I) := 'c';
            Sum := Sum + 12;
         elsif (Sum >= 7) then
            S(I) := 'b';
            Sum := Sum + 7;
         elsif (Sum >= 1) then
            S(I) := 'a';
            Sum := Sum + 1;
         else
            S(I) := ' ';
         end if;
      end loop;
      return S;
   end Corrected_Numbers;



   procedure Check_Result(Result : in Integer;
                          Biggest_Number : in out Integer) is
   begin
      if Biggest_Number < Result then
         Biggest_Number := Result;
      end if;
   end Check_Result;

   procedure Lines (F1 : in File_Type) is
   begin
      Put(F1, "=================================================================");
   end Lines;

   --Variable Declarations
   F, F1 : File_Type;
   Biggest_Integer : Integer := 0;
   C : Character;
   Checked_Viking : Boolean;
   I, Result : Integer;
   S, Read_String, Scrambled_String : String(1..20);
   Biggest_Viking : String(1..31);
   Corrected_String : String (1..31);


begin

   if Argument_Count /= 1 then
--      File_Name := Argument(1);
      raise Constraint_Error;
   end if;

   Create(F1, Out_File, "CORRECTED_VIKING_NUMBERS.TXT");
   Put_Line(F1, "|Inläst sträng |Korrigerat vikingskt tal |Värde |");
   New_Line(F1);
   Lines(F1);
   New_Line(F1);

   Open(F, In_File, Argument(1));
   while not End_Of_File(F) loop
      Get_Line(F, S, I);
      I := 1;
      while not End_Of_Line(F) loop
         Get(F, C);
         S(I) := C;
         I := I + 1;
      end loop;

      Read_String := S;
      Checked_Viking := Check_If_Viking(S, I);

      if Checked_Viking then
         Result := Edit_Viking(S);
         Check_Result(Result, Biggest_Integer);
         Corrected_String := Corrected_Numbers(Result);

        --Scrambled_String := Scramble_Non_Viking(S);

         Put(F1, "|");
         Put(F1, Read_String);
         Put(F1, "|");

         if Corrected_String(1..20) = Read_String(1..20) then
            Reset(Corrected_String);
         end if;

         Put(F1, Corrected_String);
         Put(F1, "|");
         Put(F1, Result, 10);
         Put(F1, "|");
         New_Line(F1);
      end if;
      Skip_Line(F);
   end loop;

   Lines(F1);
   Close(F);
   Close(F1);

   Put("Största som heltal: ");
   Put(Biggest_Integer,0);
   New_Line;
   Put("Största som vikingst tal: ");
   Biggest_Viking := Corrected_Numbers(Biggest_Integer);

   for I in Biggest_Viking'Range loop
      exit when Biggest_Viking(I) = ' ';
      Put(Biggest_Viking(I));
   end loop;

exception
   when Constraint_Error =>
   Put("Fel");

end Main;
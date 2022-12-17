-- melpa661: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

   type AtoG is 
     array (Character Range 'a'..'g') of Integer;
   
   AtoG1 : constant AtoG := (1, 7, 12, 42, 112, 365, 1024);
   
   End_Exception : exception;

   --Functions and Procedures
   function Reset (S : in String) return String is
      Str : String(S'Range);
   begin
      for I in S'Range loop
         Str(I) := (' ');
      end loop;
      return Str;
   end Reset;

   function Check_If_Viking (Line : in String) return Boolean is
   begin
      for I in 1..Line'Length loop
         if Line(I) not in 'a' .. 'g' then
            return False;
         end if;
      end loop;
      return True;
   end Check_If_Viking;

   function Corrected_Numbers (Str : in String) return Integer is
      Sum : Integer := 0;
      
   begin
      for I in Str'Range loop
         Sum := Sum + AtoG1(Str(I));
      end loop;
      return Sum;
   end Corrected_Numbers;

   function Edit_Viking (Value : in Integer) return String is
      Str : String(1..31);
      Index : Integer := 1;
      Sum : Integer := Value;
      
   begin
      for I in reverse AtoG'Range loop
         for J in 1..Sum / AtoG1(I) loop
            Str(Index) := I;
            Index := Index + 1;
            Sum := Sum - AtoG1(I);
         end loop;
      end loop;
      for I in Index..Str'Last loop
         Str(I) := ' '; 
      end loop;
      return Str;

   end Edit_Viking;

   procedure Lines (F1 : out File_Type) is
   begin
      Put(F1, "=================================================================");
   end Lines;

   procedure Create_Open_Files (F, F1 : out File_Type) is
   begin
      Create(F1, Out_File, "CORRECTED_VIKING_NUMBERS.TXT");
      Put_Line(F1, "|Inläst sträng       |Korrigerat vikingskt tal       |Värde     |");
      Lines(F1);
      New_Line(F1);
      Open(F, In_File, Argument(1));
   end Create_Open_Files;

   procedure Sum_Corrections (Corrected_Sum, Biggest_Integer : in out Integer;
                              I : in Integer;
                              Biggest_Viking, S : in out String) is
   begin
      Corrected_Sum := Corrected_Numbers(S(1..I));
      if Corrected_Sum > Biggest_Integer then
	 Biggest_Integer := Corrected_Sum;
	 Biggest_Viking := Edit_Viking(Corrected_Sum);
      end if;
   end Sum_Corrections;

   procedure Write_To_OutputFile (F1 : out File_Type;
                                  S : in out String;
                                  I, Corrected_Sum : in out Integer) is
   begin
      Put(F1, "|");
      Put(F1, S(1..I));
      for J in I .. S'Last -1 loop
	 Put(F1, " ");
      end loop;
      Put(F1, "|");

      if S(1..I) = Edit_Viking(Corrected_Sum)(1..I) then
	 Put(F1, Reset(Edit_Viking(Corrected_Sum)));
      else
	 Put(F1, Edit_Viking(Corrected_Sum));
      end if;

      Put(F1, "|");
      Put(F1, Corrected_Sum, Width => 10);
      Put(F1, "|");
      New_Line(F1);
   end Write_To_OutputFile;

   procedure Print_To_Console (Biggest_Integer : in Integer;
			       Biggest_Viking  : in String) is
   begin
      Put("Största som heltal: ");
      Put(Biggest_Integer,0);
      New_Line;
      Put("Största som vikingskt tal: ");
      for I in Biggest_Viking'Range loop
	 if Biggest_Viking(I) /= ' ' then
	    Put(Biggest_Viking(I));
	 end if;
      end loop;
   end Print_To_Console;
   
   procedure Wrong_CLA_Argument is
   begin
      Put_Line("felaktigt antal argument!");
      Put("Användning: ");
      Put(Command_Name);
      Put(" FILNAMN.TXT");
      raise End_Exception;
   end Wrong_CLA_Argument;
   
   --Variable Declarations
   F, F1 : File_Type;
   Biggest_Integer : Integer := 0;
   I : Integer;
   S : String(1..20);
   Biggest_Viking : String(1..31);
   Corrected_Sum : Integer;

begin
   if Argument_Count /= 1 then
      Wrong_CLA_Argument;
   end if;

   Create_Open_Files(F, F1);

   while not End_Of_File(F) loop
      if End_Of_Line(F) then
         Skip_Line(F);
      end if;
      Get_Line(F, S, I);

      if Check_If_Viking(S(1..I)) then
         Sum_Corrections(Corrected_Sum, Biggest_Integer, I, Biggest_Viking, S);
         Write_To_OutputFile(F1, S, I, Corrected_Sum);
      end if;
   end loop;
   Lines(F1);
   Close(F);
   Close(F1);

   Print_To_Console(Biggest_Integer, Biggest_Viking);
   
exception
   when End_Exception =>
      null;

end Main;

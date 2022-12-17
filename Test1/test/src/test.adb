with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Main is

   function Get_Value(Number : String) return Positive is
      Number_Map : array (Character) of Positive := 
                      ('a' => 1,
						     'b' => 7,
						     'c' => 12,
						     'd' => 42,
						     'e' => 112,
						     'f' => 365,
						     'g' => 1024);
      Current_Value : Positive := 0;
      Index : Positive;
   begin
      for Index in Number'Range loop
	 Current_Value := Current_Value + Number_Map(Number(Index));
      end loop;

      return Current_Value;
   end Get_Value;

   function Correct(Number : String) return String is
      Number_Order : array (1 .. 7) of Character := ('g', 'f', 'e', 'd', 'c', 'b', 'a');
      Index : Positive;
      Order_Index : Positive;
   begin
      for Index in Number'Range loop
	      for Order_Index in Number_Order'Range loop
	         if Number(Index) = Number_Order(Order_Index) then
	            Number(Index) := Number_Order(Order_Index + 1);
	            exit;
	         end if;
	      end loop;
      end loop;

      return Number;
   end Correct;

   procedure Write_Viking_Numbers_To_File(Original_Number, Corrected_Number : String; Value : Integer) is
      File : File_Type;
      Output_String : String;
   begin
      Open(File, Out_File, "CORRECTED_VIKING_NUMBERS.TXT");
      Output_String := Original_Number;
      if Output_String'Length < 20 then
	 Output_String := Output_String & (20 - Output_String'Length) * ' ';
      end if;
      Output_String := Output_String & '|';

      if Corrected_Number /= Original_Number then
	      Output_String := Output_String & Corrected_Number;
      end if;
      if Output_String'Length < 51 then
	      Output_String := Output_String & (51 - Output_String'Length) * ' ';
      end if;
      Output_String := Output_String & '|';

      Output_String := Output_String & Integer'Image(Value);
      Put_Line(File, Output_String);
      Close(File);
   end Write_Viking_Numbers_To_File;

   File_Name : String;
   File : File_Type;
   Input_String : String;
   Original_Number : String;
   Corrected_Number : String;
   Value : Integer;
   Largest_Value : Integer;
   Largest_Original_Number : String;
   Largest_Corrected_Number : String;
   End_Of_File : Boolean;
begin
   if Ada.Command_Line.Argument_Count = 1 then
      File_Name := Ada.Command_Line.Argument(1);
      Open(File, In_File, File_Name);
      End_Of_File := False;

      while not End_Of_File loop
	 Get_Line(File, Input_String);
	 if Input_String'Length <= 20 then
	    Original_Number := Input_String;
	    Corrected_Number := Correct(Input_String);
	    Value := Get_Value(Corrected_Number);
	    Write_Viking_Numbers_To_File(Original_Number, Corrected_Number, Value);
	    if Value > Largest_Value then
	       Largest_Value := Value;
	       Largest_Original_Number := Original_Number;
	       Largest_Corrected_Number := Corrected_Number;
	    end if;
	 else
	    End_Of_File := True;
	 end if;

      end loop;

      Close(File);

      if Largest_Original_Number /= Largest_Corrected_Number then
	 Put_Line("The number " & Largest_Original_Number & " was corrected to " & Largest_Corrected_Number & " with a value of " & Integer'Image(Largest_Value) & ".");
      else
	 Put_Line("The largest number is " & Largest_Original_Number & " with a value of " & Integer'Image(Largest_Value) & ".");
      end if;
   end if;

end Main;

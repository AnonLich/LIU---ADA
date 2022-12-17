with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Viking_Numbers is

   -- Declare a constant for the maximum line length
   Line_Length : constant Natural := 20;

   -- Declare a type to represent a Viking number
   type Viking_Number is
      record
         Original : Unbounded_String(1..Line_Length);  -- The original string from the file
         Corrected : Unbounded_String;                 -- The corrected Viking number, if needed
         Value : Positive;                             -- The integer value of the Viking number
      end record;

   -- Declare a function to convert a Viking number string to an integer value
   function To_Value(S : Unbounded_String) return Positive is
      N : Positive := 0;
      C : Character;
      S1, S2 : Integer;
      Iter : Ada.Strings.Unbounded.Iterators.Reverse_Iterator;

   begin
      -- Iterate over the characters in the string in reverse order
      Iter := Ada.Strings.Unbounded.Iterators.Get_Reverse_Iterator(S);
      while Iter /= Ada.Strings.Unbounded.Iterators.End_Of_Iteration loop
         C := Iter.Item;
         Iter.Next;

         -- If the character is a valid Viking number sign, add its value to N
         case C is
            when 'a' => N := N + 1;
            when 'b' => N := N + 7;
            when 'c' => N := N + 12;
            when 'd' => N := N + 42;
            when 'e' => N := N + 112;
            when 'f' => N := N + 365;
            when 'g' => N := N + 1024;
         end case;
      end loop;
      return N;
   end To_Value;

   -- Declare a function to convert an integer value to a Viking number string
   function To_String(N : Positive) return Unbounded_String is
      Result : Unbounded_String := "";
   begin
      -- While N is greater than 0, add the largest possible Viking number sign to the result
      while N > 0 loop
         if N >= 1024 then
            Result := Result & "g";
            N := N - 1024;
         elsif N >= 365 then
            Result := Result & "f";
            N := N - 365;
         elsif N >= 112 then
            Result := Result & "e";
            N := N - 112;
         elsif N >= 42 then
            Result := Result & "d";
            N := N - 42;
         elsif N >= 12 then
            Result := Result & "c";
            N := N - 12;
         elsif N >= 7 then
            Result := Result & "b";
            N := N - 7;
         else
            Result := Result & "a";
            N := N - 1;
         end if;
      end loop;

      -- Return the result in reverse order, as required by the Viking numbering system
      return Result;
   end To_String;

   -- Declare a function to validate and correct a Viking number
   function Validate(S : Unbounded_String) return Viking_Number is
      Result : Viking_Number;
   begin
      -- Initialize the result with the original string
      Result.Original := S;
      Result.Corrected := "";
      Result.Value := 0;

      -- Iterate over the characters in the string
      for C of S loop
         -- If the character is a valid Viking number sign, add its value to the result
         case C is
            when 'a' => Result.Value := Result.Value + 1;
            when 'b' => Result.Value := Result.Value + 7;
            when 'c' => Result.Value := Result.Value + 12;
            when 'd' => Result.Value := Result.Value + 42;
            when 'e' => Result.Value := Result.Value + 112;
            when 'f' => Result.Value := Result.Value + 365;
            when 'g' => Result.Value := Result.Value + 1024;

            -- If the character is not a valid Viking number sign, return an empty result
            when others => return (others => <>);
         end case;
      end loop;

      -- If the result is valid, calculate the corrected Viking number, if needed
      if Result.Value > 0 then
         Result.Corrected := To_String(Result.Value);
         if Result.Corrected /= S then
            Result.Corrected := Result.Corrected & " (" & To_Unbounded_String(S) & ")";
         end if;
      end if;

      return Result;
   end Validate;

   -- Declare variables for the command line arguments and the input and output files
   Args : Command_Line_Arguments;
   In_File : File_Type;
   Out_File : File_Type;

   -- Declare a variable to hold the largest Viking number
--   Max : Viking_Number;
--   Max.Value := 0;

   Line : Unbounded_String(1..Line_Length);
   Number : Viking_Number;

begin
   -- Open the input and output files
   Args := Command_Line_Arguments;
   if Args.Length /= 2 then
      Put_Line("Error: Incorrect number of command line arguments.");
      Put_Line("Usage: Viking_Numbers [INPUT_FILE]");
      return;
   end if;
   Open(File => In_File, Mode => In_File, Name => Args.Argument(2));
   Open(File => Out_File, Mode => Out_File, Name => "CORRECTED_VIKING_NUMBERS.TXT");

   -- Read each line from the input file and validate and correct the Viking number

      loop
         Read_Line(File => In_File, Item => Line);
         exit when End_Of_File(In_File);

         -- Validate and correct the Viking number
         Number := Validate(Line);

         -- If the result is valid, update the maximum Viking number and write it to the output file
         if Number.Value > 0 then
            if Number.Value > Max.Value then
               Max := Number;
            end if;
            Put(File => Out_File, Item => Number.Original & "|" & Number.Corrected & "|" & Integer'Image(Number.Value));
         end if;
      end loop;


   -- Close the input and output files
   Close(In_File);
   Close(Out_File);

   -- Print the largest Viking number to the screen
   Put_Line("Largest Viking number: " & Max.Original & " = " & Max.Corrected & " = " & Integer'Image(Max.Value));
end Viking_Numbers;

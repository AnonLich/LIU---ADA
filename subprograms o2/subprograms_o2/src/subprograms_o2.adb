--Ingen samarbetspartner på den här uppgiften
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Subprograms_O2 is

   --Funktioner och underprogram
   function "-" (Left : in Integer;    
		 Right : in Float) return Float is
   begin
      return Float(Left) - Right;
   end "-";

   procedure Check_S (S : in out String;
		      B : out Boolean) is
   begin
      if S(S'Last) = 's' then
         B := True;
      else
         B := False;
         S(S'Last) := 's';
      end if;
   end Check_S;

   function Check_Capital_S (C : in Character) return Boolean is
   begin
      return C = 's' or C = 'S';
   end Check_Capital_S;

   --Deklarering av variabler
   I : Integer;
   F : Float;
   S : String(1..5);
   C : Character;
   B : Boolean;

begin
   --Deluppgift 1-- --Räkna ut differens--
   Put("Mata in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Put("Differensen mellan dem är ");
   Put(I - F, Fore => 1, Aft => 2, Exp => 0);
   New_Line(2);

   --Deluppgift 2-- --Kolla om sista strängen är "s", om inte ändra till "s"--
   Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
   Get(S);
   Check_S(S,B);
   Put("Ordet " & S & " var troligtvis ");
   if B = False then
      Put("inte ");
   end if;
   Put("i plural från början");
   New_Line(2);

   --Delupggift 3-- --Kolla om tecknet vid inmatning är stora eller lilla s--
   Put("Mata in ett tecken: ");
   Get(C);
   Put("Tecknet var ");
   if not Check_Capital_S(C) then
      Put("inte ");
   end if;
   Put("sant");
end Subprograms_O2;
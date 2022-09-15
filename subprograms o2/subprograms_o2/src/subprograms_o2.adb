with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Subprograms_O2 is

   function "-" (Left : in Integer;    
                  Right : in Float) return Float is
   Res : Float;
   begin
      Res := Float(Left) - Right;
      return Res;
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
   Temp_Bool : Boolean;
   begin
      if C = 's' or C = 'S' then
         Temp_Bool := True;
      else
         Temp_Bool := False;
      end if;
      return Temp_Bool;
   end Check_Capital_S;

I : Integer;
F, Calc_Diff : Float;
S : String(1..5);
C : Character;
B : Boolean;

begin
   --Deluppgift 1-- --Räkna ut differans--
   Put("Mata in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Put("Differensen mellan dem är ");
   Calc_Diff := "-"(I,F);
   Put(Calc_Diff, Fore => 1, Aft => 2, Exp => 0);
   New_Line(2);

   --Deluppgift 2-- --Kolla om sista strängen är "s", om inte ändra till "s"--
   Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
   Get(S);
   Check_S(S,B);

   if B = True then
      Put("Ordet " & S & " var troligtvis i plural från början");
   elsif B = False then
      Put("Ordet " & S & " var troligtvis inte i plural från början");
   end if;
   New_Line(2);

   --Delupggift 3-- --Kolla om tecknet vid inmatning är stora eller lilla s--
   Put("Mata in ett tecken: ");
   Get(C);
   if Check_Capital_S(C) then
      Put("Tecknet var sant");
   else
      Put("Tecknet var inte sant");
   end if;
end Subprograms_O2;
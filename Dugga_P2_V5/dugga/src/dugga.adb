with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO; 
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
procedure Dugga is
   --Del 1
   function "*" (Left  : in String;
		 Right : in Float) return Float is
   begin
      return Float(Float'Value(Left) * Right);
   end "*";

   procedure Del2 (F : in Float;
		   K : out Float) is
   begin
      K := F - 32.7;
      K := Float'Rounding(K);
   end Del2;

   function Del3 (I : in Integer) return Float is
   begin
      return Float(I) - 32.7;
   end Del3;

   S    : String(1..3);
   I    : Integer;
   F, K : Float;

begin
   Put("Mata in ett flyttal: ");
   Get(F);
   Put("Mata in en sträng: ");
   Get(S);
   Put("Den beräknade produkten av " );
   Put(F, Fore => 0, Aft => 0, Exp => 0);
   Put(" och ");
   Put(S);
   Put(" blir ");
   Put(S * F, Fore => 0, Aft => 0, Exp => 0);
   Skip_Line;
   New_Line(2);

   Put("Mata in ett flyttal: ");
   Get(F);
   Del2(F,K);
   Put("differensen mellan ");
   Put(F, Fore => 0, Aft => 0, Exp => 0);
   Put(" och ");
   Put("32.7 blir ");
   Put(K, Fore => 0, Aft => 0, Exp => 0);
   Skip_Line;
   New_Line(2);
   
   Put("Mata in ett heltal: ");
   Get(I);
   Put("differensen mellan ");
   Put(I, Width => 0);
   Put(" och");
   Put(" 32.7 blir ");
   Put(Del3(I), Fore => 0, Aft => 0, Exp => 0);
end Dugga;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use  Ada.Numerics.Elementary_Functions;
procedure Dugga_P2 is

   procedure Calculate_Area_Triangle (S : in Character;
                           A : out Float) is    --GLÖM EJ CHARACTER
   begin
   A := Float'Value(S * (S * Sqrt(3.0) / 2.0)) / 2.0;
   end Calculate_Area_Triangle;

   function Calculate_Area_Square (S : in Float) return Integer is
   begin
   return Integer(Float'Rounding(S*S));
   end Calculate_Area_Square;

   function "+" (Left : in String;
                  Right : in Integer) return Integer is
   SI : Integer := Integer'Value(Left);
   begin
      return (SI) + Right;
   end "+";

   S : Character;
   A : Float;
   Str : String(1 .. 3);
   I : Integer;

begin
   Put("Mata in längden: ");
   Get(S);
   Calculate_Area_Triangle(S,A);
   Put("Den beräknade arean blev: ");
   Put(A, Fore => 1, Aft => 1, Exp => 0);
   New_Line;

   Put("Mata in längden: ");
   Get(S);
   Put(Calculate_Area_Square(S));

   Put("Mata in ett heltal: ");
   Get(I);
   Put("Mata in en sträng: ");
   Get(Str);
   Put("Den beräknade summan av ");
   Put(I);
   Put(" och ");
   Put(Str);
   Put(" Blir ");
   Put(Str + I);





end Dugga_P2;

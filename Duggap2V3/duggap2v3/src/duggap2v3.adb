with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Fixed;  use Ada.Strings.Fixed;

procedure Duggap2v3 is

   function Del1 (N : in Integer;
                  X : in String) return String is
   begin
      return (N * X);
   end Del1;

   procedure Del2 (N : out Integer;
		   F : out Float;
		   G : out Integer) is
   begin
      Put("Mata in ett heltal: ");
      Get(N);
      Put("Mata in ett flyttal: ");
      Get(F);
      Put("Du matade in heltalet: ");
      Put(N, Width => 0);
      Put(" och flyttalet: ");
      Put(F,0,0,0);
      Put(" och summan blev ");
      G := Integer(Float'Ceiling(F)) + N;
   end Del2;

   function "-" (Left : in String;
		 Right : in Integer) return Float is
      SI : Float := Float(Integer'Value(Left));
      RI : Float := Float(Right);
   begin
      return (SI - RI);
   end "-";

   N, G, L : Integer;
   F : Float;
   X : String(1 .. 3);

begin
   Put("Mata in ett heltal: ");
   Get(N);
   Skip_Line;
   Put("Mata in en sträng: ");
   Get_Line(X, L);
   Put("Den resulterande strängen blir: ");
   New_Line;
   Put("""");
   Put(Del1(N, X(1 .. L)));
   Put("""");
   Skip_Line;
   New_Line(2);

   Del2(N,F,G);
   Put(G);
   Skip_Line;
   New_Line(2);

   Put("Mata in en sträng: ");
   Get(X);
   Put("Mata in ett heltal: ");
   Get(N);
   Put("Den beräknade differensen mellan ");
   Put(X);
   Put(" och ");
   Put(N, Width => 0);
   Put(" blir ");
   Put(X - N, 0, 0, 0);
end Duggap2v3;
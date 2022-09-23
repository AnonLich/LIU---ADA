with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use  Ada.Numerics.Elementary_Functions;

procedure program is

   function Calculate_Hypothenuse (A, B : in Integer) return float is
   begin
      return Float(Sqrt(Float(A**2 + B**2)));
   end Calculate_Hypothenuse;

   procedure Hypotenuse_Program is
      A : Integer;
      B : Integer;
   begin
      Put("Mata in kateternas längder: ");
      Get(A);
      Get(B);
      Put("Hypotenusan är ");
      Put(Calculate_Hypothenuse(A, B), 0,2,0);
      New_Line(2);
   end Hypotenuse_Program;

   procedure Calculate_Angles (Hc, Sa : in Float; 
                              Va, Vb, Vc : out Float) is
   begin
         Vc := 90.0;
         Vb := ((Arccos(Sa / Hc)) / Pi * 180.0);
         Va := ((Arcsin(Sa / Hc)) / Pi * 180.0);
   end Calculate_Angles;

   procedure Angle_Program is
   Hc, Sa, Va, Vb, Vc : Float;
      begin
         Put("Mata in hypotenusans längd: ");
         Get(Hc);
         Put("Mata in vertikala katetens längd: ");
         Get(Sa);
         Calculate_Angles(Hc,Sa,Va,Vb,Vc);
         Put("Va: ");
         Put(Va, Fore => 1, Aft => 1, Exp => 0);
         Put(" grader");
         New_Line;
         Put("Vb: ");
         Put(Vb, Fore => 1, Aft => 1, Exp => 0);
         Put(" grader");
         New_Line;
         Put("Vc: ");
         Put(Vc, Fore => 1, Aft => 1, Exp => 0);
         Put(" grader");
         New_Line(2);
   end Angle_Program;

   function Calculate_Factorial (N : in Integer) return Integer is
   Fak : Integer := 1;
   begin
      for I in 1..N loop
         Fak := Fak * I;
      end loop;
      return Fak;
   end Calculate_Factorial;

   procedure Factorial_Program is
   N,N1 : Integer;
   
   begin
      Put("Mata in N: ");
      Get(N);
      Put(N, Width => 0);
      Put( "-fakultet = ");
      N1 := (Calculate_Factorial(N));
      Put(N1, Width => 0);
      New_Line(2);
   end Factorial_Program;

   procedure Menu_Selection (Selection : out Integer) is
   begin
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avsluta programmet");
      loop
         Put("Val: ");
         Get(Selection);
            if Selection < 1 then
               Put_Line("Felaktigt val!");
            elsif Selection > 4 then
               Put_Line("Felaktigt val!");
            else
               exit;
            end if;
         end loop;
      end Menu_Selection;
   
   Selection : Integer;

begin
   Put_Line("Välkommen till miniräknaren!");
   loop
      Menu_Selection(Selection);

      if Selection = 1 then
         Hypotenuse_Program;
      elsif Selection = 2 then
         Angle_Program;
      elsif Selection = 3 then
         Factorial_Program;
      elsif Selection = 4 then
         Put("Ha en bra dag!");
         exit;
      end if;
   end loop;

end program;

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
      Put("Hypotenusan är: ");
      Put(Calculate_Hypothenuse(A, B), 0,2,0);
      New_Line;
   end Hypotenuse_Program;

   procedure Calculate_Angles (Hc, Sa : in Float; 
                              Va, Vb, Vc : out Float) is
   begin
         Vc := 90.0;
         Va := Arccos(Sa / Hc);
         Vb := 180.0 / Vc - Va;
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
         Put(Va, Fore => 2, Aft => 1, Exp => 0);
         Put(" grader");
         New_Line;
         Put("Vb: ");
         Put(Vb, Fore => 2, Aft => 1, Exp => 0);
         Put(" grader");
         New_Line;
         Put("Vc: ");
         Put(Vc, Fore => 2, Aft => 1, Exp => 0);
         Put(" grader");
   end Angle_Program;

   procedure Menu_Selection (Selection : out Integer) is
   begin
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avlsuta programmet");
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
   A : Integer;
   B : Integer;
   Hypothenuse : Float;

begin
   Put_Line("Välkommen till miniräknaren");
   Menu_Selection(Selection);

   if Selection = 1 then
      Hypotenuse_Program;
   elsif Selection = 2 then
      Angle_Program;
  end if;
      

end program;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Ada_O1_2 is
   Forsta_Pris : Float;
   Sista_Pris : Float;
   Momsprocent : Float;
   Steg : Float;
   Moms : Float;
   Pris_Med_Moms : Float;
   Stegraknare : Float;
   Iterationer : Float;

begin
   Put("Första pris: ");
   Get(Forsta_Pris);
   while Forsta_Pris < 0.0 loop
      Skip_Line;
      Put("Felaktigt värde!");
      New_Line;
      Put("Första pris: ");
      Get(Forsta_Pris);
   end loop;

   Put("Sista pris: ");
   Get(Sista_Pris);
   while Sista_Pris < 0.0 or Sista_Pris < Forsta_Pris loop
      Skip_Line;
      Put("Felaktigt värde!");
      New_Line;
      Put("Sista pris: ");
      Get(Sista_Pris);
   end loop;

   Put("Steg: ");
   Get(Steg);
   while Steg < 0.0 loop
      Skip_Line;
      Put("Felaktigt värde!");
      New_Line;
      Put("Steg: ");
      Get(Steg);
   end loop;

   Put("Momsprocent: ");
   Get(Momsprocent);   
   New_Line;

   Put_Line("============ Momstabell ============");
   Put("Pris utan moms  ");
   Put("Moms   ");
   Put("Pris med moms   ");
   New_Line;

   Momsprocent := Momsprocent / 100.0 ;
   Moms := Momsprocent * Forsta_Pris;
   Pris_Med_Moms := Forsta_Pris + Moms;

   while (Stegraknare <= Sista_Pris) loop
      Stegraknare := Forsta_Pris + Steg;
      
      Put(Forsta_Pris, Fore => 6, Aft => 2, Exp => 0);
      Forsta_Pris := Forsta_Pris + Steg;

      Put(Moms, Fore => 8, Aft => 2, Exp => 0);
      Moms := Momsprocent * Forsta_Pris;

      Put(Pris_Med_Moms, Fore => 9, Aft => 2, Exp => 0);
      Pris_Med_Moms := Forsta_Pris + Moms;
      New_Line;

      Forsta_Pris := float' rounding(Forsta_Pris * 100.0 ) * 0.01;
      Sista_Pris := float' rounding(Sista_Pris * 100.0) * 0.01;
   end loop;

end Ada_O1_2;
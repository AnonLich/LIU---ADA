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
   Stegraknare : Integer;
   Iterationer : Float;

begin
   loop
      Put("Första pris: ");
      Get(Forsta_Pris);
      if Forsta_Pris < 0.0 then
         Put_Line("Felaktigt värde!");
      else
         exit;
      end if;
   end loop;

   loop
      Put("Sista pris: ");
      Get(Sista_Pris);
      if Sista_Pris < 0.0 or Sista_Pris < Forsta_Pris then
         Put_Line("Felaktigt värde!");
      else
         exit;
      end if;
   end loop;

   loop
      Put("Steg: ");
      Get(Steg);
      if Steg <= 0.0 then
         Put_Line("Felaktigt värde!");
      else
         exit;
      end if;
   end loop;

   loop
      Put("Momsprocent: ");
      Get(Momsprocent);
      if Momsprocent < 0.0 or Momsprocent > 100.0 then
         Put_Line("Felaktigt värde!");
      else
         exit;
      end if;
      end loop;
   New_Line;

   Put_Line("============ Momstabell ============");
   Put_Line("Pris utan moms  Moms   Pris med moms");

   Momsprocent := Momsprocent / 100.0;
   Moms := Momsprocent * Forsta_Pris;
   Pris_Med_Moms := Forsta_Pris + Moms;

   Stegraknare := Integer (Float' floor ((Sista_Pris - Forsta_Pris) / Steg));

   for I in 0..Stegraknare loop

      Put(Forsta_Pris, Fore => 6, Aft => 2, Exp => 0);
      Forsta_Pris := Forsta_Pris + Steg;

      Put(Moms, Fore => 8, Aft => 2, Exp => 0);
      Moms := Momsprocent * Forsta_Pris;

      Put(Pris_Med_Moms, Fore => 9, Aft => 2, Exp => 0);
      Pris_Med_Moms := Forsta_Pris + Moms;
      New_Line;
   end loop;

end Ada_O1_2;
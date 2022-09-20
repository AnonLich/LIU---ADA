with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;


procedure Poster_Ovning_1 is

   type Shoe_Type is
      record
         Modellnummer : Integer;
         Skomodell : String(1..10);
         Skostorlek : Float;
   end record;

   procedure Mata_In (Modellnummer : out Integer;
                     Skomodell : out String;
                     Skostorlek : out Float) is
  
   begin
      Put("Mata in modellnummer: ");
      Get(Modellnummer);
      Put("Mata in skomodell: ");
      Get(Skomodell);
      Put("Mata in skostrolek: ");
      Get(Skostorlek);
   end Mata_In;
   S1 : Shoe_Type;

begin
   
   Mata_In(S1.Modellnummer,S1.Skomodell,S1.Skostorlek);
   Put(S1.Modellnummer);
   Put(S1.Skomodell);
   Put(S1.Skostorlek);



end Poster_Ovning_1;
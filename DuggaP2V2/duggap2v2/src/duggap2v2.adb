with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
procedure Duggap2v4 is
   --Del1
   function Del1 (S : in String) return Integer is
   begin
      return
        Integer
          (Float'Value
             (S)); --NOTE - Gör först om till en float då vi i körexempel 3 matar in strängen "0.0", annars får vi exception error
   end Del1;

   --Del2
   procedure Del2 (I : out Integer; F : out Float; K : out Float) is
   begin
      Put ("Mata in ett heltal: ");
      Get (I);
      Put ("Mata in ett flyttal: ");
      Get (F);
      Put ("Du matade in heltalet: ");
      Put (I, Width => 0);
      Put (" och flyttalet: ");
      Put (F, Fore => 0, Aft => 0, Exp => 0);
      Put (" och kvoten blev ");
      K := Float (Float'Floor (Float (I) / F));
   end Del2;

   --Del3
   function "*" (Left : in String; Right : in Float) return Integer is
   begin
      return Integer (Float (Float'Rounding (Float'Value (Left) * Right)));
   end "*";

   S    : String (1 .. 3);
   I    : Integer;
   F, K : Float;

begin
   --Del 1
   Put ("Mata in en sträng: ");
   Get (S);
   Put ("Om man omvandlar strängen " & S);
   Put (" till ett heltal blir det ");
   Put (Del1 (S), Width => 0);
   New_Line (2);

   --Del2
   Del2 (I, F, K);
   Put (K);
   Skip_Line;
   New_Line (2);

   --Del3
   Put ("Mata in en sträng: ");
   Get (S);
   Put ("Mata in ett flyttal: ");
   Get (F);
   Put ("Den beräknade produkten av " & S);
   Put (" och ");
   Put (F, Fore => 0, Aft => 0, Exp => 0);
   Put (" blir ");
   Put (S * F, Width => 0);
end Duggap2v4;

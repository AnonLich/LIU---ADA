with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Program is
   function "/" (Left : in String; Right : in Integer) return Integer is
   begin
      return
        Integer (Float (Float'Floor (Float'Value (Left) / Float (Right))));
   end "/";

   function Del2 (F : in Float) return Integer is
   begin
      return Integer (F * F);
   end Del2;

   procedure Del3 (S : out String; F, Sum : out Float) is
   begin
      Put ("Mata in en sträng med exakt 3 tecken: ");
      Get (S);
      Put ("Mata in ett flyttal: ");
      Get (F);
      Sum :=  (Float'Floor(Float'Value (S) * F));
   end Del3;

   S      : String (1 .. 3);
   F, Sum : Float;
   I      : Integer;

begin
   Put ("Mata in en sträng: ");
   Get (S);
   Put ("Mata in ett heltal: ");
   Get (I);
   Put ("Den beräknade kvoten mellan " & S);
   Put (" och ");
   Put (I, Width => 0);
   Put (" blir ");
   Put (S / I, Width => 0);
   New_Line (2);

   Put ("Mata in längden: ");
   Get (F);
   Put ("Den beräknade arean blev: ");
   Put (Del2 (F), Width => 0);

   New_Line (2);
   Del3 (S, F, Sum);
   Put ("Du matade in strängen: ");
   Put (S);
   Put (" och flyttalet: ");
   Put (F, 0, 0, 0);
   Put (" och produkten blev ");
   Put (Sum);

end Program;

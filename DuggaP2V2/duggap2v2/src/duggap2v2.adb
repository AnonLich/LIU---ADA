with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Duggap2v2 is


--DEL1 PROCEDUR
   function Kalkylera_Area (Str : in String) return Float is
      StrFloat : Float := Float'Value(Str);
   begin
      return Float'Rounding(StrFloat * StrFloat * 3.14);
   end Kalkylera_Area;

--DEL2         FUNCTION
   procedure Kalkykera_Kvot (Tecken : in Character;
                              Flt : out Float) is
   begin
      Flt := Float'Floor(Float'Value((1 => Tecken)) / 32.7);
      Put(Flt, Fore => 0, Aft => 0, Exp => 0);
   end Kalkykera_Kvot;

--DEL3      OPERATOR
function "/" (Left : in Character;
               Right : in String) return Integer is
   CI : Integer;
   SI : Integer := Integer'Value(Right);
   begin
      SI := Integer(Float'Floor(Float'value(Right)));
      CI := Integer(Float'Value((1 => Left)));
      return (CI / SI) ;
   end "/";

--VARIABELDEKLARATION

   Str : String(1..3);
   Tecken : Character;
   Flt : Float;
   Length : Integer;

begin
--HUVUDPROGRAM

   Put("Mata in längden: ");
   Get_Line(Str, Length);
   Put("Den beräknade arean blev: ");
   Put(Kalkylera_Area(Str(1..Length)), Fore => 1, Aft => 1, Exp => 0);
   New_Line(2);

   Put("Mata in ett tecken: ");
   Get(Tecken);
   Put("kvoten mellan " & Tecken & " och 32.7 blir ");
   Kalkykera_Kvot(Tecken, Flt);
   New_Line(2);

   Put("Mata in ett tecken: ");
   Get(Tecken);
   Put("Mata in en sträng: ");
   Get(Str);
   Put("Den beräknade kvoten mellan ");
   Put(Tecken);
   Put(" och ");
   Put(Str);
   Put(" blir ");
   Put(Tecken / Str);

end Duggap2v2;

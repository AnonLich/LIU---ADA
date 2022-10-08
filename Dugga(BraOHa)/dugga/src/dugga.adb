with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Dugga is

   function Lika (Str : in String;
                  Int : in Integer) return Boolean is

   begin
      if Integer'Value(Str) = Int then
         return True;
      else
         return False;
      end if;
   end Lika;

   function ReturnFloat (Tecken : in Character) return Float is         --GÖR OM EN CHARACTER TILL FLOAT
   begin
      return Integer(Float'Floor(Float'Value((1 => Tecken))));
   end ReturnFloat;

Str : String(1..5);
Int : Integer;
Tecken : Character;

begin
Put("Mata in en sträng på exakt 5 tecken och ett heltal: ");
Get(Str);
Get(Int);
Put("Innehållet i dessa är ");
if Lika(Str, Int) = False then
   Put("inte lika");
else
   Put("lika");
end if;
New_Line;

Put("Mata in ett tecken: ");
Get(Tecken);
Put(ReturnFloat(Tecken), Fore => 1, Aft => 0, Exp => 0);


end Dugga;

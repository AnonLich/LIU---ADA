with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
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

Str : String(1..5);
Int : Integer;

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


end Dugga;

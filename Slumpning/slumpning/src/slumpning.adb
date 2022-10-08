-- melpa661: Arbetat enskilt
with ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ada.numerics.discrete_random;

procedure program is
   type randRange is new Integer range 1..6;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;

   subtype crRange is Character range 'A' .. 'Z';
   package Rand_Cr is new Ada.Numerics.discrete_random(crRange);
   use crRange;

   Number_Of_Integers : Integer;   
   Number_Of_Characters : Integer;
   G : Generator;
begin
   Reset(G);
   Put("Mata in antalet heltal som ska slumpas: ");
   Get(Number_Of_Integers);
   Put(Number_Of_Integers, Width => 0);
   if Number_Of_Integers = 1 then
      Put(" slumpat");
   else
      Put(" slumpade");
   end if;
   Put(" heltal:");
   for I in 1 .. Number_Of_Integers loop
      Put(randRange'Image(Random(G)));
   end loop;

   Reset(G);
   for I in 1 .. Random(G) loop
      
      Put(" ");
   end loop;
   
end program;
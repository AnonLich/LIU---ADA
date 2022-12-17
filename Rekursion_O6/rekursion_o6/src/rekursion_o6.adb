-- melpa661: Arbetat enskilt
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Rekursion_O6 is
   function Fib (N : in Integer) return Integer is
   begin
      if n <= 1 then
         return n;
      end if;
      return (Fib(N-1) + Fib(N - 2));
   end Fib;

   function HH (N : in Integer) return Integer is
   begin
      if N = 1 then
         return 0;
      elsif N = 2 then
         return 1;
      else
         return (N-1)*(2*(N-1)-1) + HH(N-1);
      end if;
   end HH;

N1, N2 : Integer;

begin
   --input
   Put("Mata in N och HH: ");
   Get(N1);
   Get(N2);
   Put("Fibonacci-tal nummer ");
   Put(N1, Width => 0);
   Put(" är ");
   --Fib
   Put(Fib(N1), Width => 0);
   Put(".");
   New_Line;
   --LECA
   Put("Det behövs ");
   Put(HH(N2), Width => 0);
   Put(" stenar för att bygga trappan.");
end Rekursion_O6;
                                       -- Chapter 10 - Program 3
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure MultAry1 is

   type MATRIX is array(INTEGER range 1..3,
                        INTEGER range 1..4) of INTEGER;

   Square_Board  : MATRIX;
   Checker_Board : MATRIX;
   Chess_Board   : array(INTEGER range 1..3,
                         INTEGER range 1..4) of INTEGER;
   Across, Over  : INTEGER;

begin

   for Across in 1..3 loop
      for Over in 1..4 loop
         Square_Board(Across, Over) := Across * Over;
         Chess_Board(Across, Over) := 0;
      end loop;
   end loop;

   Checker_Board := Square_Board;

   Checker_Board(2, 3) := 2;
   Checker_Board(Checker_Board(2, 3), 4) := 17;
   Checker_Board(3, 3) := Chess_Board(3, 3);

   for Across in 1..3 loop
      for Over in 1..4 loop
         Put(Checker_Board(Across, Over), 5);
      end loop;
      New_Line;
   end loop;

end MultAry1;




-- Result of execution

--     1    2    3    4
--     2    4    2   17
--     3    6    0   12

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Rekursion is

   procedure Help_Line (S : in out String;
                     Length : out Integer ) is

   Ch : Character;      
   begin
      if not End_Of_Line or Length = S'Last then
         Length := Length + 1;
         Get(Ch);
         Help_Line(S, Length);
      end if;
   end Help_Line;

   procedure Get_Line (S : in out String;
                     Length : out Integer) is
   begin
      Length := 0;
      Help_Line(S, Length);
      if not Length = S'Last then
         Skip_Line;
      end if;
   end Get_Line;




begin



end Rekursion;
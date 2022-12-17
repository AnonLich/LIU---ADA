with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;


package body Closes_Handling is

    procedure Get (Space : out Coordinate) is
    C : Character;
    begin
        Get(C);
        Get(Space.X);
        Get(C);
        Get(Space.Y);
        Get(C);
        Get(Space.Z);
        Skip_Line;

        Space.Length := ((Space.X**2) + (Space.Y**2) + (Space.Z**2)) ** 0.5;


    end Get;

    function "<"(Left,Right : in Coordinate) return Boolean is
    
    begin

        if Left.Length < Right.Length then
            return True;
        end if;
        return False;

    end "<";
end Closes_Handling;
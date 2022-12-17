with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package Closes_Handling is
    
    type Coordinate is
        record
            X,Y,Z : Float;
            Length : Float;
        end record;

    procedure Get (Space : out Coordinate);
        
    function "<" (Left,Right : in Coordinate) return Boolean;

end Closes_Handling;
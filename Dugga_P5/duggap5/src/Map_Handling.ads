with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package Map_Handling is

    procedure Get () is
        
    begin
        
    end Get;

   type Map_Type is
      record
        Skog, 
        aker, 
        vatten, 
        berg, 
        sno, 
        gras, 
        svamp, 
        ang, 
        stad, 
        hav : 
        Character;

      end record;


end Map_Handling;
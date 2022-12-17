with Ada.Text_IO;  use Ada.Text_IO;

with Map_Handling; use Map_Handling;

procedure Largest_Map_Area is
   
   Original_Map, Largest_Area : Map_Type;
   
begin
   
   Put_Line("Enter map:");
   Get(Original_Map);
   
   Largest_Area := Extract_Largest_Area(Original_Map);
   
   Put_Line("Map of largest area:");
   Put(Largest_Area);
   
end Largest_Map_Area;

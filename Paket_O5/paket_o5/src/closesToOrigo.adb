with Ada.Text_IO; use Ada.Text_IO;
with Closes_Handling; use Closes_Handling;

procedure ClosesToOrigo is
    
    C1,C2 : Coordinate;

begin
    Put_Line("Mata in två punkter: ");
    Get(C1);
    Get(C2);    

    if C1 < C2 then
        Put_Line("Den första punkten närmre origo.");
    elsif C2 < C1 then
        Put_Line("Den andra punkten närmre origo.");
    else
        Put_Line("De är lika långt ifrån");
    end if;

end ClosesToOrigo;
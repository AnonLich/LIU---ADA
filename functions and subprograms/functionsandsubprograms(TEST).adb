--DENNA FIL ÄR TESTER FRÅN LEKTION MED ASSISTENT

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure HP is

procedure Get_Int(A,B,C,D,E : out Integer is
begin
Get(A);
Get(B);
Get(C);
Get(D);
Get(E);
end Get_Int;

procedure Get_Safe (X : out Integer) is
begin
    loop
    Get(X);
        if ok(X) = True then
            exit;
        end if;
    end loop;

end Get_Safe;

function Summera(A,B,C,D,E : in Integer) return Integer is
    Sum : Integer;
    begin
    Sum := A+B+C+D+E;
    return Sum;
end Summera;

function OK (X : in Integer) return Boolean is
    begin
        if x > 0 then
            return True;
        end if;
    return False;
end ok;

procedure Utskrift(X : in Integer) is
begin
Put(X);
end Utskrift;

A,B,C,D,E : Integer;
Sum : Integer;
begin
               --I Begin hämtar vi underprogram
Get_Int(A,B,C,D,E);
Sum := Summera(A,B,C,D,E);
Utskrift(Sum);

end HP;
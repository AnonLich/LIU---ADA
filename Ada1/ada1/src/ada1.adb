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
   if x < 0 then
      Get(X);
      exit when x > 0 ;
   end if;
end loop;
end Get_Safe;

procedure Summera(A,B,C,D,E : in Integer; Sum : out Integer is
begin
Sum := A+B+C+D+E;
end Summera;

procedure Utskrift(X : in Integer) is
begin
Put(X);
end Utskrift;

A,B,C,D,E : Integer;
Sum : Integer;
begin
               --I Begin hämtar vi underprogram
Get_Int(A,B,C,D,E);
Summera(A,B,C,D,E,Sum);
Utskrift(Sum);

end HP;



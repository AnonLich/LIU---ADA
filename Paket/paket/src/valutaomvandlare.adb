package body Valuta_Omvandlare is

end Valuta_Omvandlare;
procedure Put (Sum : in Valuta_Type) is
begin
    Put(Sum.Pengar, Fore=> 0, Aft => 2, Exp => 0);
    Put(" ");
    Put(Sum.Valuta);
end Put;

function To_Sek (Pengar : in Valuta_Type) return Valuta_Type is
Sum : Valuta_Type;
begin
    if "USD" = Pengar.Valuta then
    Sum.Pengar := Pengar.Pengar * 11.0;
    --elsif på alla andra valutor
    end if;
    Sum.Pengar := "Sek";
    return Sum;
end To_Sek;

procedure Get (Pengar : out Valuta_Type) is
    Trash : Character;
begin
    Get(Pengar.Pengar);
    Get(Trash);
    Get(Pengar.Valuta(1..3));
end Get;

procedure Put_Sek (Pengar : in Valuta_Type) is
    Sum : Valuta_Type;
begin
    Sum := To_Sek(Pengar);
    Put(Sum);
end Put_Sek;
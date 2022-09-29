package Valuta_Omvandlare is --Viktigt när vi handlar med paket att filnamnet ska var små bokstäver

type Valuta_Type is private;
procedure Get (Pengar : in Valuta_Type);

procedure Put_Sek (Pengar : in Valuta_Type);

procedure Put_Original_Valuta (Pengar : in Valuta_Type);

private
    type Valuta_Type is
        record
            Pengar : Float;
            Valuta : String(1..3);
        end record;
end Valuta_Omvandlare;
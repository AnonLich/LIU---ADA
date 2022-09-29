with Ada.Text_IO; use Ada.Text_IO;
with Valuta_Omvandlare; use Valuta_Omvandlare;

procedure valuta is

Pengar : Valuta_Type;

begin
   Put("Mata in pengar: ");
   Get(Pengar);
   Put("Dina pengar i SEK");
   Put_SEK(Pengar);
   Put("Dina pengar i original valuta: ");
   Put_Original_Valuta(Pengar);
end valuta;

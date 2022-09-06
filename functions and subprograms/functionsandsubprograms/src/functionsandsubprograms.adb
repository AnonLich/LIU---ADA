with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Go is
Selection : Integer;
A : Integer;

procedure Menu_Selection (Selection : out Integer) is
begin
   --Put("Välkommen till miniräknaren");
   --Put_Line("=== HUVUDMENY ===");
   --Put_Line("1. Beräkna hopotenusa");
   --Put_Line("2. Beräkna triangelvinklar");
   --Put_Line("3. Beräkna N-fakultet");
   --Put_Line("4. Avlsuta programmet");
   --Put_Line("Val: ");
      Get(Selection);
      Put(Selection);
end Menu_Selection;

--procedure Hypothenuse_Program (Katet1, Katet2 : out Integer) is
--begin



begin
Menu_Selection(A);

end Go;

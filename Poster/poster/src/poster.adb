-- melpa661: Arbetat enskilt
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure HP is 

   type DS1 is
      record
         W : Character;
         P : String(1..4);
      end record;

   type DS2_Inner is
      record
	      S : Float;
	      Z : String(1..4);
      end record;

   type DS2 is
      record
	      D : DS2_Inner;
	      U : DS2_Inner;
      end record;

   type DS3_Inner1 is
      record
	      Y,Q : Character;
      end record;

   type DS3_Inner2 is
      record
	      T : Boolean := False;
	      L : Character;
      end record;

   type DS3 is
      record
         J : DS3_Inner1;
         B : DS3_Inner1;
         O : DS3_Inner2;
      end record;

   procedure Get (Data : out DS1) is
   Cr : Character;
   begin
      Get(Data.W);
      Get(Cr);
      Get(Data.P);
   end Get;

   procedure Put (DS : in DS1) is
   begin
      Put(DS.W);
      Put(" ");
      Put(DS.P);
   end Put;

   procedure Get (Data : out DS2_Inner) is
      Cr : Character;
   begin
      Get(Data.S);
      Get(Cr);
      Get(Data.Z);
   end Get;

   procedure Get (D : out DS2) is
      Cr : Character;
   begin
      Get(D.D);
      Get(Cr);
      Get(D.U);
   end Get;

   procedure Get (Data : out DS3_Inner1) is
      Cr : Character;
   begin
      Get(Data.Y);
      Get(Cr);
      Get(Data.Q);
   end Get;

   procedure Get (Data : out DS3_Inner2) is
      Cr,Check_B : Character;
   begin
      Get(Check_B);
      if Check_B = 'T' or Check_B = 't' then
	      Data.T := True;
      else
	      Data.T := False;
      end if;
      Get(Cr);
      Get(Data.L);
   end Get;

   procedure Get (D : out DS3) is
      Cr : Character;
   begin
      Get(D.J);
      Get(Cr);
      Get(D.B);
      Get(Cr);
      Get(D.O);
   end Get;

   procedure Put (DSInner1 : in DS3_Inner1) is
   begin
      Put(DSInner1.Y);
      Put(" ");
      Put(DSInner1.Q);
   end Put;

   procedure Put (DSInner2 : in DS3_Inner2) is
   begin
      if DSInner2.T = True then
	      Put("True");
      else
	      Put("False");
      end if;
      Put(" ");
      Put(DSInner2.L);
   end Put;

   procedure Put (DS : in DS3) is
   begin
      Put(DS.J);
      Put(" ");
      Put(DS.B);
      Put(" ");
      Put(DS.O);
   end Put;

   procedure Put (DSInner : in DS2_Inner) is
   begin
      Put(DSInner.S, Fore => 1, Aft => 3, Exp => 0);
      Put(" ");
      Put(DSInner.Z);
   end Put;

   procedure Put (DS : in DS2) is
   begin
      Put(DS.D);
      Put(" ");
      Put(DS.U);
   end Put;

   Datastruktur1 : DS1;
   Datastruktur2 : DS2;
   Datastruktur3 : DS3;

begin
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(Datastruktur1);
   Put("Inmatad datamängd: ");
   Put(Datastruktur1);
   New_Line(2);

   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(Datastruktur2);
   Put("Inmatad datamängd: ");
   Put(Datastruktur2);
   New_Line(2);

   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(Datastruktur3);
   Put("Inmatad datamängd: ");
   Put(Datastruktur3);
end HP;
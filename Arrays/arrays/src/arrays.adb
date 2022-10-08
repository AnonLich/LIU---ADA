-- melpa661: Arbetat enskilt
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Arrays is
   type Datastruktur1 is 
     array (31 .. 35 ) of Float;

   type Datastruktur2_Inner is
     array (Character Range '5'..'9') of String (1..5);

   type Datastruktur2 is
     array (False .. True) of Datastruktur2_Inner;

   type Datastruktur3 is
     array (73 .. 74, Character range '4'..'8') of Integer;

   procedure Get (Data : out Datastruktur1) is  --GET FÖR DATASTRUKTUR 1
   begin
      for I in reverse Data'Range loop
         Get(Data(I));
      end loop;
   end Get;

   procedure Put (Data : in Datastruktur1) is --PUT FÖR DATASTRUKTUR 1
   begin
      for I in reverse Data'Range loop
         Put(Data(I), Fore => 1, Aft => 3, Exp => 0);
         if I /= Data'First then
            Put(" ");
         end if;
      end loop;      
   end Put;

   procedure Get (Data : out Datastruktur2_Inner) is  --GET FÖR DATASTRUKTUR 2 INNER
      Cr : Character;
   begin
      for I in reverse Data'Range loop
         Get(Data(I));
         if I /= Data'First then
            Get(Cr);
         end if;
      end loop;
   end Get;

   procedure Get (Data : out Datastruktur2) is  --GET FÖR DATASTRUKTUR 2   
      Cr : Character;
   begin
      for I in Data'Range loop
         Get(Data(I));
         if I = False then
            Get (Cr);
         end if;
      end loop;
   end Get;

   procedure Put (Data : in Datastruktur2_Inner) is --PUT FÖR DATASTRUKTUR 2 INNER
   begin
      for I in reverse Data'Range loop
         Put(Data(I));
         if I /= Data'First then
            Put(" ");
         end if;
      end loop;
   end Put;

   procedure Put (Data : in Datastruktur2) is   --PUT FÖR DATASTRUKTUR 2
   begin
      for I in Data'Range loop
         Put(Data(I));
         if I /= Data'Last then
            Put(" ");
         end if;
      end loop;
   end Put;

   procedure Get (Data : out Datastruktur3) is  --GET FÖR DATASTRUKTUR 3   
   begin
      for I in Data'Range(1) loop
         for J in Data'Range(2) loop
            Get(Data(I,J));
         end loop;
      end loop;
   end Get;

   procedure Put (Data : in Datastruktur3) is   --PUT FÖR DATASTRUKTUR 3
   begin
      for I in Data'Range(1) loop
         for J in Data'Range(2) loop
            Put(Data(I,J), Width => 0);
            if I /= Data'Last(1) or J /= Data'Last(2) then
               Put(" ");
            end if;
         end loop;
      end loop;
   end Put;

   DS1 : Datastruktur1;
   DS2 : Datastruktur2;
   DS3 : Datastruktur3;
begin
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(DS1);
   Put("Inmatad datamängd: ");
   Put(DS1);
   New_Line(2);
   Skip_Line;
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(DS2);
   Put("Inmatad datamängd: ");
   Put(DS2);
   New_Line(2);
   Skip_Line;
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(DS3);
   Put("Inmatad datamängd: ");
   Put(DS3);
end Arrays;
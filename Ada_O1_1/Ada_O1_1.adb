-- Samarbetat med steku219 (Stefan Kulevski) 

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Ada_O1_1 is
   Int : Integer;
   Flt : Float;
   Cr : Character;
   Str : String(1..5);
   
begin
   
   Put ("Skriv in ett heltal: ");
   Get (Int);
   Put ("Du skrev in talet: ");
   Put(Int, Width => 0); New_Line; New_Line;
   
   Skip_Line;
   Put("Skriv in fem heltal: "); 
   Get(Int);
   Put ("Du skrev in talen: ");
   Put(Int, Width => 1);
   Put(" ");
   Get(Int);
   Put(Int, Width => 1);
   Put(" ");
   Get(Int);
   Put(Int, Width => 1);
   Put(" ");
   Get(Int);
   Put(Int, Width => 1);
   Put(" ");
   Get(Int);
   Put(Int, Width => 1);
   
   New_Line; 
   New_Line;
   
   Skip_Line;
   Put ("Skriv in ett flyttal: ");
   Get (Flt);
   Put ("Du skrev in flyttalet: ");
   Skip_Line;
   Put(Flt, Fore => 1, Aft => 3, Exp => 0); 
   
   New_Line; 
   New_Line;
   

   Put ("Skriv in ett heltal och ett flyttal: ");
   Get (Int);
   Get (Flt);
   
   
   Put ("Du skrev in heltalet:");
   Put(Int, Width => 10); 
   
   New_Line;
   
   Put ("Du skrev in flyttalet:");
   Put (Flt, Fore => 4, Aft => 4, Exp => 0);
   
   New_Line; 
   New_Line;
   
   Skip_Line;
   Put ("Skriv in ett tecken: ");
   Get (Cr);
   Put ("Du skrev in tecknet: ");
   Put(Cr); 
   
   New_Line;
   New_Line;
   
   Skip_Line;
   Put ("Skriv in en sträng med 5 tecken: "); 
   Get (Str);
   Put ("Du skrev in strängen: ");
   Put(Str);
   
   New_Line; 
   New_Line;
   
   Skip_Line;
   Put ("Skriv in en sträng med 3 tecken: "); 
   Get (Str(1..3));
   Put ("Du skrev in strängen: ");
   Put(Str(1..3)); 
   
   New_Line;
   New_Line;
   
   Skip_Line;
   Put ("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get (Int);
   Get (Cr);
   Get (Str(1..5));

   Put ("Du skrev in talet |");
   Put(Int, Width => 0);
   Put ("| och strängen |");
   Put (Str);
   Put ("|.");
   
   New_Line; 
   New_Line;
   
   Skip_Line;
   Put ("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Get (Str(1..3));
   Get (Flt);
   Put ("Du skrev in " & '"');
   Put (Flt, Fore => 2, Aft => 3, Exp => 0);
   Put ('"' & " och " & '"');
   Put (Str(1..3));
   Put ('"');
   Put ("."); 
   
   New_Line; 
   New_Line;
   
   Skip_Line;
   Put ("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line (Str(1..5), Int);
   if (Int = 5) then
      
      Skip_Line;

      
   end if;
      Put("Du skrev in strängen: ");
      Put(Str(1..Int)); 
      
      New_Line;
      New_Line;
      
   
   Put ("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line (Str(1..5), Int);
   if (Int = 5) then
      
      Skip_Line;
      
   end if;
      Put("Du skrev in strängen: ");
      Put(Str(1..Int)); 
      
      New_Line;
      
   
end Ada_O1_1;

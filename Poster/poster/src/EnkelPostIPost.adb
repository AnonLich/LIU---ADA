with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure HP is

   type Actor_Type is 
      record
         First_Name : String(1..5);
         Last_Name : String(1..5);
         --Length_FN : Integer;
         --Length_LN : Integer;
   end record;

   type Movie_Type is --DS2
      record
         Main_Role : Actor_Type; --S
         --Length_Movie : Integer; --Minuter
         Title : String(1..5);
         --Length_Title : Integer;
   end record;

   procedure Get_Actor_Type (First_Name : out String;
                           Last_Name : out String) is
   begin
      Put("Mata in skådespelarens förnamn: ");
      Get(First_Name);
      Put("Mata in skådespelarens efternamn: ");
      Get(Last_Name);
   end Get_Actor_Type;

   procedure Get_Movie_Type (Main_Role : out Actor_Type;
                           --Length_Movie : out Integer;
                           Title : out String) is
   Actor : Actor_Type;
   begin
      Get_Actor_Type(Actor.First_Name, Actor.Last_Name);
      Put("Mata in filmens titel: ");
      Get(Title);
      --Put("Mata in filmens längd: ");
      --Get(Length_Movie);
   end Get_Movie_Type;

   procedure Put_Actor_Type(Actor : in Actor_Type) is
   begin
      Put(Actor.First_Name);
      Put(Actor.Last_Name);

   end Put_Actor_Type;

   procedure Put_Movie_Type(Movie : in Movie_Type) is
   begin
      
      Put_Actor_Type(Movie.Main_Role);
      --Put(Movie.Length_Movie);
      Put(Movie.Title);
   end Put_Movie_Type;


   
   Movie : Movie_Type;
   

begin

   Get_Movie_Type(Movie.Main_Role, Movie.Title);
   Put_Movie_Type(Movie);
   


end HP;
package body Time_Handling is

    procedure Get (Item : out Time_Type) is
        
    begin
        Get(Item.H); --13:01;
        Get(Ch); --'2'
        Get(Item.M); --7
        Get(Ch); --??
        Get(Item.S);


    end Get;;
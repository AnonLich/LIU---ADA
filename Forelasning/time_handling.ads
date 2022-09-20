package Time_Handling is

type Time_Type is private;
procedure Get(Item : out Time_Type);
procedure Put(Item :  in Time_Type);
function "+" (L,R : in Time_Type) return Time_Type;
function "<" (L,R : in Time_Type) return Boolean;
Time_Error : Exception;
private
    type Time_Type is
        record
            T,H,S : Integer;
        end record;




end Time_Handling;
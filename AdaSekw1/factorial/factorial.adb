-- factorial.adb

with Ada.Text_IO;
use Ada.Text_IO;

procedure Factorial is
    NumberToFactor: Integer := 4;
    FactorialResult : Long_Integer := 0;
    function Fact
        (N: in Integer) return Long_Integer
    is
    begin
        if N = 0 then
            return 1;
        elsif N > 0 then
            return Long_Integer(N)*Fact(N-1);
        else
            Put_Line("I cannot calculate factorial from negative number.");
            return -11;
        end if;
    end Fact;

begin
    FactorialResult := Fact(NumberToFactor);
    Put_Line("Factorial of: " & 
    Integer'Image(NumberToFactor) & " is " & 
    Long_Integer'Image(FactorialResult));
end Factorial;



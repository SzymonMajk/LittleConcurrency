-- average.adb

with Ada.Text_IO;
use Ada.Text_IO;

procedure Average is
    FirstNumber: Integer := 5;
    SecondNumber: Integer := 7;
    Result : Integer := 0;
    procedure Sum
        (A, B: in Integer;
        C: out Integer)
    is
    begin
        C := A+B;
    end Sum;

begin
    Sum(FirstNumber,SecondNumber,Result);
    Put_Line("The average of" & 
    Integer'Image(FirstNumber) & " and " & 
    Integer'Image(SecondNumber) & " is " & 
    Integer'Image(Result));
end Average;



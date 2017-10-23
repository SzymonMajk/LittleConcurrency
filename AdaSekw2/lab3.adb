with Ada.Text_IO,Ada.Float_Text_IO,Ada.Calendar,pak3;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Calendar,pak3;

procedure lab3 is
	V1 : vector(1..5) := (9.2,8.5,2.1,1.1,3.5);
    V2 : vector(1..50) := (1 => 4.0, 3|4 => 6.6, others => 1.2);
    V3 : vector(1..500) := (1 => 0.01, 3|4 => 12.6, others => 1.3);
    T1, T2: Time;
    D: Duration;
begin
    T1 := Clock;
    proceedTask(V1,"5 example.exp",true,false);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program execution duration = " & D'Img & "[s]");

    T1 := Clock;
    proceedTask(V2,"50 example.exp",false,false);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program execution duration = " & D'Img & "[s]");

    T1 := Clock;
    proceedTask(V3,"500 example.exp",false,true);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program execution duration = " & D'Img & "[s]");
end lab3;

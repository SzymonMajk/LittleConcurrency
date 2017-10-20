with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;

procedure lab3 is
	type vector is array(Integer range <>) of Float;

	V1 : vector(1..5) := (1 => 2.0, 3|4 => 5.6, others => 1.0);
    T1, T2: Time;
    D: Duration;
begin
    T1 := Clock;
	printVector(V1);
	--randomVectorSet(V1);
	--printVector(V1);
	if isAscendingOrder(V1) then
		Put_Line("Vector is in ascending order.");
	else
		Put_Line("Vector is not in ascending order. Sorry.");
	end if;
    sortVector(V1);
    printVector(V1);
    saveVector(V1,"sampleFileName");
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program executing duration = " & D'Img & "[s]");
end lab3;

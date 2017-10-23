with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar,pak3;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar,pak3;

procedure lab3 is
	V1 : vector(1..5) := (1 => 2.0, 3|4 => 5.6, others => 1.0);
    V2 : vector(1..50) := (1 => 4.0, 3|4 => 6.6, others => 1.2);
    V3 : vector(1..500) := (1 => 0.01, 3|4 => 12.6, others => 1.3);
    T1, T2: Time;
    D: Duration;

    procedure proceedTasks(V: in out vector) is
    begin
    	--printVector(V);
    	randomVectorSet(V);
    	--printVector(V);
    	if isAscendingOrder(V) then
    		Put_Line("Vector is in ascending order.");
    	else
    		Put_Line("Vector is not in ascending order. Sorry.");
      	end if;
        sortVector(V);
        printVector(V);
        saveVector(V,"sampleFileName");
    end;

begin
    T1 := Clock;
    --proceedTasks(V1);
    T2 := Clock;
    D := T2 - T1;
    --Put_Line("Program executing duration = " & D'Img & "[s]");

    T1 := Clock;
    proceedTasks(V2);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program executing duration = " & D'Img & "[s]");

    T1 := Clock;
    --proceedTasks(V3);
    T2 := Clock;
    D := T2 - T1;
    --Put_Line("Program executing duration = " & D'Img & "[s]");
end lab3;

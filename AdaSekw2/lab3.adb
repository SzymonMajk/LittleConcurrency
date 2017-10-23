with Ada.Text_IO,Ada.Float_Text_IO,Ada.Calendar,pak3;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Calendar,pak3;

procedure lab3 is
	V1 : vector(1..6) := (9.2,8.5,2.1,1.1,3.5,5.3);
    V2 : vector(1..50) := (1 => 4.0, 3|4 => 6.6, others => 1.2);
    V3 : vector(1..500) := (1 => 0.01, 3|4 => 12.6, others => 1.3);
    T1, T2: Time;
    D: Duration;

    procedure proceedTasks(V: in out vector;filename: in String) is
    begin
    	printVector(V);
    	randomVectorSet(V);
    	printVector(V);

    	if isAscendingOrder(V) then
    		Put_Line("Vector is in ascending order.");
    	else
    		Put_Line("Vector is not in ascending order. Try to fix that!.");
            sortVector(V);
    	    if isAscendingOrder(V) then
    		    Put_Line("After sorting vector is in ascending order.");
    	    else
    		    Put_Line("Vector is not in ascending order. Smt went wrong...");
      	    end if;
            printVector(V);
      	end if;
  
        saveVector(V,filename);
    end;

begin
    T1 := Clock;
    proceedTasks(V1,"5 example.exp");
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program executing duration = " & D'Img & "[s]");

    T1 := Clock;
    proceedTasks(V2,"50 example.exp");
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program executing duration = " & D'Img & "[s]");

    T1 := Clock;
    proceedTasks(V3,"500 example.exp");
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Program executing duration = " & D'Img & "[s]");
end lab3;

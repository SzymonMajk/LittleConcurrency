with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random;



procedure Vector is
	type vector is array(Integer range <>) of Float;
	
	procedure printVector(V : in vector) is
	begin
		Put_Line("Start printing vector:");
		for E of V loop
			Put(E);
			New_line;
		end loop;
		Put_Line("That is my vector!");
	end printVector;
	
	procedure randomVectorSet(V: in out vector) is
		G: Generator;
	begin
		Reset(G);
		Put_Line("Start random generation:");
		for E of V loop
			E := Random(G);
		end loop;
		Put_Line("New values set!");
	end randomVectorSet;
	
	function checkIncrease(V: in vector) is
	return Boolean is
	begin
		return (for all I in V'First..(V'Last-1) => V(I)<V(I+1));
	end checkIncrease;
	
	procedure sortVector(V: in vector) is
	begin
		Put("To do!");
	end sortVector;
	
	V1 : vector(1..5) := (1 => 2.0, 3|4 => 5.6, others => 1.0);
begin
	printVector(V1);
	randomVectorSet(V1);
	printVector(V1);
	if checkIncrease(V1) then
		Put("Vector increse");
	else
		Put("Not...");
	end if;
end Vector;
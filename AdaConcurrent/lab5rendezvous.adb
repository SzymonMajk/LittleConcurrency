-- to test compile gnatmake lab5rendezvous.adb -gnata -o lab5rendezvous.out

with Ada.Text_IO, Ada.Integer_Text_IO,Ada.Float_Text_IO,
	Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Integer_Text_IO,Ada.Float_Text_IO,
	Ada.Numerics.Float_Random;

procedure Lab5rendezvous is

	task type genFloat is
		entry generatorFloat(randomNumber : out Float);
		entry endTask;
	end genFloat;
			
	task body genFloat is
		randomNumber : Float;
	begin
		loop
			select
				accept generatorFloat(randomNumber : out Float) do
					randomNumber := 0.5;
				end generatorFloat;
				or
				accept endTask;
				exit;
			end select;
		end loop;
	end genFloat;

	gen1 : genFloat;
	number : Float;

begin 
	Put_Line("Welcome in random float generator!");
	gen1.generatorFloat(number);
	Put_Line("Generate number with new task!");
	Put_Line(number'Img);
	Put_Line("Now it is time to end generator task!");
	gen1.endTask;
	Put_Line("And now it is time for my end...");
end Lab5rendezvous;

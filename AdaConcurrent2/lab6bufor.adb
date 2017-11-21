-- to test compile gnatmake lab6bufor.adb -gnata -o lab6bufor.out

with Ada.Text_IO, Ada.Integer_Text_IO,Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO,Ada.Float_Text_IO;

procedure Lab6bufor is

	type buforString is array(Integer range <>) of Character;

	protected type BufN(initSize : Integer := 5) is
	  entry insert(C : Character);
	  entry get(C : out Character);
	  private
	   Bc : buforString(1..initSize);
	   Current : Integer := 0;
	   Size : Integer := initSize;
	end BufN;

	protected body BufN is
	  entry insert(C : Character) when Current < Size is
	  begin
		Current := Current + 1;
	    Bc(Current) := C;
	  end insert;
	  entry get(C : out Character) when Current > Size is
	  begin
	    C := Bc(Current);
		Current := Current - 1;
	  end get;
	end BufN;

	bufor : BufN(2);

	task Prod; 

	task body Prod is
	  Cl : Character := 's';
	begin  
		for I in 1 .. 5 loop
	  	  	Put_Line("$ Insert: '" & Cl & "'");
	  		bufor.insert(Cl);
	  	  	Put_Line("$ Inserted...");
  		end loop;
	end Prod;

	task Kons; 

	task body Kons is
	  Cl : Character := ' ';
	begin 
		for I in 1 .. 5 loop
	  	  	Put_Line("# Get...");
	  		bufor.get(Cl);
	  		Put_Line("# Got: '" & Cl & "'");
	    end loop;
	end Kons;

begin 
	Put_Line("Main.");
end Lab6bufor;

with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random;

package body pak3 is

procedure printVector(V : in vector) is
begin
	Put_Line("Start printing vector:");
	for E of V loop
		Put(E);
		--Put(", ");
        New_Line;
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
	
function isAscendingOrder(V: in vector)
return Boolean is
begin
	return (for all I in V'First..(V'Last-1) => V(I)<V(I+1));
end isAscendingOrder;

procedure sortVector(V: in out vector) is
Key: Float;
J: Integer;
begin
	Put_Line("Sort the vector!");
    for I in V'First+1..V'Last loop
        Key := V(I);
        J := I-1;
        while V(J) > Key loop
            V(J+1) := V(J);
            J := J-1;
            if (j < V'First) then exit; end if;            
        end loop;
        V(J+1) := Key;
    end loop;
end sortVector;

procedure saveVector(V: in Vector; filename: in String) is
fil : File_Type;
begin
    Create(fil, Out_File, filename);
    Put_Line("Create file: " & filename);
    Put_Line(fil, "Begin vectorization!");
    for E of V loop
        Put(fil,E'Img & ",");
    end loop;
    New_Line(fil);	   
    Put(fil, "That's my vector!");
    Close(fil);
end saveVector;

end pak3;

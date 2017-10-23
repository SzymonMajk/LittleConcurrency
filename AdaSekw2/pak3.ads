with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;

package pak3 is

type vector is array(Integer range <>) of Float;
procedure proceedTask(V: in out vector;filename: String; 
	print: Boolean; save: Boolean);

private

procedure printVector(V : vector);
procedure randomVectorSet(V: in out vector);
function isAscendingOrder(V: vector) return Boolean;
procedure sortVector(V: in out vector);
procedure saveVector(V: Vector; filename: String);

end pak3;

with Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;
use Ada.Text_IO,Ada.Float_Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;

package pak3 is

type vector is array(Integer range <>) of Float;
procedure printVector(V : in vector);
procedure randomVectorSet(V: in out vector);
function isAscendingOrder(V: in vector) return Boolean;
procedure sortVector(V: in out vector);
procedure saveVector(V: in Vector; filename: in String);

end pak3;

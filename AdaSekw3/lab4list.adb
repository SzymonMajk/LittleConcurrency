-- lab4.adb
-- Materiały dydaktyczne
-- J.P. 2017

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4List is

type Element is
	record 
		Data : Integer := 0;
		Next : access Element := Null;
	end record;    
  
type Elem_Ptr is access all Element;

procedure print(List : access Element) is
	L : access Element := List;
begin
	if List = Null then
		Put_Line("List EMPTY!");
	else
		Put("List:");  
	end if;  
	while L /= Null loop
		Put(" #> " & L.Data'Img);
		L := L.Next;
	end loop;
	New_Line;
end print;  

procedure insertFront(List : in out Elem_Ptr; D : in Integer) is
	E : Elem_Ptr := new Element; 
begin
	E.all := (D, List);
	List := E;
end insertFront; 

function insertFront(List : access Element; D : in Integer) 
	return access Element is ( new Element'(D,List) );  
   
procedure insertWithSort(List : in out Elem_Ptr; D : in Integer) is 
begin
	null;
end insertWithSort;       

List : Elem_Ptr := Null;

begin
	print(List);
	List := insertFront(List, 21);
	print(List);
	insertFront(List, 20);  
	print(List);
	for I in reverse 1..12 loop
		insertFront(List, I);
	end loop;
	print(List);
end Lab4List;
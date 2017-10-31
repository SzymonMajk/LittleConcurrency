-- Materiały dydaktyczne J.P. 2017
-- to test compile gnatmake lab4list.adb -gnata -o lab4list.out

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
		Put("List EMPTY!");
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
Tmp, Prev : Elem_Ptr := List;
E : Elem_Ptr := new Element;
begin
    E.all := (D,Null);

	if List = Null then
		insertFront(List,D);
	elsif List.Next = Null then
        if(List.Data > D) then 
            List.Next := E;
        else
            insertFront(List,D); 
        end if;
    elsif List.Data < D then
        insertFront(List,D);
    else
        Tmp := Tmp.Next;
		while Tmp /= Null loop
            if(List.Data < D) then
                E.Next := Tmp;
                Prev.Next := E;
                return;
            else
                Prev := Tmp;
			    Tmp := Tmp.Next;
            end if;
		end loop;
        Prev.Next := E;
	end if;
end insertWithSort;       

List : Elem_Ptr := Null;
List2 : Elem_Ptr := Null;


begin 
	--print(List);
	for I in 1..6 loop
		insertWithSort(List, I);
        --pragma Debug(print(List));
        --insertWithSort(List, 4);
		pragma Debug(print(List));
	end loop;

	for I in reverse 1..6 loop
		insertWithSort(List2, I);
        --insertWithSort(List2, 7);
		pragma Debug(print(List2));
	end loop;
	--print(List);
end Lab4List;

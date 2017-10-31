-- to test compile gnatmake lab4tree.adb -gnata -o lab4tree.out

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Unchecked_Deallocation;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4Tree is

type Node is
	record 
		Data : Integer := 0;
		Left : access Node := Null;
		Right : access Node := Null;
	end record;    
  
type Node_Ptr is access all Node;

procedure print(Tree: Node; Level : Integer := 0) is
begin
	Put_Line(Tree.Data'Img);
	
	for I in 0..Level loop
		Put("--");
	end loop;
	if(Tree.Left /= Null) then
		print(Tree.Left.all,Level+1);
	else
		Put_Line(" #");
	end if;
	
	for I in 0..Level loop
		Put("--");
	end loop;
	if(Tree.Right /= Null) then
		print(Tree.Right.all,Level+1);
	else
		Put_Line(" #");
	end if;
end print;

procedure putLeft(Tree: in out Node; D: Integer) is
	Tmp : Node_Ptr := new Node;
begin
	Tmp.all := (D,Null,Null);
	Tree.Left := Tmp;
end putLeft;

procedure putRight(Tree: in out Node; D: Integer) is
	Tmp : Node_Ptr := new Node;
begin
	Tmp.all := (D,Null,Null);
	Tree.Right := Tmp;
end putRight;

procedure putNode(Tree: in out Node; D: Integer) is
begin
	if(Tree.Data > D) then
		if(Tree.Right = Null) then
			putRight(Tree,D);
		else
			putNode(Tree.Right.all,D);
		end if;
	else
		if(Tree.Left = Null) then
			putLeft(Tree,D);
		else
			putNode(Tree.Left.all,D);
		end if;
	end if;
end putNode;

function search(Tree: Node; D: Integer) 
return Boolean is
begin
	if Tree.Data = D then
		return True;
	elsif Tree.Data < D then
		if(Tree.Left /= Null) then
			return search(Tree.Left.all,D);
		else
			return False;
		end if;
	else
		if(Tree.Right /= Null) then
			return search(Tree.Right.all,D);
		else
			return False;
		end if;
	end if;
end search;

procedure FreeNode is 
new Ada.Unchecked_Deallocation(Object => Node, Name => Node_Ptr);

procedure deleteNode(Tree: Node; D: Integer) is
	Tmp : Node_Ptr;
begin
	if Tree.Data = D then
		--FreeNode(Tree'Access);
		--go into child node, check and the delete
	elsif Tree.Data < D then
		if(Tree.Left /= Null) then
			--if(Tree.Left.Data = D) then
			--	FreeNode(Tree.Left);
			--end if;
			deleteNode(Tree.Left.all,D);
		end if;
	else
		if(Tree.Right /= Null) then
			deleteNode(Tree.Right.all,D);
		end if;
	end if;
end deleteNode;

Tree : Node := (3,Null,Null);

begin 
	putNode(Tree,4);
	putNode(Tree,7);
	putNode(Tree,6);
	putNode(Tree,2);
	print(Tree);
	New_Line;
	put_Line(search(Tree,6)'Img);
	put_Line(search(Tree,7)'Img);
	put_Line(search(Tree,8)'Img);
	deleteNode(Tree,6);
	New_Line;
	put_Line(search(Tree,6)'Img);
	put_Line(search(Tree,7)'Img);
	put_Line(search(Tree,8)'Img);
end Lab4Tree;
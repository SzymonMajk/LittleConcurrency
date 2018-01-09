with Ada;
use Ada;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Streams;
use Ada.Streams;
with Ada.Text_IO.Text_Streams;
use Ada.Text_IO.Text_Streams;
with Ada.Numerics.Discrete_Random;

--something is 'no yes' ..

procedure Strum3 is
  Plik         : File_Type;
  Nazwa        : String := "textrt.txt";
  Strumien     : Stream_Access;
  
  subtype Zakres is Integer range 0..1000;
  package Rand_Zakres is new Ada.Numerics.Discrete_Random(Zakres);
  use Rand_Zakres;
  G : Generator;
  
  type Real_Matrix is array (Integer range <>, Integer range <>) of Integer;
   
  procedure Read (S : access Root_Stream_Type'Class; NTab : out Real_Matrix);
  procedure Write (S : access Root_Stream_Type'Class; NTab : in Real_Matrix);
  for Real_Matrix'Read use Read;
  for Real_Matrix'Write use Write;
   
  procedure Read (S : access Root_Stream_Type'Class; NTab : out Real_Matrix) is
  begin
      for Row in Real_Matrix'Range(1) loop
       for Column in Real_Matrix'Range(2) loop
  		 Integer'Read(S,Real_Matrix(Row,Column));
       end loop;
      end loop; 
  end Read;  
  procedure Write (S : access Root_Stream_Type'Class; NTab : in Real_Matrix) is
  begin
    for Row in Real_Matrix'Range(1) loop
     for Column in Real_Matrix'Range(2) loop
		 Integer'Write(S,Real_Matrix(Row,Column));
     end loop;
    end loop;   
  end Write; 

  Row : array (1..2) of Integer;
  Macierz : Real_Matrix(1..2, 1..2):=(others => Random(G));

begin
  Reset(G);
  Macierz:=(others => Random(G));
  
  Put_Line("* Zapis do pliku -> " & Nazwa);
  Create(Plik, Out_File, Nazwa); 
  Strumien := Stream(Plik);
  Put_Line("* Zapisuje tablicę:");
  Macierz'Output(Strumien, Macierz);
  Close(Plik);
end Strum3;  

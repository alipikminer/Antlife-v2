Uses GraphAbc;
var
  map: array[1..500] of array[1..500] of array[1..2] of integer;

var
  foodx, foody, foodtrue: array[1..50] of integer;

var
  antx, anty, anttime, antpriory: array of integer;

var
  antcount: integer;

var
  i, ii, x, y, matkax, matkay: integer;

begin
  randomize();
  readln(antcount);
  matkax := random(1, 492);
  matkay := random(1, 492);
  SetLength(antx, antcount);
  SetLength(anty, antcount);
  SetLength(anttime, antcount);
  SetLength(antpriory, antcount);
  
  for i := 1 to antcount - 1 do
  begin
    x := random(5, 490);
    y := random(5, 490);
    antx[i] := x;
    anty[i] := y;
    map[antx[i]][anty[i]][2] := 1;
    anttime[i] := random(250, 1000);
  end;
  for i := 1 to 500 do
  begin
    for ii := 1 to 500 do
    begin
      map[i][ii][2] := 5;  
    end;   
  end;
  repeat
    //обновление экрана
    for i := 1 to 8 do
    begin
      for ii := 1 to 8 do
      begin
        map[matkax + ii][matkay + i][2] := 6;
      end;
    end;
    for i := 1 to antcount -1 do
    
    begin
    
      if antpriory[i] = 0 then
      begin
      if antx[i]<matkax-9 then x:=1;
      if antx[i]>matkax+9 then x:=-1;
      if anty[i]<matkay-9 then y:=1;
      if anty[i]>matkay+9 then y:=-1;
      if antx[i]<=matkax+9 then if antx[i]>=matkax-9 then if anty[i]>=matkay-9 then if anty[i]<=matkay+9 then antpriory[i]:=1;
      
      end;
      if antpriory[i] = 1 then
      begin
      x := random(-1, 1);
      y := random(-1, 1);
      end;
        if antx[i] < 5 then if x <= 0 then x := 1;
        if anty[i] < 5 then if y <= 0 then y := 1;
        if antx[i] > 495 then if x >= 0 then x := -1;
        if anty[i] > 495 then if y >= 0 then y := -1;
        
      if x<>0 then antx[i] := antx[i] + x;    
      if y<>0 then anty[i] := anty[i] + y;
     map[antx[i]][anty[i]][2] := 2;
    end;
    for i := 1 to 500 do
    begin
      for ii := 1 to 500 do
      begin
        if map[i][ii][2] <> map[i][ii][1] then
        begin
          case map[i][ii][2] of
            //вот тут прикреплять свои цвета для обьектов
            1: setpixel(i, ii, clBlack); 
            2: setpixel(i, ii, clFireBrick);
            3: setpixel(i, ii, clWhite);
            4: setpixel(i, ii, clGreen);
            5: setpixel(i, ii, clIndianRed);
            6: setpixel(i, ii, clBlack);
          end;
        end;
        map[i][ii][1] := map[i][ii][2];
      end;
    end;
    
    SetLength(antx, antcount);
    SetLength(anty, antcount);
    SetLength(anttime, antcount);
    SetLength(antpriory, antcount);
  until 2 = 3;
end.
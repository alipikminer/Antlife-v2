Uses GraphAbc;
//Шаблон программы на основе движка AntsLive
//Создано по заказу Вадима Аза
var
  map: array[1..500] of array[1..500] of array[1..2] of integer;
//Двуслойный массив карты. Работу осуществлять ТОЛЬКО во втором слоe(map[x][y][2])
var
  antx, anty, anttime: array of integer;

var
  antcount: integer;

var
  i, ii, x, y: integer;
//переменные для непосредственного обновления экрана
begin
  randomize();
  antcount := 2500;
  
  SetLength(antx, antcount);
  SetLength(anty, antcount);
  SetLength(anttime, antcount);
  //Заполение всего экрана замлёй
  for i:=1 to antcount-1 do
  begin
  x := random(1, 500);
  y := random(1, 500);
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
    
    for i := 1 to antcount-1 do
    begin
      x:=random(-1,1);
      y:=random(-1,1);
      if antx[i] <= 5 then if x <= 0 then x := 1;
        if anty[i] <= 5 then if y <= 0 then y := 1;
        if antx[i] >= 495 then if x >= 0 then x := -1;
        if anty[i] >= 495 then if y >= 0 then y := -1;
        map[antx[i]][anty[i]][2]:=2;
      antx[i] := antx[i] + x;    
      anty[i] := anty[i] + y;
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
            2: setpixel(i, ii, clRed);
            3: setpixel(i, ii, clWhite);
            4: setpixel(i, ii, clGreen);
            5: setpixel(i, ii, clFireBrick);
          end;
        end;
        map[i][ii][1] := map[i][ii][2];
      end;
    end;
    
    SetLength(antx, antcount);
    SetLength(anty, antcount);
  SetLength(anttime, antcount);
  until 2 = 3;
end.
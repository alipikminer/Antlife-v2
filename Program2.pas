Uses GraphAbc;
//Шаблон программы на основе движка AntsLive
//Создано по заказу Вадима Аза
var
  map: array[1..500] of array[1..500] of array[1..2] of integer;
//Двуслойный массив карты. Работу осуществлять ТОЛЬКО во втором слоe(map[x][y][2])
var
  i, ii: integer;
//переменные для непосредственного обновления экрана
begin
  randomize();
  //Заполение всего экрана замлёй
  for i := 1 to 500 do
  begin
    for ii := 1 to 500 do
    begin
      map[i][ii][2] := 5;  
    end;   
  end;
  repeat
    //обновление экрана
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
  until 2 = 3;
end.
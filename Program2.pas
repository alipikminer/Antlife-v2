Uses GraphAbc;
//������ ��������� �� ������ ������ AntsLive
//������� �� ������ ������ ���
var
  map: array[1..500] of array[1..500] of array[1..2] of integer;
//���������� ������ �����. ������ ������������ ������ �� ������ ���e(map[x][y][2])
var
  i, ii: integer;
//���������� ��� ����������������� ���������� ������
begin
  randomize();
  //��������� ����� ������ �����
  for i := 1 to 500 do
  begin
    for ii := 1 to 500 do
    begin
      map[i][ii][2] := 5;  
    end;   
  end;
  repeat
    //���������� ������
    for i := 1 to 500 do
    begin
      for ii := 1 to 500 do
      begin
        if map[i][ii][2] <> map[i][ii][1] then
        begin
          case map[i][ii][2] of
            //��� ��� ����������� ���� ����� ��� ��������
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
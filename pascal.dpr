program pascal;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  t:array[1..3,1..3] of string;
  i,j,x,y:integer;
  gagne,role,fin:boolean;
  sign,rep:string;

begin
  //initialisation
  role:=false;
  gagne:=false;
  for i:=1 to 3 do
    for j:=1 to 3 do
      t[i,j]:='[ ]';


writeln('  _     _                   _                             _     ___                              ___  ');
writeln(' | |   (_)                 | |                           | |   |  _|                            |_  |');
writeln(' | |_   _    ___   ______  | |_    __ _    ___   ______  | |_  | |     ___   __      __   ___     | |');
writeln(' | __| | |  / __| |______| | __|  / _` |  / __| |______| | __| | |    / _ \  \ \ /\ / /  / _ \    | |');
writeln(' | |_  | | | (__           | |_  | (_| | | (__           | |_  | |   | (_) |  \ V  V /  | (_) |   | |');
writeln('  \__| |_|  \___|           \__|  \__,_|  \___|           \__| | |_   \___/    \_/\_/    \___/   _| |');
writeln('                                                               |___|                            |___|');

  repeat

    repeat

  //displaying the array
  writeln('    1   2   3');  //x axis
  for i:=1 to 3 do
    begin
      write(i,'  '); //y axis
      for j:=1 to 3 do
        write(t[i,j],' ');
      writeln;
    end;
  writeln;

   //inverting role
  role:= not role;

  if (role=false) then
    sign:='[w]'

  else
    sign:='[o]';

  //case's choice

  writeln('   ',sign,'''s turn.');
  writeln('Row :');
  readln(x);

    if((x>0) and (x<=3)) then
      begin
        writeln('Column :');
        readln(y);

        if((y>0) and (y<=3) and (t[x,y]='[ ]')) then
          begin
            t[x,y]:=sign;

            if(((t[1,1] = t[1,2]) and (t[1,2] = t[1,3]) and (t[1,1]<>'[ ]')) or //rows scan
              ((t[2,1] = t[2,2]) and (t[2,2] = t[2,3]) and (t[2,1]<>'[ ]')) or
              ((t[3,1] = t[3,2]) and (t[3,2] = t[3,3]) and (t[3,1]<>'[ ]')) or

              ((t[1,1] = t[2,1]) and (t[2,1] = t[3,1]) and (t[1,1]<>'[ ]')) or //columns scan
              ((t[1,2] = t[2,2]) and (t[2,2] = t[3,2]) and (t[1,2]<>'[ ]')) or
              ((t[1,3] = t[2,3]) and (t[2,3] = t[3,3]) and (t[1,3]<>'[ ]')) or

              ((t[1,1] = t[2,2]) and (t[2,2] = t[3,3]) and (t[1,1]<>'[ ]')) or //diagonals scan
              ((t[1,3] = t[2,2]) and (t[2,2] = t[3,1]) and (t[1,3]<>'[ ]'))) then

                begin

                    //displaying the final array
                  writeln('    1   2   3');  //x axis
                  for i:=1 to 3 do
                    begin
                      write(i,'  '); //y axis
                      for j:=1 to 3 do
                        write(t[i,j],' ');
                         writeln;
                     end;
                  writeln;
                  writeln(sign,' wins.');
                  writeln;

                  gagne:=true;
                  writeln;
                end

                else if((t[1,1]<>'[ ]') and (t[1,2]<>'[ ]') and (t[1,3]<>'[ ]') and (t[2,1]<>'[ ]') and (t[2,2]<>'[ ]') and (t[2,3]<>'[ ]') and (t[3,1]<>'[ ]') and (t[3,2]<>'[ ]') and (t[3,3]<>'[ ]')) then
                  begin
                  //displaying the final array
                  writeln('    1   2   3');  //x axis
                  for i:=1 to 3 do
                    begin
                      write(i,'  '); //y axis
                      for j:=1 to 3 do
                        write(t[i,j],' ');
                         writeln;
                  writeln;
                  writeln('/!\ Draw /!\');

                      gagne:=true;

                  end;
              end;




          end

        else
        begin
          writeln('Error.');
          role:= not role;
         end;
      end;

    until gagne=true;

    repeat
      writeln('Do you want to exit the game ? (yes/no) ');
      readln(rep);
      if(rep='yes') then
        fin:=true
      else if(rep='no') then
        begin
          fin:=false;
          //reset
          role:=false;
          gagne:=false;
          for i:=1 to 3 do
            for j:=1 to 3 do
              t[i,j]:='[ ]';
        end
      else
        writeln('Impossible.');
      until (rep='yes') or (rep='no');

    until fin=true;
end.



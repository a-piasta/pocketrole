uses crt,dos,math;
Const
shop:array[1..17]of string = ('----|- - Iron Sword','-----|-* - Steel Sword','-====(-* - Master Sword','-=====X-* - X-cuter','<=====I=< - Dragon Slayer','<=====)=< - Inquisitor','<=====@=< - Dawnbreaker','Potion','LeatherArmor','Iron Armor','Steel Armor'
,'Plate Armor','Mithril','Egida','Skin of God','Max Health+5','Health full restore');
shop2:array[1..17]of longint = (150,1000,3500,7500,15000,25000,50000,250,250,1500,4500,10000,18500,30000,64000,1000,500);
shop3:array[1..17]of shortint = (2,4,7,10,14,20,35,0,8,12,15,20,28,36,50,0,0);
przec:array[1..10]of string = ('goblin','zombie','ork','troll','war ork','dragon','minor demon','fallen angel','demon','lord of demons');
przech:array[1..10]of word = (50,75,100,150,200,275,350,425,650,1000);
przect:array[1..10]of word = (8,10,20,28,35,55,70,125,175,300);
przechi:array[1..10]of byte = (3,7,10,12,17,22,28,36,42,50);
var
q:text;
thp,ppp,eqa,seet,bigrandom,attacdisable,roznica,tempy,tempx,seed,prawd,czd,wej,pcw,ty,tx,xb,yb,wsp,pppp,eqs,cp,pgold,pp,tt,x,y,wynik,pt,tmhp,phealth,chosen,p,yfight,ent,potki,mphealth,fight,hit,ehit,epotki,ohit,gold,mission,misx,misy,misiteml,
mischar:longint;
kupione:array[1..17]of longint;
wys:byte;
keypress,choose,g,keypresssh:char;
wtf:string;
cheat,misitem:string;
map,over:array[-21..1020,-21..1020]of widechar;
LABEL load;
label fuckit;
label fm;
procedure writewidechar(w:widechar);
var o:word;
begin
o:=ord(w);
if o<=$7F then write(w)
else if o<=$7FF then write(chr(128+64+o div 64),chr(128+o mod 64))
else write(chr(128+64+32+o div 4096),chr(128+o div 64 mod 64),chr(128+o mod 64))
end;
begin
load:
textbackground(1);
textcolor(15);
randomize;
thp:=200;
hit:=1;
tt:=4;
tmhp:=200;
kupione[16]:=200;
kupione[8]:=2;
clrscr;
gold:=1000;
wys:=1;
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
over[y,x]:=' ';
map[y,x]:=' ';
end;
end;
//great wall
for y:=-15 to 1015 do
begin
for x:=-15 to 1015 do
begin
if ((x=0)or(y=0)or(x=1000)or(y=1000))and(x<1001)and(y<1001)and(x>-1)and(y>-1) then
begin
map[y,x]:= #$25A0;
if (x mod 20=0)and(y mod 20=0)then
begin
tempy:=y;
tempx:=x;
map[tempy,tempx]:=#$263A;
map[tempy-1,tempx]:=#$25A0;
map[tempy+1,tempx]:=#$25A0;
map[tempy,tempx-1]:=#$25A0;
map[tempy,tempx+1]:=#$25A0;
map[tempy-1,tempx-1]:=#$25A0;
map[tempy-1,tempx+1]:=#$25A0;
map[tempy+1,tempx-1]:=#$25A0;
map[tempy+1,tempx+1]:=#$25A0;
end;
end;
end;
end;
//flower
if 1=2 then
begin
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
wsp:=x*y;
seed:=random(200)+1;
if (map[y,x]=' ')and(wsp mod seed=0)and(wsp mod 3=0) then over[y,x]:=#$2022;
end;
end;
end;
//lake

for y:=-15 to 1015 do
begin
for x:=-15 to 1015 do
begin
wsp:=x*y;
if wsp<0 then wsp:=wsp*-1;
seed:=random(200)+1;
seet:=random(300)+1;
if ((((wsp mod 350=0) and (wsp mod seed=0)and(map[y,x]=' '))or((map[y+1,x]='~')and(wsp mod seet=0))or((map[y-1,x]='~')and(wsp mod seet=0))or((map[y,x-1]='~')and(wsp mod seet=0))or
((map[y,x+1]='~')and(wsp mod seet=0)))and (not(((x>492)and(x<508))and((y>492)and(y<508)))))and (not((x<3)and(x>-3)))and(not((y<3)and(y>-3)))and(not((x<1003)and(x>997)))and(not((y<1003)and(y>997)))then map[y,x]:='L';
if (map[y,x]='L') then
begin
map[y,x]:='~';
map[y+1,x]:='~';
map[y+1,x+1]:='~';
map[y-1,x]:='~';
map[y-1,x-1]:='~';
map[y,x-1]:='~';
map[y,x+1]:='~';
map[y+1,x-1]:='~';
map[y-1,x+1]:='~';
map[y-2,x]:='~';
map[y-2,x+1]:='~';
map[y-2,x-1]:='~';
map[y+2,x]:='~';
map[y+2,x+1]:='~';
map[y+2,x-1]:='~';
map[y,x+2]:='~';
map[y+1,x+2]:='~';
map[y-1,x+2]:='~';
map[y,x-2]:='~';
map[y+1,x-2]:='~';
map[y-1,x-2]:='~';
end;
end;
end;
//tree
for y:=-15 to 1015 do
begin
for x:=-15 to 1015 do
begin
wsp:=x*y;
if (not((x<3)and(x>-3)))and(not((y<3)and(y>-3)))and(not((x<1003)and(x>997)))and(not((y<1003)and(y>997)))then
begin
seed:=random(200)+1;
if (wsp mod 8=0) and (wsp mod seed=0) and (map[y,x]<>'~')and(map[y,x]<>#$25A0)and (not(((x>492)and(x<508))and((y>492)and(y<508)))) and(map[y-1,x]<>'D')and(map[y+1,x]<>'D')and(map[y,x+1]<>'D')and(map[y,x-1]<>'D') then map[y,x]:='D';
end;
end;
end;

//str house
for y:=5 to 995 do
begin
for x:=5 to 995 do
begin
prawd:=1;
for p:=y-6 to y+6 do
begin
for pp:=x-7 to x+7 do
begin
if map[p,pp]=#$263A then prawd:=prawd+1;
end;
end;
prawd:=prawd*100;
prawd:=300-prawd;
if prawd<1 then prawd:=1;
wsp:=x*y;
if prawd=300 then prawd:=500;
seed:=random(200)+1;
if (wsp mod prawd=0) and (wsp mod seed=0) and (map[y,x]<>'~')and (not(((x>492)and(x<508))and((y>492)and(y<508)))) then
begin
czd:=1;
for p:=y-3 to y+3 do
begin
for pp:=x-3 to x+3 do
begin
if (map[p,pp]='~')or (map[p,pp]=#$255D)or (map[p,pp]=#$2557)or (map[p,pp]=#$255A)or (map[p,pp]=#$2554)or (map[p,pp]=#$2551)or (map[p,pp]=#$2550)then czd:=0;
end;
end;

if czd=1 then
begin
for p:=y-3 to y+3 do
begin
for pp:=x-3 to x+3 do
begin
map[p,pp]:=' ';
end;
end;
map[y,x]:=#$263A;
for p:=y-1 to y+1 do
begin
map[p,x-2]:=#$2551;
map[p,x+2]:=#$2551;
end;
for p:=x-1 to x+1 do
begin
map[y-2,p]:=#$2550;
map[y+2,p]:=#$2550;
end;
map[y-2,x-2]:=#$2554;
map[y+2,x-2]:=#$255A;
map[y-2,x+2]:=#$2557;
map[y+2,x+2]:=#$255D;
wej:=random(4)+1;
if wej=1 then map[y-2,x]:=' ';
if wej=2 then map[y+2,x]:=' ';
if wej=3 then map[y,x-2]:=' ';
if wej=4 then map[y,x+2]:=' ';
end;
end;
end;
end;
//grass
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
wsp:=x*y;
seed:=random(200)+1;
if (map[y,x]=' ')and(wsp mod seed=0)and(wsp mod 3=0)and (not(((x>492)and(x<508))and((y>492)and(y<508)))) then over[y,x]:=#$2591;
end;
end;
//str castle
if 1=2 then
begin
for y:=493 to 507 do
begin
for x:=493 to 507 do
begin
map[y,x]:=' ';
end;
end;
end;
map[501,500]:='M';
map[499,502]:=#$2665;
map[499,498]:=#$263A;
for y:=498 to 502 do
begin
map[y,497]:=#$25A0;
map[y,503]:=#$25A0;
end;
for x:=498 to 502 do
begin
map[497,x]:=#$25A0;
map[503,x]:=#$25A0;
end;
for p:=1 to 4 do
begin
if p=1 then
begin
tempx:=497;
tempy:=497;
end;
if p=2 then
begin
tempx:=503;
tempy:=497;
end;
if p=3 then
begin
tempx:=497;
tempy:=503;
end;
if p=4 then
begin
tempx:=503;
tempy:=503;
end;
map[tempy,tempx]:=#$263A;
map[tempy-1,tempx]:=#$25A0;
map[tempy+1,tempx]:=#$25A0;
map[tempy,tempx-1]:=#$25A0;
map[tempy,tempx+1]:=#$25A0;
map[tempy-1,tempx-1]:=#$25A0;
map[tempy-1,tempx+1]:=#$25A0;
map[tempy+1,tempx-1]:=#$25A0;
map[tempy+1,tempx+1]:=#$25A0;
end;
p:=random(4);
if p=0  then map[500,503]:=' ';
if p=1  then map[503,500]:=' ';
if p=2  then map[500,497]:=' ';
if p=3  then map[497,500]:=' ';
//leaves
for y:=-15 to 1015 do
begin
for x:=-15 to 1015 do
begin
if map[y,x]='D' then
begin
over[y,x]:=#$2592;
over[y+1,x]:=#$2592;
over[y+1,x+1]:=#$2592;
over[y-1,x]:=#$2592;
over[y-1,x-1]:=#$2592;
over[y,x-1]:=#$2592;
over[y,x+1]:=#$2592;
over[y+1,x-1]:=#$2592;
over[y-1,x+1]:=#$2592;
over[y-2,x]:=#$2592;
over[y-2,x+1]:=#$2592;
over[y-2,x-1]:=#$2592;
over[y+2,x]:=#$2592;
over[y+2,x+1]:=#$2592;
over[y+2,x-1]:=#$2592;
over[y,x+2]:=#$2592;
over[y+1,x+2]:=#$2592;
over[y-1,x+2]:=#$2592;
over[y,x-2]:=#$2592;
over[y+1,x-2]:=#$2592;
over[y-1,x-2]:=#$2592;
tx:=500;
ty:=500;
end;
end;
end;
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
if (over[y,x]=#$2592) and (map[y,x]='~') then map[y,x]:=' ';
end;
end;
for y:=-15 to 1015 do
begin
for x:=-15 to 1015 do
begin
if map[y,x]='D' then over[y,x]:=#$2588;
end;
end;
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
if true and (not(((x>492)and(x<508))and((y>492)and(y<508)))) then
begin
wsp:=x*y;
seed:=random(2000)+1;
if (wsp mod 10000=0) and (wsp mod seed=0) and (over[y,x]=' ')and (map[y,x]=' ')then map[y,x]:=#$00A7;
seed:=random(400)+1;
if (wsp mod 5000=0) and (wsp mod seed=0) and (over[y,x]=' ')and (map[y,x]=' ')then map[y,x]:='X';
seed:=random(300)+1;
if (wsp mod 2000=0) and (wsp mod seed=0) and (over[y,x]=' ')and (map[y,x]=' ')then map[y,x]:=#$00D7;
seed:=random(200)+1;
if (wsp mod 800=0) and (wsp mod seed=0) and (over[y,x]=' ')and (map[y,x]=' ')then map[y,x]:='x';
seed:=random(200)+1;
if (wsp mod 500=0) and (wsp mod seed=0) and (over[y,x]=' ')and (map[y,x]=' ')then map[y,x]:=#$263B;

end;
end;
end;
tx:=500;
ty:=500;
//roads
if 1=2 then
begin
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
wsp:=x*y;
seed:=random(200)+1;
seet:=random(4)+1;
if ((wsp mod 243=0) and (wsp mod seed=0) and(map[y,x]=' '))or((map[y+1,x]=#$25A0)and(wsp mod seet=0)and(map[y,x]=' '))or((map[y-1,x]=#$25A0)and(wsp mod seet=0)and(map[y,x]=' '))or((map[y,x-1]=#$25A0)and(wsp mod seet=0)and(map[y,x]=' '))
or((map[y,x+1]=#$25A0)and(wsp mod seet=0)and(map[y,x]=' '))then map[y,x]:=#$25A0;
end;
end;
end;
//portal
for y:=1 to 1000 do
begin
for x:=1 to 1000 do
begin
wsp:=x*y;
seed:=random(500)+1;
if (wsp mod 87=0)and(wsp mod seed=0)and(map[y,x]=' ')and(over[y,x]=' ')and (not(((x>492)and(x<508))and((y>492)and(y<508)))) then map[y,x]:=#$00A4;
end;
end;
//menu

wys:=1;
textbackground(blue);
repeat
clrscr;
textcolor(14);
Writeln('|\ /\  /\ |  |= _|_    _|_ |\ /\ |  |  |=');
textcolor(12);
Writeln('|/ ||  |  |/ |=  |      |  |/ || |  |  |=');
textcolor(10);
Writeln('|  \/  \/ |\ |=  |      |  |\ \/ |_ |_ |=');
textcolor(0);
writeln('1.3');
textcolor(15);
writeln();
writeln();
if wys=1 then writeln('-> New Game');
if wys<>1 then writeln('   New Game');
if wys=2 then writeln('-> Load Game');
if wys<>2 then writeln('   Load Game');
if wys=3 then writeln('-> Quit Game');
if wys<>3 then writeln('   Quit Game');
keypress:=readkey();
if (keypress='w') and (wys>1) then wys:=wys-1;
if (keypress='s') and (wys<3) then wys:=wys+1;
until keypress=#13;
if wys=2 then
begin
textbackground(blue);
textcolor(white);
clrscr;
writeln('What save do you want to load?(0...9)');
repeat
g:=readkey();
until(g='0')or(g='1')or(g='2')or(g='3')or(g='4')or(g='5')or(g='6')or(g='7')or(g='8')or(g='9');
clrscr;
if g='0' then assign(q,'save0.txt');
if g='1' then assign(q,'save1.txt');
if g='2' then assign(q,'save2.txt');
if g='3' then assign(q,'save3.txt');
if g='4' then assign(q,'save4.txt');
if g='5' then assign(q,'save5.txt');
if g='6' then assign(q,'save6.txt');
if g='7' then assign(q,'save7.txt');
if g='8' then assign(q,'save8.txt');
if g='9' then assign(q,'save9.txt');
reset(q);
readln(q,thp);
readln(q,tt);
readln(q,wynik);
readln(q,pt);
readln(q,tmhp);
readln(q,phealth);
readln(q,chosen);
readln(q,p);
readln(q,yfight);
readln(q,ent);
readln(q,potki);
readln(q,mphealth);
readln(q,fight);
readln(q,hit);
readln(q,ehit);
readln(q,epotki);
readln(q,ohit);
readln(q,gold);
readln(q,eqs);
readln(q,eqa);
readln(q,tx);
readln(q,ty);
readln(q,xb);
readln(q,yb);
for p:=1 to 17
do
begin
readln(q,kupione[p]);
end;
for p:=-21 to 1020 do
begin
for pp:=-21 to 1020 do
begin
readln(q,map[p,pp])
end;
end;
for p:=-21 to 1020 do
begin
for pp:=-21 to 1020 do
begin
readln(q,over[p,pp])
end;
end;
close(q);
end;
if wys=3 then ent:=7;
clrscr;
fm:
ent:=0;
while (ent<>2) and (ent<>10) and(ent<>7) do
begin
potki:=kupione[8];
wys:=1;
while ent=0 do
begin
textbackground(lightgreen);
textcolor(black);
keypress:=readkey;
map[ty,tx]:=' ';
if (keypress='a') and ((map[ty,tx-1]=' ')or(map[ty,tx-1]=#$2591)) then tx:=Tx-1;
if (keypress='w') and (map[ty-1,tx]=#$00A4) then
begin
repeat
tx:=random(800)+100;
ty:=random(800)+100;
until map[ty,tx]=#$00A4;
end;
if (keypress='s') and ((map[ty+1,tx]=' ')or(map[ty+1,tx]=#$2591)) then tY:=ty+1;
if (keypress='d') and ((map[ty,tx+1]=' ')or(map[ty,tx+1]=#$2591)) then tx:=tx+1;
if (keypress='w') and ((map[ty-1,tx]=' ')or(map[ty-1,tx]=#$2591)) then ty:=ty-1;
xb:=tx-16;
yb:=ty-10;
map[ty,tx]:=#$2663;
//mapdraw
gotoxy(1,1);
textcolor(black);

write(#13);
for p:=yb to yb+21 do
begin
writewidechar(#$2588);
for pp:=xb to xb+33 do
begin
if (map[p,pp]='~')and(over[p,pp]=' ')  then
begin
textbackground(blue);
textcolor(white);
end;

if (map[p,pp]=#$25A0) then
begin
textcolor(8);
textbackground(7);
end;
if (map[p,pp]=#$2665) then textcolor(12);
if (map[p,pp]='M') then textcolor(14);
if (map[p,pp]='X') or (map[p,pp]='x') or (map[p,pp]=#$00A7) or (map[p,pp]=#$00D7)then textcolor(4);
if (map[p,pp]=#$263B) then textcolor(11);
if (map[p,pp]=#$263A) then textcolor(14);
if (map[p,pp]=#$00A4) then textcolor(13);
if map[p,pp]='D' then textcolor(6);
if (over[p,pp]=#$2591)and(map[p,pp]<>#$2663)then textcolor(16);
if over[p,pp]=' ' then writewidechar(map[p,pp])
else if map[p,pp]<>#$2663 then writewidechar(over[p,pp])
else if (map[p,pp]=#$2663) and (over[p,pp]=#$2592)then writewidechar(#$2593)
else if (map[p,pp]=#$2663) and (over[p,pp]=#$2591)then writewidechar(#$2663);
textcolor(black);
textbackground(lightgreen);
end;
writewidechar(#$2588);
writeln();
end;
for p:=1 to 36 do writewidechar(#$2588);
writeln();
textbackground(white);
writewidechar(#$2588);
write('X=',tx:3,' Y=',ty:3,'     Gold=',gold:13);
writewidechar(#$2588);
writeln();
textbackground(blue);
for p:=1 to 36 do writewidechar(#$2588);

//place (temp)
if keypress=']' then
begin
textbackground(blue);
readln(p);
map[ty-1,tx]:=char(p);
clrscr;
end;
//tp (temp)
if keypress='\' then
begin
textbackground(blue);
readln(tx,ty);
clrscr;
end;
//mission (WIP)
if (map[ty+1,tx]='M')and(keypress='u') then
begin
textbackground(white);
wys:=0;
clrscr;
misiteml:=random(5)+3;
misitem:='';
for p:=1 to misiteml do
begin
mischar:=random(26)+97;
if p=1 then mischar:=mischar-16;
misitem:= misitem+char(mischar);
end;
while ent=0 do
begin
misx:=random(1000);
misy:=random(1000);
if map[misy,misx]=' 'then ent:=1;
end;
repeat
clrscr;
writeln('Bring ',misitem,' from x=',misx,' and y=',misy,'.');
if wys=1 then writeln('   Yes');
if wys=0 then writeln('-> Yes');
if wys=0 then writeln('   No');
if wys=1 then writeln('-> No');
keypress:=readkey();
if (keypress='w')and(wys=1) then wys:=0;
if (keypress='s')and(wys=0) then wys:=1;
until keypress='d';
if wys=0 then
begin
clrscr;
mission:=1;
map[misy,misx]:='@';
end;
keypress:='s';
writeln('LOL');
textbackground(blue);

clrscr;
goto fuckit;
end;
fuckit:
//heal
if ((map[ty-1,tx]=#$2665)or(map[ty+1,tx]=#$2665)or(map[ty,tx+1]=#$2665)or(map[ty,tx-1]=#$2665)) and (keypress='u') then
begin
thp:=tmhp;
end;
//attackdisable
if keypress='/' then attacdisable:=1;
//sklep
if ((map[ty-1,tx]=#$263A)or(map[ty+1,tx]=#$263A)or(map[ty,tx+1]=#$263A)or(map[ty,tx-1]=#$263A)) and (keypress='u') then
begin
textbackground(blue);
textcolor(white);
potki:=kupione[8];
wys:=1;
clrscr;
writeln('               GOLD-',gold);
writeln();
writeln();
for p:=1 to 17 do
begin
if kupione[p]=0 then textcolor(12);
if kupione[p]=1 then textcolor(15);
if ((kupione[p]=1) and (eqa=p)) or ((kupione[p]=1) and (eqs=p)) then textcolor(10);
if (p=8) or (p=16) or (p=17) then textcolor(14);
if wys=p then
begin
writeln('->   ',shop[p],'  CENA-',shop2[p],'  STATY-',shop3[p],'  Kupione-',kupione[p]);
end
else
begin
writeln('     ',shop[p],'  CENA-',shop2[p],'  STATY-',shop3[p],'  Kupione-',kupione[p]);
end;
end;
textcolor(15);
repeat
keypresssh:=readkey();
if (keypresssh='w') and (wys>1) then wys:=wys-1;
if (keypresssh='s') and (wys<17) then wys:=wys+1;
if (keypresssh='k') and (kupione[wys]=0)and (gold>shop2[wys]-1)and (wys<>8) and(wys<>16)and (wys<>17) then
begin
kupione[wys]:=1;
gold:=gold-shop2[wys];
end;
if (keypresssh='k') and (wys=8) and (gold>shop2[wys]-1) then
begin
gold:=gold-shop2[wys];
kupione[wys]:=kupione[wys]+1;
end;
if (keypresssh='k') and (wys=16) and (gold>shop2[wys]-1) then
begin
kupione[wys]:=kupione[wys]+5;
tmhp:=tmhp+5;
gold:=gold-shop2[wys];
end;
if (keypresssh='k') and (wys=17) and (gold>shop2[wys]-1) then
begin
thp:=tmhp;
gold:=gold-shop2[wys];
end;
if (keypresssh='e') and (kupione[wys]=1) and (wys<8) then
begin
hit:=shop3[wys];
eqs:=wys;
end;
if keypresssh='l' then
begin
clrscr;
writeln('All unsaved progress will be lost,continue?');
keypress:=readkey();
if keypress=#13 then
begin
clrscr;
writeln('What save do you want to load?(0...9)');
g:=readkey();
if g='0' then assign(q,'save0.txt');
if g='1' then assign(q,'save1.txt');
if g='2' then assign(q,'save2.txt');
if g='3' then assign(q,'save3.txt');
if g='4' then assign(q,'save4.txt');
if g='5' then assign(q,'save5.txt');
if g='6' then assign(q,'save6.txt');
if g='7' then assign(q,'save7.txt');
if g='8' then assign(q,'save8.txt');
if g='9' then assign(q,'save9.txt');
reset(q);
readln(q,thp);
readln(q,tt);
readln(q,wynik);
readln(q,pt);
readln(q,tmhp);
readln(q,phealth);
readln(q,chosen);
readln(q,p);
readln(q,yfight);
readln(q,ent);
readln(q,potki);
readln(q,mphealth);
readln(q,fight);
readln(q,hit);
readln(q,ehit);
readln(q,epotki);
readln(q,ohit);
readln(q,gold);
readln(q,eqs);
readln(q,eqa);
readln(q,tx);
readln(q,ty);
readln(q,xb);
readln(q,yb);
for p:=1 to 17
do
begin
readln(q,kupione[p]);
end;
for p:=-21 to 1020 do
begin
for pp:=-21 to 1020 do
begin
readln(q,map[p,pp])
end;
end;
for p:=-21 to 1020 do
begin
for pp:=-21 to 1020 do
begin
readln(q,over[p,pp])
end;
end;
close(q);
clrscr;
end;
end;
if (keypresssh='e') and (kupione[wys]=1) and (wys>8)and (wys<>16)and(wys<>17) then
begin
tt:=shop3[wys];
eqa:=wys;
end;
if keypresssh='z' then
begin
clrscr;
writeln('What save do you want to save to?(0...9)');
g:=readkey();
if g='0' then assign(q,'save0.txt');
if g='1' then assign(q,'save1.txt');
if g='2' then assign(q,'save2.txt');
if g='3' then assign(q,'save3.txt');
if g='4' then assign(q,'save4.txt');
if g='5' then assign(q,'save5.txt');
if g='6' then assign(q,'save6.txt');
if g='7' then assign(q,'save7.txt');
if g='8' then assign(q,'save8.txt');
if g='9' then assign(q,'save9.txt');
rewrite(q);
writeln(q,thp);
writeln(q,tt);
writeln(q,wynik);
writeln(q,pt);
writeln(q,tmhp);
writeln(q,phealth);
writeln(q,chosen);
writeln(q,p);
writeln(q,yfight);
writeln(q,ent);
writeln(q,potki);
writeln(q,mphealth);
writeln(q,fight);
writeln(q,hit);
writeln(q,ehit);
writeln(q,epotki);
writeln(q,ohit);
writeln(q,gold);
writeln(q,eqs);
writeln(q,eqa);
writeln(q,tx);
writeln(q,ty);
writeln(q,xb);
writeln(q,yb);
for p:=1 to 17
do
begin
writeln(q,kupione[p]);
end;
for p:=-21 to 1020 do
begin
for pp:=-21 to 1020 do
begin
writeln(q,map[p,pp])
end;
end;
for p:=-21 to 1020 do
begin
for pp:=-21 to 1020 do
begin
writeln(q,over[p,pp])
end;
end;
close(q);
end;
clrscr;
writeln('               GOLD-',gold);
writeln();
writeln();
for p:=1 to 17 do
begin
if kupione[p]=0 then textcolor(12);
if kupione[p]=1 then textcolor(15);
if ((kupione[p]=1) and (eqa=p)) or ((kupione[p]=1) and (eqs=p)) then textcolor(10);
if (p=8) or (p=16)or(p=17) then textcolor(14);
if wys=p then
begin
writeln('->   ',shop[p],'  CENA-',shop2[p],'  STATY-',shop3[p],'  Kupione-',kupione[p]);
end
else
begin
writeln('     ',shop[p],'  CENA-',shop2[p],'  STATY-',shop3[p],'  Kupione-',kupione[p]);
end;
textcolor(15);
end;
until (keypresssh='q')or(keypresssh=#27);
clrscr;
end;
//sklep koniec
//skarb
if (map[ty-1,tx]='x') and (keypress='u') then
begin
gotoxy(18,10);
textbackground(green);
write(' ');
gotoxy(1,1);
pgold:=random(15)+10;
gold:=gold+pgold;
map[ty-1,tx]:=' ';
end;
if (map[ty-1,tx]=#$00D7) and (keypress='u') then
begin
gotoxy(18,10);
textbackground(green);
write(' ');
gotoxy(1,1);
pgold:=random(150)+100;
gold:=gold+pgold;
map[ty-1,tx]:=' ';
end;
if (map[ty-1,tx]='X') and (keypress='u') then
begin
gotoxy(18,10);
textbackground(green);
write(' ');
gotoxy(1,1);
pgold:=random(1500)+1000;
gold:=gold+pgold;
map[ty-1,tx]:=' ';
end;
if (map[ty-1,tx]=#$00A7) and (keypress='u') then
begin
gotoxy(18,10);
textbackground(green);
write(' ');
gotoxy(1,1);
pgold:=random(15000)+10000;
gold:=gold+pgold;
map[ty-1,tx]:=' ';
end;
//skarb koniec
if keypress=#27 then
begin
clrscr;
textcolor(white);
writeln('Realy want to quit- all unsaved progress will be lost');
choose:=readkey();
if choose=#13 then ent:=7;
textbackground(blue);
clrscr;
end;
if keypress='`'then
begin
//cheaty
textbackground(blue);
textcolor(white);
clrscr;
readln(cheat);
if cheat='tokoniec' then phealth:=0-1;
if cheat='adasyey' then gold:=gold+1000000;
if cheat='gold' then gold:=1;
if cheat='portal' then map[ty-2,tx]:=#$00A4;
if cheat='health' then thp:=1;
if cheat='omnomnom' then thp:=tmhp;
if cheat='imagodking' then thp:=10000000;
if cheat='kill' then thp:=-666;
if cheat='colection' then
begin
for cp:= 1 to 15 do
begin
kupione[cp]:=1;
end;
end;
end;
//eq
if keypress='e' then
begin
textbackground(blue);
textcolor(white);
clrscr;
wys:=1;
clrscr;
textcolor(white);
writeln('Gold=',gold);
writeln();
for p:=1 to 15 do
begin
if kupione[p]=0 then textcolor(8);
if kupione[p]=1 then textcolor(white);
if (eqs=p) or (eqa=p)then textcolor(10);
if wys=8 then writeln();
if (wys=p) and (wys<>8) then writeln('-> ',shop[p]:30,' statystyki - ',shop3[p]);
if (wys<>p) and (wys<>8)then writeln('   ',shop[p]:30,' statystyki - ',shop3[p]);
end;
textcolor(white);
writeln('  Press "p" to use potion');
writeln('Defence: ',tt:8);
writeln('Attack:  ',hit:8);
writeln('Score:   ',wynik:8);
writeln('HP:      ',thp:8);
writeln('Max HP   ',tmhp:8);
repeat
keypress:=readkey();
if (keypress='e') and (kupione[wys]=1) and (wys<8) then
begin
hit:=shop3[wys];
hit:=hit+wynik div 3500;
eqs:=wys;
end;
if (keypress='p') and (kupione[8]>0) then
begin
kupione[8]:=kupione[8]-1;
thp:=thp+tmhp div 3;
end;
if (keypress='w') and (wys>1) then wys:=wys-1;
if (keypress='w') and (wys=8) then wys:=7;
if (keypress='s') and (wys<15) then wys:=wys+1;
if (keypress='s') and (wys=8) then wys:=9;
if (keypress='e') and (kupione[wys]=1) and (wys>8)and (wys<>16)and(wys<>17) then
begin
tt:=shop3[wys];
tt:=tt+wynik div 1500;
eqa:=wys;
end;
clrscr;
textcolor(white);
writeln('Gold=',gold);
writeln();
for p:=1 to 15 do
begin
if kupione[p]=0 then textcolor(8);
if kupione[p]=1 then textcolor(white);
if (eqs=p) or (eqa=p)then textcolor(10);
if (wys=p) and (p<16)  then writeln('-> ',shop[p]:30,' statystyki - ',shop3[p]);
if (wys<>p) and (p<16) then writeln('   ',shop[p]:30,' statystyki - ',shop3[p]);
end;
textcolor(white);
writeln('  Press "p" to use potion');
writeln('Defence: ',tt:8);
writeln('Attack:  ',hit:8);
writeln('Score:   ',wynik:8);
writeln('HP:      ',thp:8);
writeln('Max HP   ',tmhp:8);
until (keypress='q')or(keypress=#27);
keypress:=' ';
clrscr;
end ;
//walka
if (map[ty-1,tx]=#$263B)or(map[ty+1,tx]=#$263B)or(map[ty,tx+1]=#$263B)or(map[ty,tx-1]=#$263B)then pcw:=random(2)+1;
bigrandom:=random(50);
if ((map[ty-1,tx]=#$263B) and (keypress='u'))or((map[ty-1,tx]=#$263B)and(pcw=1))or((map[ty+1,tx]=#$263B)and(pcw=1))or((map[ty,tx+1]=#$263B)and(pcw=1))or((map[ty,tx-1]=#$263B)and(pcw=1))or((bigrandom=1)and(attacdisable=0)) then
begin
if map[ty-1,tx]=#$263Bthen map[ty-1,tx]:=' ';
if map[ty+1,tx]=#$263Bthen map[ty+1,tx]:=' ';
if map[ty,tx+1]=#$263Bthen map[ty,tx+1]:=' ';
if map[ty,tx-1]=#$263Bthen map[ty,tx-1]:=' ';
potki:=kupione[8];
if ent<>10 then
begin
clrscr;
ppp:=random(2);
if ppp=0 then
begin
pppp:=random(10)+3;
roznica:=tt div pppp;
pt:=tt-roznica;
end
else
begin
pppp:=random(10)+4;
roznica:=tt div pppp;
pt:=tt+roznica;
end;
if pt<1 then pt:=1;
ppp:=random(2);
if ppp=0 then
begin
pppp:=random(10)+3;
roznica:=tmhp div pppp;
phealth:=tmhp-roznica;
end
else
begin
pppp:=random(10)+4;
roznica:=tmhp div pppp;
phealth:=tmhp+roznica;
end;
ppp:=random(2);
if ppp=0 then
begin
pppp:=random(10)+3;
roznica:=hit div pppp;
ohit:=hit-roznica;
end
else
begin
pppp:=random(10)+4;
roznica:=hit div pppp;
ohit:=hit+roznica;
end;
if ohit<4 then ohit:=4;
mphealth:=phealth;
clrscr;
chosen:=phealth+ohit*10+pt*10;
chosen:=chosen div 250;
if chosen>10 then chosen:=10;
if chosen<1 then chosen:=1;
epotki:=chosen;
end;
if ent<>10 then ent:=0;
repeat
textbackground(blue);
textcolor(white);
clrscr;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
choose:=readkey();
if choose='`'then
begin
//cheaty
readln(cheat);
if cheat='adasyey' then gold:=gold+1000000;
if cheat='gold' then gold:=1;
if cheat='portal' then map[ty+2,tx]:=#$00A4;
if cheat='health' then thp:=1;
if cheat='omnomnom' then thp:=tmhp;
if cheat='imagodking' then thp:=10000000;
if cheat='kill' then thp:=-666;
if cheat='colection' then
begin
for cp:= 1 to 15 do
begin
kupione[cp]:=1;
end;
end;
end;
if (choose<>'1')and(choose<>'2')and(choose<>'3')and(choose<>'4')and(choose<>'`') then
begin
textcolor(12);
writeln('WHAT ARE YOU DOING!!! IT IS NOT TIME TO REST.');
textcolor(15);
readkey;
clrscr;
end;
if (choose='1') or (choose='3') then
begin
fight:=random(8999)+1000;
writeln(fight);
if choose='1' then delay(140);
if choose='3' then delay(105);
clrscr;
readln(yfight);
if yfight=fight then
begin
if pt<20*hit then
begin
phealth:=phealth-(20*hit)+pt;
if choose='3' then phealth:=phealth-pt;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('CRITICAL!!!');
readkey();
clrscr;
end;
end
else if (fight mod 10<>yfight mod 10) and (fight div 10 mod 10<>yfight div  10 mod 10) and (fight div 100 mod 10<>yfight div 100 mod 10) and (fight div 1000<>yfight div 1000)then
begin
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('You miss!');
readkey();
clrscr;
end
else if (fight mod 10<>yfight mod 10) or (fight div 10 mod 10<>yfight div  10 mod 10) or (fight div 100 mod 10<>yfight div 100 mod 10) or (fight div 1000<>yfight div 1000)then
begin
if pt<10*hit then
begin
phealth:=phealth-(10*hit)+pt;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('You hit!');
readkey();
clrscr;
end;
end
else
begin
if pt<5*hit then
begin
phealth:=phealth-(5*hit)+pt;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('Just a scrach.');
 readkey();
clrscr;
end;
end;
if phealth<1 then
begin
wynik:=wynik+mphealth;
gold:=gold+(2*mphealth);
end;
end;
if choose='4' then
begin
fight:=random(89999)+10000;
writeln(fight);
delay(195);
clrscr;
readln(yfight);
if yfight=fight then
begin
if pt<35*hit then
begin
phealth:=phealth-(35*hit)+pt;
if choose='3' then phealth:=phealth-pt;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('GREAT CRITICAL!!!');
readkey();
clrscr;
end;
end
else if (fight mod 10<>yfight mod 10) and (fight div 10 mod 10<>yfight div  10 mod 10) and (fight div 100 mod 10<>yfight div 100 mod 10) and (fight div 1000 mod 10<>yfight div 1000 mod 10)and (fight div 10000<>yfight div 10000)then
begin
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('You miss!');
readkey();
clrscr;
end
else if (fight mod 10<>yfight mod 10) or (fight div 10 mod 10<>yfight div  10 mod 10) or (fight div 100 mod 10<>yfight div 100 mod 10) or (fight div 1000 mod 10<>yfight div 1000 mod 10)or (fight div 10000<>yfight div 10000) then
begin
if pt<18*hit then
begin
phealth:=phealth-(18*hit)+pt;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('You hit!');
readkey();
clrscr;
end;
end
else
begin
if pt<7*hit then
begin
phealth:=phealth-(7*hit)+pt;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
writeln('Just a scrach.');
 readkey();
clrscr;
end;
end;
if phealth<1 then
begin
ent:=1;
wynik:=wynik+mphealth;
gold:=gold+(2*mphealth);
end;
end;
if choose='2' then
begin
if potki>0 then
begin;
potki:=potki-1;
thp:=thp+(tmhp div 3);
if thp>tmhp then thp:=tmhp;
writeln('Helth restored +',tmhp div 3);
readkey();
kupione[8]:=potki;
clrscr;
end
else
begin
writeln('You tried to use potion but you had none in your inventory');
readkey();
clrscr;
end;
end;
//walkaprzec
if phealth<1 then
begin
ent:=1;
wynik:=wynik+mphealth;
gold:=gold+(2*mphealth);
end;
clrscr;
writeln('You                   ',przec[chosen]:30);
writeln(thp:5,'                                          ',phealth);
writeln('____________________________________________________');
writeln('1-fight                   2-heal(',potki,')');
writeln('3-fast hit                4-great hit');
if (phealth<mphealth div 5) and (epotki>0) then
begin
epotki:=epotki-1;
phealth:=phealth+(mphealth div 3);
writeln('Enemy heals himself!');
readkey();
clrscr;
end
else
begin
ehit:=random(18)+1;
if (ehit=6)or (ehit=12) then
begin
if tt<ohit*20 then
begin
thp:=thp-(ohit*20)+tt;
writeln('CRITICAL!!!');
readkey();
clrscr;
end;
end;
if (ehit=1)or(ehit=7) then
begin
writeln('Enemy missed!');
readkey();
clrscr;
end;
if (ehit=2)or(ehit=8)or(ehit=11) then
begin
writeln('It was just a scratch.');
readkey();
clrscr;
if tt<ohit*5 then
begin
thp:=thp-(ohit*5)+tt;
end;
end;
if (ehit=3)or(ehit=4)or(ehit=9)or(ehit=10)or(ehit=5) then
begin
writeln('Enemy hits!');
readkey();
clrscr;
if tt<ohit*10 then
begin
thp:=thp-(ohit*10)+tt;
end;
end;
if ehit=18 then
begin
thp:=thp-(ohit*35)+tt;
if tt<ohit*35 then
begin
writeln('GREAT CRITICAL!!!');
readkey();
clrscr;
end;
end;
if ehit=13  then
begin
writeln('Enemy missed!');
readkey();
clrscr;
end;
if (ehit=14)or(ehit=15) then
begin
writeln('It was just a scratch.');
readkey();
clrscr;
if tt<ohit*7 then
begin
thp:=thp-(ohit*7)+tt;
end;
end;
if (ehit=16)or(ehit=17) then
begin
writeln('Enemy hits!');
readkey();
clrscr;
if tt<ohit*18 then
begin
thp:=thp-(ohit*18)+tt;
end;
end;
clrscr;
if thp<1 then ent:=2;
end;
until ent<>0;
if ent=1 then goto fm;
//walka koniec
end;
end;
end;
clrscr;

if ent<>7 then
begin
textcolor(lightred);
textbackground(white);
clrscr;
for p:=1 to 5do writeln();
writeln('                          You was slain by ',przec[chosen]);
writeln('                                 SCORE-',wynik);
writeln();
writeln('            Press "m" to return to menu or anything else to quit...');
keypress:=readkey();
if keypress='m' then
begin
ent:=0;
goto load;
end;
end;
end.


//1111 YEY!

program phamwyruszanawyprawedokrainyzlagdzieazroisieodpotworkownieujawniajacceludocieradomiastagdziepoujawnieniuzejestphamemspotykaswojamiloscktorejszukaniebylocelemcalejwyprawyicoprowadzidowygranejwsposobphamskialeinaczejsienieda;
uses crt;
const
constsp:longint = 20;
constsam:longint = 6;
dsam:array[1..6]of char = ('A','E','I','O','U','Y');
sam:array[1..6]of char = ('a','e','i','o','u','y');
sp:array[1..20]of char = ('b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','z');
dsp:array[1..20]of char = ('B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T','V','W','X','Z');
armorName:array[0..6]of string = ('null','Head','Chest','Hands','Legs','Feet','Shield');
type project = record
  tf,pow,d,col,cd,x,y:longint;
  a:boolean;
end;
type Vector2 = record
  x,y:longint;
end;
type item = record
  p,h,id,cd,w,z,rar:longint;
  nm:string;
end;
type drop = record
  t,w,x,y:longint;
end;
type merchant = record
  o:array[0..1000] of longint;
  typ,sprc,bprc,dc:longint;
end;
type city = record
  pop,cash,x,y,who,dpop:longint;
  nm:string;
end;
type enemyType = record
  id,hp,cd,mcd,col,ri,ro,dol,pow,xp,rar,cs,ran:longint;
  c:string;
  nm:string;
  ih,ch:boolean;
end;
type enemy = record
  id,x,y,hp,thp,cd,mcd,om,fc,mode,at:longint;
  a,rg:boolean;
  target:Vector2;
end;
type player = record
  x,y,hp,scr,cash,mhp,gm,speed:longint;
  nm:string;
  rep:array[0..7]of longint;
  dmgprc,xpprc,dropprc,waterprc:extended;
end;
type structure = record
  rar:longint;
  name:string;
  struct:array of string;
end;
type terrain = record
  n:string;
  id,bc,tc:longint;
  tile:char;
  a:boolean;
  meta:array of shortint;
end;
type queue = record
  b,e:longint;
  q:array of longint;
end;
function trans(w:word): string;
var s:string;
begin
  s := '';
  if w<$7F then s:=char(w)
  else if w<=$7FF then s:=char(128+64+w div 64)+chr(128+w mod 64)
  else s:=chr(128+64+32+w div 4096)+chr(128+w div 64 mod 64)+chr(128+w mod 64);
  trans:=s;
end;
procedure writewidechar(w:widechar);
var o:word;
begin
  o:=ord(w);
  if o<=$7F then write(w)
  else if o<=$7FF then write(chr(128+64+o div 64),chr(128+o mod 64))
  else write(chr(128+64+32+o div 4096),chr(128+o div 64 mod 64),chr(128+o mod 64))
end;
function recalc(u: word): word;
begin
  recalc:=u;
  case u of
    0: recalc:=0;
    1: recalc:=$263A;
    2: recalc:=$263B;
    3: recalc:=$2665;
    4: recalc:=$2666;
    5: recalc:=$2663;
    6: recalc:=$2660;
    7: recalc:=$2022;
    8: recalc:=$25D8;
    9: recalc:=$25CB;
    10: recalc:=$25D9;
    11: recalc:=$2642;
    12: recalc:=$2640;
    13: recalc:=$266A;
    14: recalc:=$266B;
    15: recalc:=$263C;
    16: recalc:=$25BA;
    17: recalc:=$25C4;
    18: recalc:=$2195;
    19: recalc:=$203C;
    20: recalc:=$00B6;
    21: recalc:=$00A7;
    22: recalc:=$25AC;
    23: recalc:=$21A8;
    24: recalc:=$2191;
    25: recalc:=$2193;
    26: recalc:=$2192;
    27: recalc:=$2190;
    28: recalc:=$221F;
    29: recalc:=$2194;
    30: recalc:=$25B2;
    31: recalc:=$25BC;
    176: recalc:=$2591;
    177: recalc:=$2592;
    178: recalc:=$2593;
    179: recalc:=$2502;
    180: recalc:=$2524;
    181: recalc:=$2561;
    182: recalc:=$2562;
    183: recalc:=$2556;
    184: recalc:=$2555;
    185: recalc:=$2563;
    186: recalc:=$2551;
    187: recalc:=$2557;
    188: recalc:=$255D;
    189: recalc:=$255C;
    190: recalc:=$255B;
    191: recalc:=$2510;
    192: recalc:=$2514;
    193: recalc:=$2534;
    194: recalc:=$252C;
    195: recalc:=$251C;
    196: recalc:=$2500;
    197: recalc:=$253C;
    198: recalc:=$255E;
    199: recalc:=$255F;
    200: recalc:=$255A;
    201: recalc:=$2554;
    202: recalc:=$2569;
    203: recalc:=$2566;
    204: recalc:=$2560;
    205: recalc:=$2550;
    206: recalc:=$256C;
    207: recalc:=$2567;
    208: recalc:=$2568;
    209: recalc:=$2564;
    210: recalc:=$2565;
    211: recalc:=$2559;
    212: recalc:=$2558;
    213: recalc:=$2552;
    214: recalc:=$2553;
    215: recalc:=$256B;
    216: recalc:=$256A;
    217: recalc:=$2518;
    218: recalc:=$250C;
    219: recalc:=$2588;
    220: recalc:=$2584;
    221: recalc:=$258C;
    222: recalc:=$2590;
    223: recalc:=$2580;
    224: recalc:=$03B1;
    225: recalc:=$00DF;
    226: recalc:=$0393;
    227: recalc:=$03C0;
    228: recalc:=$03A3;
    229: recalc:=$03C3;
    230: recalc:=$00B5;
    231: recalc:=$03C4;
    232: recalc:=$03A6;
    233: recalc:=$0398;
    234: recalc:=$03A9;
    235: recalc:=$03B4;
    236: recalc:=$221E;
    237: recalc:=$03C6;
    238: recalc:=$03B5;
    239: recalc:=$2229;
    240: recalc:=$2261;
    241: recalc:=$00B1;
    242: recalc:=$2265;
    243: recalc:=$2264;
    244: recalc:=$2320;
    245: recalc:=$2321;
    246: recalc:=$00F7;
    247: recalc:=$2248;
    248: recalc:=$00B0;
    249: recalc:=$2219;
    250: recalc:=$00B7;
    251: recalc:=$221A;
    252: recalc:=$207F;
    253: recalc:=$00B2;
    254: recalc:=$25A0;
    255: recalc:=$00A0;
  end;
end;
procedure print(u:char);
var o:word;
begin
  if (ord(u)>=32) and (ord(u)<=127) then write(u)
  else begin
    o := recalc(ord(u));
    writewidechar(widechar(o));
  end;
end;
var
cmap,umap,map,pmap,t,t2,smap:array[-100..1100,-100..1100]of longint;{}
queu:array[1..1000000]of Vector2;
qp,qk,qs:longint;
ter:array[0..1000]of terrain;{}
tc:array[0..100000]of city;{}
tu:array[0..1000000]of enemy;{}
ti:array[0..1000]of item;{}
eq:array[0..1000]of longint;{}
tm:array[0..100000]of merchant;
tp:array[0..1000]of project;{}
nums:array[0..9]of longint;{}
armor:array[0..6]of longint;{}
tet:array[0..100]of enemyType;{}
tst:array[0..100]of structure;{}
dter:array[#0..#255]of longint;{}
credits:array[-20..10000]of string;{}
s3,s4,popstr:string;{}
clearqueue:array of longint;{}
irarsum:int64;{}
dl,p,pp,amulet,structg,badTimer,kier,entcity,cn,ran,ent,cos1,p4,p3,mcd,strn,terc,en,etn,cooldown,som,ren,loat,itn,ci,hm,tick,ecounter,sn,blk,rarsum,pn,rpn,pcounter,creditsn:longint;
b,e,v:Vector2;{}
spawnrate:longint;{}
me:player;
isDemonic,canRule : boolean;{}
txt:text;{}
c,wc:char;{}
operator = (v1,v2:Vector2) o:boolean;
begin
  if (v1.x=v2.x)and(v1.y=v2.y) then o:=true else o:=false;
end;

function getCityName():string;
Var
i1,i2,i3,r1,r2:longint;
s:string;
begin
	r1 := random(123456789);
	i1 := r1 mod 6;
	i2 := r1 mod 20;
	r2 := random(r1);
	for i3 := 1 to r1 mod 5 do begin
		if r1 > r2 then r1 := r1 - r2
		else r2 := r2 - r1;
	end;
	i1 := i1 + r1 * r2;
	i2 := i2 + r1 * r2;
	setlength(s, 5);
	s[1] := sp[i1 mod 20 + 1];
	s[2] := sam[i1 mod 6 + 1];
	s[3] := sp[i2 mod 20 + 1];
	s[4] := sam[i2 mod 6 + 1];
	s[5] := sp[(i1 + i2) mod 20];
	if (s[1] <> s[3]) then getcityname := s
	else getcityname := 'Prezes jest zajebisty';
end;
function ctChar(x,y:longint):char;
var
n1,n2:longint;
begin
n1:=(x*y)mod 13;
n2:=(x*y)mod 11;
ctChar:=char((n1+n2)mod 3+176);
end;
procedure mergeCities(m1,m2:longint);
var
pr,l:longint;
begin
  tc[m2].pop:=tc[m2].pop+tc[m1].pop;
  tc[m1].pop:=0;
  tc[m2].cash:=tc[m2].cash+tc[m1].pop;
  tc[m1].cash:=0;
  tc[m2].dpop:=tc[m2].dpop+tc[m1].pop;
  tc[m1].dpop:=0;
  //tm[m2].sprc:=(tm[m2].sprc+tm[m1].sprc)div 2;
  //tm[m2].bprc:=(tm[m2].bprc+tm[m1].bprc)div 2;
  for pr:=0 to 1000 do
  begin
    tm[m2].o[pr]:=tm[m2].o[pr]+tm[m1].o[pr];
    tm[m1].o[pr]:=0;
  end;
end;
function strink(a:longint):string;
var
s10:string;
begin
str(a,s10);
strink:=s10;
end;
procedure battleBossLvl();
begin

end;
procedure setRep();
var
pr:longint;
begin
  for pr:=0to 7 do me.rep[pr]:=2500;
end;
procedure battleLvl(i:longint);
begin

end;
function clear():queue;
begin
  clear.b:=1;
  clear.e:=0;
  clear.q:=clearqueue;
end;

function terrainNamed(s:string):longint;
var
pr:longint;
begin
  for pr:=1 to terc do
  begin
    if ter[pr].n=s then terrainNamed:=pr;
  end;
end;
procedure inBattletower(xc,yc,i:longint);
var
pr,pr2,yl,bosslvl:longint;
begin
  yl:=0;
  bosslvl:=random(6)+3;
  for pr:=-3 to 3 do
  begin
    for pr2:=-3 to 3 do
    begin
      if (map[xc+pr2,yc+pr]<>0)and(i=smap[xc+pr2,yc+pr]) then
      begin
        if random(2)=0 then map[xc+pr2,yc+pr]:=terrainNamed('Stone Wall') else map[xc+pr2,yc+pr]:=0;
      end;
    end;
  end;
  while (yl-1<bosslvl)and(ent=0)do
  begin
    if yl=bosslvl then battleBossLvl() else battleLvl(yl);
    inc(yl);
  end;
end;
function moveMap(v:vector2):longint;
begin
  moveMap:=t[v.x,v.y];
end;
function Vector(v1,v2:longint):Vector2;
begin
  Vector.x:=v1;
  Vector.y:=v2;
end;
procedure qclear();
var
pr:longint;
begin
  qp:=1;
  qk:=0;
  qs:=0;
end;
procedure qadd(v:Vector2);
begin
inc(qk);
inc(qs);
queu[qk]:=v;
end;
function qempty():boolean;
begin
qempty:=qs=0;
end;
function qpop():Vector2;
begin
qpop:=queu[qp];
inc(qp);
dec(qs);
end;
function enemyTypeActive(s1:string):boolean;
var
rp:longint;
begin
  enemyTypeActive:=false;
  for rp:=1 to etn do
  begin
    if tet[rp].nm=s1 then enemyTypeActive:=true;
  end;
end;
function max(v1,v2:longint):longint;
begin
  if v1>v2 then max:=v1 else max:=v2;
end;
function min(v1,v2:longint):longint;
begin
  if v1<v2 then min:=v1 else min:=v2;
end;
function canEnter(igrek,iks:longint;ih:boolean):boolean;
begin
  canEnter:=ter[map[iks,igrek]].a;
  if cmap[iks,igrek]<>0 then canEnter:=not(ih);
  //if umap[iks,igrek]<>0 then canEnter:=false;
  if map[iks,igrek]=1 then canEnter:=false;
end;
procedure setTarget(int:longint);
var
v:Vector2;
wc1:longint;
begin
wc1:=0;
v:=Vector(tu[int].x+random(5)-2,tu[int].y+random(5)-2);
while (not(canEnter(v.x,v.y,true)))and(wc1<100)do 
begin
  inc(wc);
  v:=Vector(tu[int].x+random(5)-2,tu[int].y+random(5)-2);
end;
if wc1=100 then v:=Vector(tu[int].x,tu[int].y);
textcolor(white);
tu[int].target:=v;
end;
function itemNamed(s:string):longint;
var
i:longint;
begin
  i:=0;
  while (i <= 1000) and (ti[i].nm <> s) do begin
    inc(i);
  end;
  itemNamed:=i;
end;
procedure fab1();
Var
prp:longint;
begin
	for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('Pham wszedl do miasta');
    if prp=3 then writeln(' tylko na chwile, by ');
    if prp=4 then writeln('uzupelnic zapasy. Ale');
    if prp=5 then writeln('  zagadal do niego   ');
    if prp=6 then writeln('fajny murzyn ktory   ');
    if prp=7 then writeln(' powiedzial ze powie ');
    if prp=8 then writeln('  mu jak uciec z tej ');
    if prp=9 then writeln('  strasznej krainy   ');
    if prp=10 then writeln('pod warunkiem ze     ');
    if prp=11 then writeln('zaplaci mu hajj$$$!! ');
    if prp=12 then writeln(' Jednak droga ta jest');
    if prp=13 then writeln(' bardzo niebezpieczna');
    if prp=14 then writeln(' dlatego powinien sie');
    if prp=15 then writeln(' dobrze przygotowac. ');
    if (prp>15) then writeln('                     ');
  end;
  while c<>#13 do c:=readkey();
  ent := 0;
  entCity := 1;
end;
procedure fab4();
Var
prp:longint;
begin
	for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('       O NIE!        ');
    if prp=3 then writeln(' Fajny murzyn okazal ');
    if prp=4 then writeln('sie niefajny i uciekl');
    if prp=5 then writeln('    z twoim haisem.  ');
    if prp=6 then writeln('   Gdy zglaczasz to  ');
    if prp=7 then writeln('     Burmistrzowi,   ');
    if prp=8 then writeln('  dowiadujesz sie ze ');
    if prp=9 then writeln('  ten koles byl zlym ');
    if prp=10 then writeln('   czarnym magiem.   ');
    if prp=11 then writeln('  Mozliwe ze za tak  ');
    if prp=12 then writeln('  duzo haisu murzyn  ');
    if prp=13 then writeln('jest w stanie zrobic ');
    if prp=14 then writeln('   swiau cos bardzo  ');
    if prp=15 then writeln('zlego i demonicznrgo.');
    if (prp>15) then writeln('                     ');
  end;
  while c<>#13 do c:=readkey();
  ent := 0;
  isDemonic:=true;
  spawnrate:=60;
  entCity := 5;
end;
procedure fab3();
Var
prp:longint;
begin
	for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('Fajny murzyn oznajmil');
    if prp=3 then writeln('   ze potrzebuje juz ');
    if prp=4 then writeln('tylko 10 soul shardow');
    if prp=5 then writeln(' ktore sa            ');
    if prp=6 then writeln('niezbedne do otwarcia');
    if prp=7 then writeln('    portalu do innej ');
    if prp=8 then writeln(' krainy, znacznie    ');
    if prp=9 then writeln('    przyjemniejszej  ');
    if prp=10 then writeln('                     ');
    if prp=11 then writeln('                     ');
    if prp=12 then writeln(' Mozesz je zdobyc    ');
    if prp=13 then writeln('   z najsilniejszych ');
    if prp=14 then writeln('  potworow           ');
    if prp=16 then writeln('                     ');
    if prp=15 then writeln('                     ');
    if (prp>16) then writeln('                     ');
  end;
  c:=readkey();
  entCity := 4;
  while c<>#13 do c:=readkey();
  ent := 0;
end;
procedure fab2();
Var
prp:longint;
begin
	for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('Pham wszedl do miasta');
    if prp=3 then writeln(' tylko na chwile, by ');
    if prp=4 then writeln('uzupelnic zapasy. Ale');
    if prp=5 then writeln('  zagadal do niego   ');
    if prp=6 then writeln('fajny murzyn ktory   ');
    if prp=7 then writeln(' powiedzial ze pham  ');
    if prp=8 then writeln(' ma juz wystarczajaco');
    if prp=9 then writeln('  duzo hajsu zeby    ');
    if prp=10 then writeln('   mu zaplacic       ');
    if prp=11 then writeln('                     ');
    if prp=12 then writeln(' Jezeli chcesz mu    ');
    if prp=13 then writeln('zaplacic (10000$)    ');
    if prp=14 then writeln('   i kontynuowac     ');
    if prp=16 then writeln('wcisnij t            ');
    if prp=15 then writeln('niebezpiecznego deala');
    if (prp>16) then writeln('                     ');
  end;
  c:=readkey();
  entCity := 2;
  if (c <> 't') then ent := 0
  else begin
	//badTimer := 0;
	fab3();
	dec(me.cash, 10000);
	entCity := 3;
  end;
end;
procedure fab5();
Var
prp:longint;
begin
	for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('Pham wszedl do miasta');
    if prp=3 then writeln(' tylko na chwile, by ');
    if prp=4 then writeln('uzupelnic zapasy. Ale');
    if prp=5 then writeln('  zagadal do niego   ');
    if prp=6 then writeln('fajny murzyn ktory   ');
    if prp=7 then writeln(' powiedzial ze pham  ');
    if prp=8 then writeln(' ma juz wystarczajaco');
    if prp=9 then writeln('  duzo soul shardow  ');
    if prp=10 then writeln('  by otworzyc portal ');
    if prp=11 then writeln('                     ');
    if prp=12 then writeln(' Jezeli chcesz mu    ');
    if prp=13 then writeln('je dac (10)          ');
    if prp=14 then writeln('   i wyruszyc w      ');
    if prp=16 then writeln('wcisnij t            ');
    if prp=15 then writeln('nie bezpieczna droge ');
    if (prp>16) then writeln('                     ');
  end;
  c:=readkey();
  entCity := 4;
  if (c <> 't') then ent := 0
  else begin
	badTimer := 0;
	fab4();
	dec(eq[itemNamed('Soul Shard')], 10);
	entCity := 5;
  end;
end;
procedure back();
begin
  if t2[v.x,v.y+1]=t2[v.x,v.y]-1 then v:=Vector(v.x,v.y+1)
  else if t2[v.x+1,v.y]=t2[v.x,v.y]-1 then v:=Vector(v.x+1,v.y)
  else if t2[v.x,v.y-1]=t2[v.x,v.y]-1 then v:=Vector(v.x,v.y-1)
  else if t2[v.x-1,v.y]=t2[v.x,v.y]-1 then v:=Vector(v.x-1,v.y);
end;
function getNearestCity(i:longint):Vector2;
var
pr,odl:longint;
begin
  odl:=10000;
  for pr:=1 to cn do
  begin
    if (tc[pr].who=tet[tu[i].id].col-8)and(abs(tc[pr].x-tu[i].x)+abs(tc[pr].y-tu[pr].y)<odl) then
    begin
      odl:=abs(tc[pr].x-tu[i].x)+abs(tc[pr].y-tu[i].y);
      getNearestCity.x:=tc[pr].x;
      getNearestCity.y:=tc[pr].y;
    end;
  end;
  if odl>-1 then getNearestCity:=Vector(-1,-1);
end;
function getTarget(i:longint):Vector2;
begin
  getTarget:=Vector(tu[i].x+random(5)-3,tu[i].y+random(5)-3);
  while not(canEnter(getTarget.y,getTarget.x,tet[tu[i].id].ih)) do getTarget:=Vector(tu[i].x+random(5)-3,tu[i].y+random(5)-3);
  if tu[i].rg then getTarget:=Vector(me.x,me.y) else
  begin
    if tu[i].fc<>0 then getTarget:=Vector(tu[tu[i].fc].x,tu[tu[i].fc].y) else
    begin
      if tet[tu[i].id].ih then
      begin

      end
    end;
  end;
end;
procedure addStructure(str:array of string;name:string;rar:longint);
var
pr,pr2:longint;
struct1:structure;
begin
  inc(strn);
  writeln('Registering Structure ',name,' with number ',strn);
  struct1.name:=name;
  setlength(struct1.struct,length(str));
  for pr:=0 to length(str)-1 do
  begin
    struct1.struct[pr]:=str[pr];
  end;
  struct1.rar:=rar;
  writeln('Created');
  tst[strn]:=struct1;
  writeln('Saved');

end;

procedure genStructure(i,x,y:longint);
var
pr,pr2:longint;
begin
  inc(structg);
  for pr:=1 to length(tst[i].struct[1]) do
  begin
    for pr2:=0 to length(tst[i].struct)-1do
    begin
      if (tst[i].struct[pr2][pr]<>' ')and(smap[x+pr,y+pr2]=0)and(cmap[x+pr,y+pr2]=0) then
      begin
        map[x+pr,y+pr2]:=dter[tst[i].struct[pr2][pr]];
        smap[x+pr,y+pr2]:=structg;
      end;
    end;
  end;
end;
procedure setPlayerTarget(int:longint);
begin
  tu[int].target:=Vector(me.x,me.y);
end;
procedure setMobTarget(int,tar:longint);
begin
  tu[int].target:=Vector(tu[tar].x,tu[tar].y);
end;
procedure setAttackTarget(int,tar:longint);
begin
  tu[int].at:=tar;
end;
procedure bfs(v:Vector2);
var
r:longint;
begin
  r:=t2[v.x,v.y];
  if (t[v.x-1,v.y]=0)and(t2[v.x-1,v.y]>r+1)then 
  begin
    t2[v.x-1,v.y]:=r+1;
    qadd(Vector(v.x-1,v.y));
  end;
  if (t[v.x+1,v.y]=0)and(t2[v.x+1,v.y]>r+1)then 
  begin
    t2[v.x+1,v.y]:=r+1;
    qadd(Vector(v.x+1,v.y));
  end;
  if (t[v.x,v.y-1]=0)and(t2[v.x,v.y-1]>r+1)then
  begin
    t2[v.x,v.y-1]:=r+1;
    qadd(Vector(v.x,v.y-1));
  end;
  if (t[v.x,v.y+1]=0)and(t2[v.x,v.y+1]>r+1)then
  begin
    t2[v.x,v.y+1]:=r+1;
    qadd(Vector(v.x,v.y+1));
  end;
end;
function getMobPath(i,fleeing:longint):Vector2;
var
done,pr1,pr2,bord,wc2:longint;
lgr,pdr,twp:Vector2;
continue:boolean;
begin
  done:=0;
  b:=Vector(tu[i].x,tu[i].y);
  twp:=Vector(tu[i].x,tu[i].y);
  getMobPath:=b;
  e:=tu[i].target;
  continue:=true;
  if b=e then continue:=false;
  if continue then
  begin
  lgr:=Vector(min(b.x,e.x),min(b.y,e.y));
  pdr:=Vector(max(b.x,e.x),max(b.y,e.y));
  bord:=0;
  for pr1:=lgr.x-2 to pdr.x+2 do
  begin
    for pr2:=lgr.y-2 to pdr.y+2 do
    begin
      if canEnter(pr1,pr2,tet[tu[i].id].ih) then t[pr1,pr2]:=0 else t[pr1,pr2]:=1;
      t2[pr1,pr2]:=100000;
    end;
  end;
  for pr1:=lgr.x-3 to pdr.x+3 do 
  begin
    t[pr1,lgr.y-1]:=1;
    t[pr1,pdr.y+1]:=1;
  end;
  for pr2:=lgr.y-3 to pdr.y+3 do
  begin
    t[lgr.x-1,pr2]:=1;
    t[pdr.x+1,pr2]:=1;
  end;
  t2[e.x,e.y]:=0;
  qclear();
  qadd(e);
  while not qempty() do 
  begin
    bfs(qpop());
  end;
  if t2[b.x,b.y]<100000 then
  begin
    wc2:=0;
    while (t2[e.x,e.y]<>t2[b.x,b.y]+fleeing)and(wc2<100) do
    begin
      e:=Vector(b.x+random(3)-1,b.y+random(3)-1);
      inc(wc2);
    end;
    if wc2=100 then e:=twp;
    getMobPath:=e;
  end;
  end;
end;
procedure projectiles(i:longint);
var
pr1,wspa:longint;
begin
  if tp[i].a then
  begin
    if (umap[tp[i].y,tp[i].x]<>0)and(tp[i].a) then
    begin
      tp[i].a:=false;
      tu[umap[tp[i].y,tp[i].x]].thp:=tu[umap[tp[i].y,tp[i].x]].thp+tp[i].pow;
    end;
    pmap[tp[i].y,tp[i].x]:=0;
    inc(tp[i].cd);
    if tp[i].cd>0 then
    begin
      tp[i].cd:=0;
      dec(tp[i].tf);
      if tp[i].d=1 then dec(tp[i].x);
      if tp[i].d=2 then inc(tp[i].x);
      if tp[i].d=3 then inc(tp[i].y);
      if tp[i].d=4 then dec(tp[i].y);
    end;
    if (not(ter[map[tp[i].x,tp[i].y]].a))or(tp[i].tf<1) then
    begin
      tp[i].a:=false;
      dec(rpn);
    end;
    if (me.x=tp[i].y)and(me.y=tp[i].x)and(tp[i].a) then
    begin
      tp[i].a:=false;
      wspa:=0;
      for pr1:=1 to 6 do wspa:=wspa+ti[armor[pr1]].h;
      me.hp:=me.hp-(round((tp[i].pow*(100-wspa))/100));
    end;
    if (umap[tp[i].y,tp[i].x]<>0)and(tp[i].a) then
    begin
      tp[i].a:=false;
      tu[umap[tp[i].y,tp[i].x]].thp:=tu[umap[tp[i].y,tp[i].x]].thp+tp[i].pow;
    end;
    if tp[i].a then pmap[tp[i].y,tp[i].x]:=i;
  end;
end;
procedure newProjectile(x,y,tf,pow,d,col:longint);
var
rp:longint;
begin
  inc(rpn);
  rp:=1;
  while tp[rp].a do inc(rp);
  if rp>pn then pn:=rp;
  tp[rp].x:=x;
  tp[rp].y:=y;
  tp[rp].tf:=tf;
  tp[rp].pow:=pow;
  tp[rp].d:=d;
  tp[rp].col:=col;
  tp[rp].a:=true;
  tp[rp].cd:=9;
end;
function hasItemName(s:string) : longint;
Var
i:longint;
begin
  i := 0;
  while (i <= 1000) and (ti[i].nm <> s) do begin
    inc(i);
  end;
  hasItemName := eq[i];
end;
function mobNamed(s:string):longint;
var
i:longint;
begin
  i:=0;
  while (i <= 100) and (tet[i].nm <> s) do begin
    inc(i);
  end;
  mobNamed:=i;
end;
procedure load(nm:string);
var
a1,a2:longint;
pr1,pr2,pr3,toplace,left:longint;
c1:char;
begin
  for pr1:=0 to 1000000 do tu[pr1].a:=false;
  for pr1:=0 to 1000 do tp[pr1].a:=false;
  assign(txt,'save_'+nm+'.sv');
  reset(txt);
  pr1:=-100;
  pr2:=-99;
  left:=0;
  while  pr1+pr2<2200 do
  begin
    inc(pr2);
    if pr2=1101 then
    begin
      pr2:=-100;
      inc(pr1);
    end;
    if left=0 then read(txt,left,toplace);
    dec(left);
    map[pr1,pr2-2]:=toplace;
  end;
  readln(txt,c1);
  pr1:=-100;
  pr2:=-99;
  left:=0;
  //cmap
  while  pr1+pr2<2200 do
  begin
    inc(pr2);
    if pr2=1101 then
    begin
      pr2:=-100;
      inc(pr1);
    end;
    if left=0 then read(txt,left,toplace);
    dec(left);
    cmap[pr1,pr2-2]:=toplace;
  end;
  readln(txt,c1);
  readln(txt,me.x,me.y,me.hp,me.scr,me.cash,me.mhp,me.gm,me.speed,me.rep[0],me.rep[1],me.rep[2],me.rep[3],me.rep[4],me.rep[5],me.rep[6],me.rep[7]);
  readln(txt,me.nm);
  readln(txt,a1);
  isDemonic:=a1=1;
  readln(txt,a1);
  canRule:=a1=1;
  readln(txt,dl,p,pp,amulet,structg,badTimer,kier,entcity,cn,ran,ent,cos1,p4,p3,mcd,strn,terc,en,etn,cooldown,som,ren,loat,itn,ci,hm,tick,ecounter,sn,blk,rarsum,pn,rpn,pcounter,creditsn,spawnrate);
  for pr1:=1 to en do
  begin
    readln(txt,tu[pr1].id,tu[pr1].x,tu[pr1].y,tu[pr1].hp,tu[pr1].thp,tu[pr1].cd,tu[pr1].mcd,tu[pr1].om,tu[pr1].fc,a1,a2,tu[pr1].mode,tu[pr1].at,tu[pr1].target.x,tu[pr1].target.y);
    tu[pr1].a:=a1=1;
    tu[pr1].rg:=a2=1;
    umap[tu[pr1].x,tu[pr1].y]:=pr1;
  end;
  for pr1:=1 to 6 do readln(txt,armor[pr1]);
  for pr1:=1 to 1000 do readln(txt,eq[pr1]);
  for pr1:=1 to 9 do readln(txt,nums[pr1]);
  for pr1:=1 to pn do
  begin
    readln(txt,tp[pr1].tf,tp[pr1].pow,tp[pr1].d,tp[pr1].col,tp[pr1].cd,tp[pr1].x,tp[pr1].y,a1);
    tp[pr1].a:=a1=1;
    pmap[tp[pr1].y,tp[pr1].x]:=pr1;
  end;
  for pr1:=1 to cn do
  begin
    for pr2:=0 to 1000 do tm[pr1].o[pr2]:=0;
    readln(txt,tc[pr1].pop,tc[pr1].cash,tc[pr1].x,tc[pr1].y,tc[pr1].who,tc[pr1].dpop,tc[pr1].nm);
    delete(tc[pr1].nm,1,1);
    readln(txt,tm[pr1].typ,tm[pr1].sprc,tm[pr1].bprc,tm[pr1].dc);
    pr2:=0;
    while pr2<>-1 do
    begin
      read(txt,pr2);
      if pr2<>-1 then
      begin
        read(txt,pr3);
        tm[pr1].o[pr2]:=pr3;
      end
      else readln(txt);
    end;
  end;
  close(txt);
end;
procedure save(nm:string);
var
pr1,pr2,pr3,prn,a1,a2:longint;
begin
  assign(txt,'save_'+nm+'.sv');
  rewrite(txt);
  //map
  pr3:=map[-100,-100];
  prn:=0;
  for pr1:=-100 to 1100 do
  begin
    for pr2:=-100 to 1100 do
    begin
      if map[pr1,pr2]<>pr3 then
      begin
        write(txt,prn,' ',pr3,' ');
        prn:=1;
        pr3:=map[pr1,pr2];
      end else inc(prn);
    end;
  end;
  write(txt,prn,' ',pr3,' ');
  writeln(txt,' ');
//mapend
//cmap
pr3:=cmap[-100,-100];
prn:=0;
for pr1:=-100 to 1100 do
begin
  for pr2:=-100 to 1100 do
  begin
    if cmap[pr1,pr2]<>pr3 then
    begin
      write(txt,prn,' ',pr3,' ');
      prn:=1;
      pr3:=cmap[pr1,pr2];
    end else inc(prn);
  end;
end;
write(txt,prn,' ',pr3,' ');
writeln(txt,' ');
//cmapend
writeln(txt,me.x,' ',me.y,' ',me.hp,' ',me.scr,' ',me.cash,' ',me.mhp,' ',me.gm,' ',me.speed,' ',me.rep[0],' ',me.rep[1],' ',me.rep[2],' ',me.rep[3],' ',me.rep[4],' ',me.rep[5],' ',me.rep[6],' ',me.rep[7]);
writeln(txt,me.nm);
if isDemonic then writeln(txt,1) else writeln(txt,0);
if canRule then writeln(txt,1) else writeln(txt,0);
writeln(txt,dl,' ',p,' ',pp,' ',amulet,' ',structg,' ',badTimer,' ',kier,' ',entcity,' ',cn,' ',ran,' ',ent,' ',cos1,' ',p4,' ',p3,' ',mcd,' ',strn,' ',terc,' ',en,' ',etn,' ',cooldown,' ',som,' ',ren,' ',loat,' ',itn,' ',ci,' ',hm,' ',tick,' ',ecounter,' ',sn,' ',blk,' ',rarsum,' ',pn,' ',rpn,' ',pcounter,' ',creditsn,' ',spawnrate);
for pr1:=1 to en do
begin
  {mode,at:longint;
  target:Vector2;}
  if tu[pr1].a then a1:=1 else a1:=0;
  if tu[pr1].rg then a2:=1 else a2:=0;
  writeln(txt,tu[pr1].id,' ',tu[pr1].x,' ',tu[pr1].y,' ',tu[pr1].hp,' ',tu[pr1].thp,' ',tu[pr1].cd,' ',tu[pr1].mcd,' ',tu[pr1].om,' ',tu[pr1].fc,' ',a1,' ',a2,' ',tu[pr1].mode,' ',tu[pr1].at,' ',tu[pr1].target.x,' ',tu[pr1].target.y);
end;
for pr1:=1 to 6 do writeln(txt,armor[pr1]);
for pr1:=1 to 1000 do writeln(txt,eq[pr1]);
for pr1:=1 to 9 do writeln(txt,nums[pr1]);
for pr1:=1 to pn do
begin
  if tp[pr1].a then a1:=1 else a1:=0;
  writeln(txt,tp[pr1].tf,' ',tp[pr1].pow,' ',tp[pr1].d,' ',tp[pr1].col,' ',tp[pr1].cd,' ',tp[pr1].x,' ',tp[pr1].y,' ',a1);
end;
for pr1:=1 to cn do
begin
  writeln(txt,tc[pr1].pop,' ',tc[pr1].cash,' ',tc[pr1].x,' ',tc[pr1].y,' ',tc[pr1].who,' ',tc[pr1].dpop,' ',tc[pr1].nm);
  writeln(txt,tm[pr1].typ,' ',tm[pr1].sprc,' ',tm[pr1].bprc,' ',tm[pr1].dc);
  for pr2:=0 to 1000 do
  begin
    if tm[pr1].o[pr2]>0 then write(txt,pr2,' ',tm[pr1].o[pr2],' ');
  end;
  writeln(txt,-1);
end;
close(txt);
end;
function hasItemType(s:longint) : longint;
Var
i,j:longint;
begin
  i := 0;
  while (i <= 1000) do begin
    inc(i);
    if ti[i].p = s then j := j + eq[i];
  end;
  hasItemType:=j;
end;

function hasItemTypeH(s:longint) : longint;
Var
i,j:longint;
begin
  i := 0;
  while (i <= 1000) do begin
    inc(i);
    if ti[i].p = s then j := j + eq[i] * ti[i].h;
  end;
  hasItemTypeH:=j;
end;
function hasAnyItems(i:longint):boolean;
var
rp:longint;
begin
  for rp:=1 to 1000 do
  begin
    i:=i-eq[rp];
  end;
  if i>0 then hasAnyItems:=false else hasAnyItems:=true;
end;
procedure addDeal(l,id:longint);
begin
  inc(tm[l].o[id]);
end;
procedure use(x,y,i:longint);
begin
  if ti[i].p=2 then
  begin
    if hasAnyItems(2) then
    begin
      dec(eq[i]);
      me.hp:=me.hp+ti[i].h;
      if me.hp>me.mhp then me.hp:=me.mhp;
    end;
  end;
  if ti[i].p=3 then
  begin
    if armor[ti[ci].z]=ci then armor[ti[ci].z]:=0 else armor[ti[ci].z]:=ci;
  end;
  if ti[i].p=0 then
  begin
    cooldown:=ti[ci].cd;
    if (map[x,y]=1)and(eq[i]>1) then
    begin
      dec(eq[i]);
      map[x,y]:=9;
    end
    else if map[x,y]=9 then
    begin
      inc(eq[i]);
      map[x,y]:=1;
    end;
  end;
  if ti[i].nm='Shovel' then
  begin
    map[x,y]:=0;
    me.cash:=me.cash+round((random(100*(me.scr div 1000+1))+10*(me.scr div 1000+1))*me.dropprc);
  end;
end;

procedure inShop(n:longint);
var
wd,ai,pi,rp,dq,ipi,con,aai,sci:longint;
begin
  textbackground(blue);
  clrscr;
  textcolor(white);
  pi:=0;
  ipi:=0;
  sci:=1;
  while eq[sci]<1 do inc(sci);
  while c<>#27 do
  begin

    dq:=0;
    for rp:=0 to 1000 do
    begin
      if tm[n].o[rp]>0 then inc(dq);
    end;
    con:=7;
    if dq<7 then con:=dq;
    if con mod 2 =0 then dec(con);
    if ipi<-1*((con-1)div 2) then ipi:=-1*((con-1)div 2);
    if pi+ipi>dq then
    begin
      dec(pi);
    end;
    if ipi>(con-1)div 2 then ipi:=(con-1)div 2;
    gotoxy(1,1);
    //clrscr;
    wd:=pi*-1;
    ai:=-1;
    writeln(tc[n].nm,': ',tc[n].cash,'$       ');
    for rp:=1 to 10 do writewidechar(#$2500);
    writeln();
    while (wd<con)and(ai<1000) do
    begin
      inc(ai);
      if tm[n].o[ai]>0 then
      begin
        inc(wd);
        textcolor(white);
        if (con-1)div 2+1+ipi=wd then aai:=ai;
        if wd>0 then writeln('   ',ti[ai].nm,' (',tm[n].o[ai],')                       ');
      end;
    end;
    for rp:=1 to 10 do writewidechar(#$2500);
    writeln();
    writeln('Buy: ',(tm[n].bprc*ti[aai].w) div 100* me.rep[tc[n].who] div 2500,'$                ' );
    for rp:=1 to 10 do writewidechar(#$2500);
    writeln();
    writeln('  ');
    writewidechar(#$25C4);
    write(ti[sci].nm);
    writewidechar(#$25BA);
    write('                           ');
    writeln('Sell: ',(tm[n].sprc*ti[sci].w) div 100*2500 div me.rep[tc[n].who],'$                ' );
    for rp:=1 to 10 do writewidechar(#$2500);
    writeln();
    writeln(me.nm+': ',me.cash,'$');
    gotoxy(1,(con-1)div 2+3+ipi);
    if dq>0 then
    begin
      writewidechar(#$2500);
      writewidechar(#$2500);
      write('>');
    end;
    c:=' ';
    c:=readkey();
    if c='b' then
    begin
      if (me.cash+1>(tm[n].bprc*ti[aai].w) div 100)and(con>0) then
      begin
        dec(tm[n].o[aai]);
        inc(eq[aai]);
        me.cash:=me.cash-(tm[n].bprc*ti[aai].w) div 100 * me.rep[tc[n].who] div 2500;
        me.rep[tc[n].who]:=me.rep[tc[n].who]-(tm[n].bprc*ti[aai].w) div 15000;
        if me.rep[tc[n].who]<1250 then me.rep[tc[n].who]:=1250;
        tc[n].cash:=tc[n].cash+(tm[n].bprc*ti[aai].w) div 100;
        clrscr;
      end;
    end;
    if (c='x')and(hasAnyItems(2)) then
    begin
      if tc[n].cash+1>(tm[n].sprc*ti[aai].w) div 100 then
      begin
        addDeal(n,sci);
        dec(eq[sci]);
        if eq[sci]=0 then c:='d';
        me.cash:=me.cash+(tm[n].sprc*ti[sci].w) div 100*2500 div me.rep[tc[n].who];
        me.rep[tc[n].who]:=me.rep[tc[n].who]-(tm[n].sprc*ti[sci].w) div 15000;
        if me.rep[tc[n].who]<1250 then me.rep[tc[n].who]:=1250;
        tc[n].cash:=tc[n].cash-(tm[n].sprc*ti[sci].w) div 100;
        clrscr;
      end;
    end;
    if c='a' then
    begin
      dec(sci);
      while eq[sci]=0 do
      begin
        if sci>0 then dec(sci) else sci:=itn;
      end;
    end;
    if c='d' then
    begin
      inc(sci);
      while eq[sci]=0 do
      begin
        if sci<itn then inc(sci) else sci:=1;
      end;
    end;
    if c='w' then
    begin
      if ipi>0 then dec(ipi)
      else if pi>0 then dec(pi)
      else if (pi=0)and(ipi>-1*((con-1)div 2)) then dec(ipi)
    end;
    if c='s' then
    begin
      if ipi<0 then inc(ipi)
      else if pi<dq-con then inc(pi)
      else if (pi=dq-con)and(ipi<(con-1)div 2) then inc(ipi);
    end;
  end;
  while ipi>(con-1)div 2 do dec(ipi);
  c:=' ';
  clrscr;
  if eq[ci]=0 then
  begin
    inc(ci);
    while eq[ci]=0 do
    begin
      if ci<itn then inc(ci) else ci:=1;
    end;
  end;
end;
procedure deathScr();
var
prp:longint;
lengs:string;
begin
textbackground(lightgray);
  str(me.scr,lengs);
  for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    writeln('                     ');
  end;
  for prp:=24 to 27 do
  begin
    gotoxy(2,prp);
    writeln('                     ');
  end;
  gotoxy(4,9);
  write('ZGINALES  SZMATO!');
  gotoxy((20-4-length(lengs))div 2,10);
  write('Wynik: ',me.scr);
  while c<>#13 do c:=readkey();
end;
procedure winScr();
var
prp:longint;
lengs:string;
begin
textbackground(lightgray);
  str(me.scr,lengs);
  for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    writeln('                     ');
  end;
  for prp:=24 to 27 do
  begin
    gotoxy(2,prp);
    writeln('                     ');
  end;
  gotoxy(4,6);
  write('WYGRALES  SZMATO!');
  gotoxy((20-4-length(lengs))div 2,7);
  write('Wynik: ',me.scr);
  gotoxy(4,9);
  write(' Z DUPY OGùOSILI ');
  gotoxy(4,10);
  write('   CI® KR‡lEM I  ');
  gotoxy(4,11);
  write(' M‡GLBYó JUΩ NIC ');
  gotoxy(4,12);
  write('ROBIè ALE  MOΩESZ');
  gotoxy(4,13);
  write(' KONTYNUOWAè GR® ');
  gotoxy(4,14);
  write('WCISKAJ§C DOWOLNY');
  gotoxy(4,15);
  write('    KLAWISZ!!!   ');
  for prp:=0 to 7 do me.rep[prp]:=1250;
  while c<>#13 do c:=readkey();
end;
procedure phamScr();
var
prp:longint;
lengs:string;
begin
  textbackground(lightgray);
  str(me.scr,lengs);
  for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('Pham wszedl do miasta');
    if prp=3 then writeln(' tylko na chwile, by ');
    if prp=4 then writeln('uzupelnic zapasy. Ale');
    if prp=5 then writeln('  ujrzal tam swoja   ');
    if prp=6 then writeln('  dziewczyne ktora   ');
    if prp=7 then writeln('zostala porwana przez');
    if prp=8 then writeln('potworki. To wlasnie ');
    if prp=9 then writeln('  jej szukal w tej   ');
    if prp=10 then writeln('nieprzyjaznej krainie');
    if prp=11 then writeln(' Rzucili sie sobie w ');
    if prp=12 then writeln('objecia i pozostali w');
    if prp=13 then writeln('      szczesliwie    ');
    if prp=14 then writeln(' po kres swoich dni. ');
    if prp=18 then writeln('Wygrales po Phamsku. ');
    if (prp>14)and(prp<>18) then writeln('                     ');
  end;
  gotoxy(2,13);
  write(tc[cmap[me.y,me.x]].nm);
  for prp:=24 to 27 do
  begin
    gotoxy(2,prp);
    writeln('                     ');
  end;
  while c<>#13 do c:=readkey();
end;
function targetInRange(int,r:longint):boolean;
var
x,y:longint;
begin
  targetInRange:=false;
  x:=tu[int].x;
  y:=tu[int].y;
  for p:=-1*r to r do
  begin
    for pp:=-1*r to r do
    begin
      if (sqrt(abs(p)*abs(p)+abs(pp)*abs(pp))+0.6<r)then
      begin
        if (x+p=tu[int].target.x)and(y+pp=tu[int].target.y)then 
        begin
          targetInRange:=true;
        end;
      end;
    end;
  end;
end;
function playerInRange(x,y,r:longint):boolean;
begin
  playerinrange:=false;
  for p:=-1*r to r do
  begin
    for pp:=-1*r to r do
    begin
      if (sqrt(abs(p)*abs(p)+abs(pp)*abs(pp))+0.6<r)then
      begin
        if (x+p=me.x)and(y+pp=me.y)then playerInRange:=true;
      end;
    end;
  end;
end;
function mobInRange(x,y,r:longint):boolean;
var
prpx,prpy:longint;
begin
  mobinrange:=false;
  for prpx:=-1*r to r do
  begin
    for prpy:=-1*r to r do
    begin
      if (sqrt(abs(prpx)*abs(prpx)+abs(prpy)*abs(prpy))+0.6<r)then
      begin
        if umap[y+prpx,x+prpy]<>0 then mobInRange:=true;
      end;
    end;
  end;
end;
function getCitizanInRange(x,y,r:longint):longint;
var
prpx,prpy:longint;
begin
  getCitizanInRange:=0;
  for prpx:=-1*r to r do
  begin
    for prpy:=-1*r to r do
    begin
      if (sqrt(abs(prpx)*abs(prpx)+abs(prpy)*abs(prpy))+0.6<r)then
      begin
        if umap[y+prpx,x+prpy]<>0 then if tet[tu[umap[y+prpx,x+prpy]].id].ih=false then getCitizanInRange:=umap[y+prpx,x+prpy];
      end;
    end;
  end;
end;
procedure newitem(nm:string;pb,h,coold,worth,z,rar:longint);
begin
  inc(itn);
  ti[itn].id:=itn;
  if length(nm)<22 then ti[itn].nm:=nm else ti[itn].nm:='ERROR#001:NameTooLong';
  ti[itn].p:=pb;
  ti[itn].h:=h;
  ti[itn].cd:=coold;
  ti[itn].w:=worth;
  ti[itn].z:=z;
  ti[itn].rar:=rar;
  irarsum:=irarsum+rar;
end;
procedure newMobType(nm:string;scor,hp,cd,mcd,col,ri,ro,dol,pow,xp,rar,cans:longint;ren:string;isHostile,citizanHostile:boolean);
begin
  if (not(enemyTypeActive(nm)))and(me.scr+1>scor) then
  begin
    inc(etn);
    tet[etn].hp:=hp;
    tet[etn].nm:=nm;
    tet[etn].cd:=cd;
    tet[etn].mcd:=mcd;
    tet[etn].col:=col;
    tet[etn].ro:=ro;
    tet[etn].ri:=ri;
    tet[etn].dol:=dol;
    tet[etn].pow:=pow;
    tet[etn].xp:=xp;
    tet[etn].c:=ren;
    tet[etn].rar:=rar;
    tet[etn].cs:=cans;
    tet[etn].ih:=isHostile;
    tet[etn].ch:=citizanHostile;
    tet[etn].ran:=3;
    rarsum:=rarsum+rar;
  end;
end;
function chooseMobId():longint;
var
pr,pr2,maxr,minr:longint;
begin
  chooseMobId:=1;
  minr:=0;
  maxr:=0;
  pr2:=random(rarsum)+1;
  for pr:=1 to etn do
  begin
    minr:=maxr+1;
    maxr:=maxr+tet[pr].rar;
    if (pr2+1>minr)and(pr2-1<maxr) then chooseMobId:=pr;
  end;
end;
function chooseItemId():longint;
var
pr,pr2,maxr,minr:longint;
begin
  chooseItemId:=1;
  minr:=0;
  maxr:=0;
  pr2:=random(irarsum)+1;
  for pr:=1 to itn do
  begin
    minr:=maxr+1;
    maxr:=maxr+ti[pr].rar;
    if (pr2+1>minr)and(pr2-1<maxr) then chooseItemId:=pr;
  end;
end;
procedure spawn(x,y,mobId:longint);
var
se,it:longint;
begin
  if ren<100 then
  begin
    inc(ren);
    se:=1;
    while tu[se].mode>-1 do inc(se);
    if se>en then en:=se;
    umap[x,y]:=se;
    it:=mobId;
    tu[se].id:=it;
    tu[se].hp:=tet[it].hp;
    tu[se].thp:=0;
    tu[se].x:=x;
    tu[se].y:=y;
    tu[se].a:=true;
    tu[se].rg:=false;
    tu[se].mode:=0;
    tu[se].at:=-1;
    setTarget(se);
  end;
end;
procedure addCredit(s:string ;lin:longint);
var
s2:string;
pr,i:longint;
begin
  inc(creditsn);
  s2:='';
  for pr:=1 to (23-(length(s)+2*lin+2))div 2 do s2:=s2+' ';
  for pr:=1 to lin do s2:=s2+trans(2500);
  s2:=s2+' '+s+' ';
  for pr:=1 to lin do s2:=s2+trans(2500);
  for pr:=1 to (23-(length(s)+2*lin+2)) do s2:=s2+' ';
  credits[creditsn] :=s2;
end;
procedure drawCredits();
var
beg,tck,pr:longint;
czar:char;
begin
  czar:=#0;
  beg:=-20;
  textbackground(black);
  textcolor(white);
  clrscr();
  while (beg<creditsn)and(czar<>#13) do
  begin
    if keypressed then czar :=readkey();
    	inc(tck);
    	if tck>30000 then
    	begin
      	  inc(beg);
      	  tck := 0;
      	  gotoxy(1,1);
      	  for pr:=beg to beg+20 do
      	  begin
        	    if credits[pr]<>'' then writeln(credits[pr]) else writeln('                                       ');
      	  end;
    	end;
  end;
end;
procedure menu();
var
w:longint;
begin
  w:=1;
  loat:=0;
  textbackground(black);
  clrscr;
  textcolor(random(6)+9);
  writeln(' POCKETROLE 2');
  writeln();
  textcolor(white);
  writeln('   New  Game');
  writeln('   Load Game');
  writeln('    Credits ');
  writeln('      Exit  ');
  writeln();
  textcolor(darkgray);
  writeln('    gamma 1.F'); 
  textcolor(random(6)+9);
  gotoxy(1,w+2);
  write('->');
  while c<>#13 do
  begin
    c:=readkey();
    gotoxy(1,w+2);
    write('  ');
    if c='w' then dec(w);
    if c='s' then inc(w);
    if (c=#13) and (w=2) then loat:=1;
    if w=0 then w:=4;
    if w=5 then w:=1;
    gotoxy(1,w+2);
    write('->');
  end;
  if w=3 then
  begin
    drawCredits();
    	c:=#0;
    	clrscr();
    	menu();
  end;
  if w=4 then ent:=2;
end;
procedure attack(x,y,r,typ,pow:longint);
var
wspa,pr1,apow
:longint;
begin
  if typ=0 then hm:=0;
  if typ=0 then cooldown:=ti[ci].cd;
  for p:=-1*r to r do
  begin
    for pp:=-1*r to r do
    begin
      apow:=pow div 2+random(pow);
      if (sqrt(abs(p)*abs(p)+abs(pp)*abs(pp))+0.6<r)then
      begin
        if (umap[y+p,x+pp]<>0) then
        begin
          if typ=0 then
          begin
            tu[umap[y+p,x+pp]].thp:=tu[umap[y+p,x+pp]].thp+round(apow*me.dmgprc);
            setPlayerTarget(umap[y+p,x+pp]);
            setAttackTarget(umap[y+p,x+pp],0);
            tu[umap[y+p,x+pp]].mode:=1;
          end
          else if umap[y+p,x+pp]<>typ then
          begin
            tu[umap[y+p,x+pp]].thp:=tu[umap[y+p,x+pp]].thp+apow;
            setMobTarget(umap[y+p,x+pp],typ);
            setAttackTarget(umap[y+p,x+pp],typ);
            tu[umap[y+p,x+pp]].mode:=1;
          end
        end;
        wspa:=0;
        for pr1:=1 to 6 do wspa:=wspa+ti[armor[pr1]].h;
        if (me.x+p=y)and(me.y+pp=x)and(typ>0) then me.hp:=me.hp-(round((pow*(100-wspa))/100));
      end;
    end;
  end;
end;

procedure enemy_sim_Generic(int:longint);
var
newPos:Vector2;
wc:longint;
begin 
  umap[tu[int].x,tu[int].y]:=0;
  inc(tu[int].om);
  if length(tet[tu[int].id].c)=0 then tu[int].om:=1 else tu[int].om:=tu[int].om mod length(tet[tu[int].id].c);
  //if tu[int].hp<tet[tu[int].id].mhp*100 div 30 then tu[int].mode:=2;
  inc(tu[int].cd);
  inc(tu[int].mcd);
  case tu[int].mode of
    //being dead
    -1:begin
      //wow so much code here
    end;
    //wander
    
    0:begin
      if (tu[int].x=tu[int].target.x)and(tu[int].y=tu[int].target.y)then 
      begin
        wc:=0;
        while (Vector(tu[int].x,tu[int].y)=getMobPath(int,-1))and(wc<100)do 
        begin
          setTarget(int);
          inc(wc);
        end;
      end;
      if playerInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri) then 
      begin
        setPlayerTarget(int);
        tu[int].mode:=1;
        tu[int].at:=0;
      end
      else if (getCitizanInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri)<>0)and(tet[tu[int].id].ch) then 
      begin
        setMobTarget(int,getCitizanInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri));
        tu[int].mode:=1;
        tu[int].at:=getCitizanInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri);
      end;
      if tu[int].mcd=tet[tu[int].id].mcd then
      begin
        tu[int].mcd:=0;
        
        newpos:=getMobPath(int,-1);
        tu[int].x:=newpos.x;
        tu[int].y:=newpos.y;
      end;
    end;
    //attack
    1:begin
      if targetInRange(int,tet[tu[int].id].ro) then 
      begin
        if(tu[int].at=0)then setPlayerTarget(int) else 
        begin
          setMobTarget(int,tu[int].at);       
        end;
      end
      else 
      begin
        tu[int].mode:=0;
        tu[int].at:=-1;
        setTarget(int);
      end;
      if (tu[int].cd>tet[tu[int].id].cd)and(targetInRange(int,tet[tu[int].id].ran))then
      begin
        attack(tu[int].y,tu[int].x,tet[tu[int].id].ran,int,tet[tu[int].id].pow);
        tu[int].cd:=0;
      end
      else
      begin
        if tu[int].mcd=tet[tu[int].id].mcd then
        begin
          tu[int].mcd:=0;
          if abs(tu[int].x-tu[int].target.x)+abs(tu[int].y-tu[int].target.y)>1 then 
          begin
            newpos:=getMobPath(int,-1);
            tu[int].x:=newpos.x;
            tu[int].y:=newpos.y;
          end;
        end;
      end; 
    end;
    //flee
    2:begin
    
    end;
  end;
  if tu[int].mode>-1 then umap[tu[int].x,tu[int].y]:=int;
end;
procedure enemy_sim_Archer(int:longint);
var
newPos:Vector2;
begin
  if(abs(me.x-tu[int].x))+(abs(me.y-tu[int].y))>64 then tu[int].mode:=-1;
  umap[tu[int].x,tu[int].y]:=0;
  inc(tu[int].om);
  if length(tet[tu[int].id].c)=0 then tu[int].om:=1 else tu[int].om:=tu[int].om mod length(tet[tu[int].id].c);
  tu[int].hp:=tu[int].hp-tu[int].thp;
  tu[int].thp:=0;
  //if tu[int].hp<tet[tu[int].id].mhp*100 div 30 then tu[int].mode:=2;
  if tu[int].hp<0 then 
  begin
    tu[int].mode:=-1;
    if tu[int].target=Vector(me.x,me.y) then
    begin
    //zabi≥em potworka, nananananana
    
    
    end;
  end;
  inc(tu[int].cd);
  inc(tu[int].mcd);
  case tu[int].mode of
    //being dead
    -1:begin
      //wow so much code here
    end;
    //wander
    
    0:begin
      if (tu[int].x=tu[int].target.x)and(tu[int].y=tu[int].target.y)then 
      begin
        while (Vector(tu[int].x,tu[int].y)=getMobPath(int,-1))do 
        begin
          setTarget(int);
        end;
      end;
      if playerInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri) then 
      begin
        setPlayerTarget(int);
        tu[int].mode:=1;
      end
      else if (getCitizanInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri)<>0)and(tet[tu[int].id].ch) then 
      begin
        setMobTarget(int,getCitizanInRange(tu[int].x,tu[int].y,tet[tu[int].id].ri));
        tu[int].mode:=1;
      end;
      if tu[int].mcd=tet[tu[int].id].mcd then
      begin
        tu[int].mcd:=0;
        
        newpos:=getMobPath(int,-1);
        tu[int].x:=newpos.x;
        tu[int].y:=newpos.y;
      end;
    end;
    //attack
    1:begin
      if playerInRange(tu[int].x,tu[int].y,tet[tu[int].id].ro)then setPlayerTarget(int) else 
      begin
        tu[int].mode:=0;
        setTarget(int);
      end;
      if {(tu[int].cd>tet[tu[int].id].cd)and((targetInAttackRange(int))or(false) )}true then
      begin
        attack(tu[int].y,tu[int].x,tet[tu[int].id].ran,int,tet[tu[int].id].pow);
        tu[int].cd:=0;
      end
      else
      begin
        if tu[int].mcd=tet[tu[int].id].mcd then
        begin
          tu[int].mcd:=0;
          newpos:=getMobPath(int,-1);
          tu[int].x:=newpos.x;
          tu[int].y:=newpos.y;
        end;
      end; 
    end;
    //flee
    2:begin
    
    end;
  end;
end;
procedure enemy_sim_Citizan(int:longint);
var
newPos:Vector2;
wc:longint;
begin
  umap[tu[int].x,tu[int].y]:=0;
  inc(tu[int].om);
  if length(tet[tu[int].id].c)=0 then tu[int].om:=1 else tu[int].om:=tu[int].om mod length(tet[tu[int].id].c);
  inc(tu[int].cd);
  inc(tu[int].mcd);
  case tu[int].mode of
    //being dead
    -1:begin
      //wow so much code here
    end;
    //wander
    
    0:begin
      if (tu[int].x=tu[int].target.x)and(tu[int].y=tu[int].target.y)then 
      begin
        wc:=0;
        while (Vector(tu[int].x,tu[int].y)=getMobPath(int,-1))and(wc<100)do 
        begin
          setTarget(int);
          inc(wc);
        end;
      end;
      if tu[int].mcd=tet[tu[int].id].mcd then
      begin
        tu[int].mcd:=0;
        
        newpos:=getMobPath(int,-1);
        tu[int].x:=newpos.x;
        tu[int].y:=newpos.y;
      end;
    end;
    //attack
    1:begin
      if targetInRange(int,tet[tu[int].id].ro) then 
      begin
        if(tu[int].at=0)then setPlayerTarget(int) else setMobTarget(int,tu[int].at);       
      end  
      else 
      begin
        tu[int].mode:=0;
        tu[int].at:=-1;
        setTarget(int);
      end;
      if (tu[int].cd>tet[tu[int].id].cd)and(targetInRange(int,tet[tu[int].id].ran))then
      begin
        attack(tu[int].y,tu[int].x,tet[tu[int].id].ran,int,tet[tu[int].id].pow);
        tu[int].cd:=0;
      end
      else
      begin
        if tu[int].mcd=tet[tu[int].id].mcd then
        begin
          tu[int].mcd:=0;
          if abs(tu[int].x-tu[int].target.x)+abs(tu[int].y-tu[int].target.y)>1 then 
          begin
            newpos:=getMobPath(int,-1);
            tu[int].x:=newpos.x;
            tu[int].y:=newpos.y;
          end;
        end;
      end; 
    end;
    //flee
    2:begin
    
    end;
  end;
  if tu[int].mode>-1 then umap[tu[int].x,tu[int].y]:=int;
end;
procedure enemy_sim_spliter(int:longint);
begin
if tet[tu[int].id].ih then enemy_sim_Generic(int) else enemy_sim_Citizan(int);
end;
procedure checkMobDeaths(int:longint);
begin
  if(abs(me.x-tu[int].x))+(abs(me.y-tu[int].y))>64 then tu[int].hp:=-10;
  tu[int].hp:=tu[int].hp-tu[int].thp;
  tu[int].thp:=0;
  if (tu[int].hp<0)and(tu[int].mode>-1) then 
  begin
    tu[int].mode:=-1;
    dec(ren);
    if tu[int].target=Vector(me.x,me.y) then
    begin
    //zabi≥em potworka, nananananana
      me.scr:=me.scr+round(tet[tu[int].id].xp*me.xpprc);
      me.cash:=me.cash+round(tet[tu[int].id].dol*me.dropprc);
      for p4:=0 to 7 do if (me.rep[p4]>1250)and(tet[tu[int].id].ih) then dec(me.rep[p4]);
      if not(tet[tu[int].id].ih) then me.rep[tu[int].id]:=me.rep[tu[int].id]+250;       
      if(entcity = 3)and(tet[tu[int].id].nm='Slayer')then inc(eq[itemNamed('Soul Shard')]);
      if(entcity = 3)and(tet[tu[int].id].nm='Behemoth')then inc(eq[itemNamed('Soul Shard')],2);    
    end;
  end;
end;

procedure newterrain(n:string; bc,tc:longint; tile:char; a:boolean; lomol:char);
begin
  ter[terc].id:=terc;
  ter[terc].n:=n;
  ter[terc].bc:=bc;
  ter[terc].tc:=tc;
  ter[terc].tile:=tile;
  ter[terc].a:=a;
  dter[lomol]:=terc;
  inc(terc);
end;
procedure tip(s:string);
begin
  {textcolor(white);
  textbackground(blue);
  gotoxy(1,29);
  write('                                               ');
  gotoxy(1,29);
  write(s);}
end;
procedure spcrender(id,x,y:longint);
begin
  if id=1 then
  begin
    textbackground(blue);
    textcolor(white);

    if umap[y,x]<>0 then
    begin
      if tu[umap[y,x]].thp=0 then textcolor(tet[tu[umap[y,x]].id].col) else textcolor(red);
      if (tu[umap[y,x]].cd=0)and(blk=1) then textcolor(tet[tu[umap[y,x]].id].col+8);
    end;
    if (me.y=x)and(me.x=y) then textcolor(yellow);
    if pmap[y,x]<>0 then textcolor(tp[pmap[y,x]].col);
    if isDemonic then
    begin
      if umap[y,x]<>0 then
      begin
        if tet[tu[umap[y,x]].id].nm<>'Murzyn' then textcolor(lightred);
      end else textcolor(lightmagenta);
      textbackground(magenta);
    end;
    if ((me.y=x)and(me.x=y))or(umap[y,x]<>0)or(pmap[y,x]<>0) then
    begin
      if umap[y,x]<>0 then print(tet[tu[umap[y,x]].id].c[tu[umap[y,x]].om+1]) else if pmap[y,x]<>0 then print(char(23+tp[pmap[y,x]].d)) else print(#1);
    end else
    begin
      if random(8)=0 then write('~') else write(' ');
    end;
  end;
  if id=4 then
  begin

    textcolor(black);
    textbackground(green);
    if isDemonic then textbackground(red);
    for p3:=-1 to 1 do
    begin
      for p4:=-1 to 1 do
      begin
        if map[x+p3,y+p4]=1 then
        begin
          textbackground(green);
          if umap[y,x]<>0 then
          begin
            if tet[tu[umap[y,x]].id].nm<>'Murzyn' then textcolor(lightred);
          end else textcolor(black);
          if isDemonic then textbackground(red);
        end;
      end;
    end;
    cos1:=0;
    if (umap[y,x]<>0)and(not(isDemonic)) then
    begin
      if tu[umap[y,x]].thp=0 then textcolor(tet[tu[umap[y,x]].id].col) else textcolor(red);
      if (tu[umap[y,x]].cd=0)and(blk=1) then textcolor(tet[tu[umap[y,x]].id].col+8);
    end;
    if (me.y=x)and(me.x=y)and(not(isDemonic)) then textcolor(yellow);
    if (pmap[y,x]<>0)and(not(isDemonic)) then textcolor(tp[pmap[y,x]].col);
    if ((me.y=x)and(me.x=y))or(umap[y,x]<>0)or(pmap[y,x]<>0) then
    begin
      if umap[y,x]<>0 then print(tet[tu[umap[y,x]].id].c[tu[umap[y,x]].om+1]) else if pmap[y,x]<>0 then print(char(23+tp[pmap[y,x]].d)) else print(#1);
    end
    else
    begin
      if map[x,y+1]=4 then cos1:=cos1+1;
      if map[x,y-1]=4 then cos1:=cos1+10;
      if map[x+1,y]=4 then cos1:=cos1+100;
      if map[x-1,y]=4 then cos1:=cos1+1000;
      if cos1=0 then writewidechar(#$25A0);
      if (cos1=1)or(cos1=10)or(cos1=11)then writewidechar(#$2550);
      if (cos1=100)or(cos1=1000)or(cos1=1100)then writewidechar(#$2551);
      if cos1=1111 then writewidechar(#$256C);
      if cos1=111 then writewidechar(#$2566);
      if cos1=101 then writewidechar(#$2554);
      if cos1=110 then writewidechar(#$2557);
      if cos1=1001 then writewidechar(#$255A);
      if cos1=1010 then writewidechar(#$255D);
      if cos1=1011 then writewidechar(#$2569);
      if cos1=1101 then writewidechar(#$2560);
      if cos1=1110 then writewidechar(#$2563);
    end;
  end;
end;
procedure cityGrow(x,y:longint);
var
pr1,pr2:longint;
wall2:boolean;
begin
  wall2:=false;
  for pr1:=-1 to 1 do
  begin
    for pr2:=-1 to 1 do
    begin
      if cmap[x+pr1,y+pr2]<>cmap[x,y] then wall2:=true;
    end;
  end;
  if wall2 then
  begin
    for pr1:=-1 to 1 do
    begin
      for pr2:=-1 to 1 do
      begin
        cmap[x+pr1,y+pr2]:=cmap[x,y];
        map[x+pr1,y+pr2]:=2;       
      end;
    end;
    inc(tc[cmap[x,y]].pop);
    inc(tc[cmap[x,y]].dpop,120+random(120));
    inc(tc[cmap[x,y]].cash,1000+random(1000));
    addDeal(cmap[x,y],chooseItemId());
  end;  
end;
procedure crender(x,y:longint);
var
wall:boolean;
prxi,pryi,pr1,pr2:longint;
begin
  wall:=false;
  for prxi:=-1 to 1 do
  begin
    for pryi:=-1 to 1 do
    begin
      if cmap[x+prxi,y+pryi]<>cmap[x,y] then wall:=true;
      if (cmap[x+prxi,y+pryi]<>0)and(cmap[x+prxi,y+pryi]<cmap[x,y]) then
      begin
        mergeCities(cmap[x+prxi,y+pryi],cmap[x,y]);
        cmap[x+prxi,y+pryi]:=cmap[x,y];
      end;
    end;
  end;
  //if tc[cmap[x,y]].pop<6 then wall:=false;
  if wall then textcolor(darkgray) else textcolor(tc[cmap[x,y]].who+8);
  if wall then textbackground(lightgray) else textbackground(tc[cmap[x,y]].who);
  if isDemonic then
  begin
    if wall then
    begin
      textcolor(darkgray);
      textbackground(black);
    end
    else
    begin
      textcolor(lightred);
      textbackground(red);
    end;
  end;
  if wall then writewidechar(#$25A0) else write(char(ctChar(x,y)));
end;
procedure render(x,y:longint);
begin
  //if c=';' then write(x,' ',y,' ',map[x,y]);
  if ter[map[x,y]].tile=#0 then spcrender(ter[map[x,y]].id,x,y) else
  begin
    textbackground(ter[map[x,y]].bc);
    if (me.x=y)and(me.y=x) then textcolor(yellow) else if pmap[y,x]<>0 then textcolor(tp[pmap[y,x]].col) else textcolor(ter[map[x,y]].tc);
    if umap[y,x]<>0 then
    begin
      if tu[umap[y,x]].thp=0 then textcolor(tet[tu[umap[y,x]].id].col) else textcolor(red);
      if (tu[umap[y,x]].cd=0)and(blk=1) then textcolor(tet[tu[umap[y,x]].id].col+8);
    end;
    if isDemonic then
    begin
      if (umap[y,x]<>0) then
      begin
        if tet[tu[umap[y,x]].id].nm<>'Murzyn' then textcolor(lightred);
      end
      else textcolor(lightred);
      if map[x,y]=terrainNamed('Water Lily') then textbackground(magenta) else textbackground(red);
    end;
    if ((me.x=y)and(me.y=x))or(umap[y,x]<>0)or(pmap[y,x]<>0) then
    begin
      if umap[y,x]<>0 then print(tet[tu[umap[y,x]].id].c[tu[umap[y,x]].om+1]) else if pmap[y,x]<>0 then print(char(23+tp[pmap[y,x]].d)) else print(#1);
    end
    else print(ter[map[x,y]].tile);
  end;
end;
procedure check_Amulet();
begin
  if eq[amulet]<0 then amulet:=0;
  if (ti[amulet].z=1)or(ti[amulet].z=-1) then me.speed:=1 else me.speed:=1;
  if (ti[amulet].z=2)or(ti[amulet].z=-1) then me.waterprc:=1/ti[amulet].h*45 else me.waterprc:=1;
  if (ti[amulet].z=3)or(ti[amulet].z=-1) then me.dropprc:=ti[amulet].h/100 else me.dropprc:=1;
  if (ti[amulet].z=4)or(ti[amulet].z=-1) then me.xpprc:=ti[amulet].h/100 else me.xpprc:=1;
  if (ti[amulet].z=5)or(ti[amulet].z=-1) then me.dmgprc:=ti[amulet].h/100 else me.dmgprc:=1;
  if(isDemonic)then
  begin
    me.xpprc:=2*me.xpprc;
    me.dmgprc:=0.75*me.dmgprc;
    me.dropprc:=2*me.dropprc;
  end;
end;
procedure check_Battletower();
begin
  if map[me.y,me.x]=terrainNamed('Battletower') then
  begin
    if map[me.y,me.x+3]=terrainNamed('BattletowerMain') then
    begin
      me.x:=me.x-1;
      inBattletower(me.y,me.x+4,smap[me.y,me.x+1]);
    end;
    if map[me.y,me.x-3]=terrainNamed('BattletowerMain') then
    begin
      me.x:=me.x+1;
      inBattletower(me.y,me.x-4,smap[me.y,me.x-1]);
    end;
    if map[me.y+3,me.x]=terrainNamed('BattletowerMain') then
    begin
      me.y:=me.y-1;
      inBattletower(me.y+4,me.x,smap[me.y+1,me.x]);
    end;
    if map[me.y-3,me.x]=terrainNamed('BattletowerMain') then
    begin
      me.y:=me.y+1;
      inBattletower(me.y-4,me.x,smap[me.y-1,me.x]);
    end;

  end;
end;
procedure genvarious(x,y:longint);
begin
  if map[y,x]=0 then
  begin
    if random(30)=0 then map[y,x]:=5;
    if random(30)=0 then map[y,x]:=6;
    if random(30)=0 then map[y,x]:=7;
    if random(30)=0 then map[y,x]:=terrainnamed('Yellow Flower');
    if random(500)=0 then map[y,x]:=12;
  end;
  if map[y,x]=terrainNamed('Water') then
  begin
    if random(15
    )=0 then map[y,x]:=terrainNamed('Water Lily');
  end;
end;
procedure genriver(x,y:longint);
var
pr1,pr2:longint;
begin
  dl:=random(200)+50;
  for p:=1 to dl do
  begin
    if map[y,x]<>2 then
    begin
      if (map[y,x]<>4)and(map[y,x]<>9) then map[y,x]:=1 else map[y,x]:=9;
      for pr1:=-1 to 1 do
      begin
        for pr2:=-1 to 1 do
        begin
          if map[y+pr1,x+pr2]=11 then map[y+pr1,x+pr2]:=0;
        end;
      end;
    end;
    kier:=random(4)+1;
    if (kier=1)and(x<1000)then dec(x);
    if (kier=2)and(y<1000)then dec(y);
    if (kier=3)and(x>1)then inc(x);
    if (kier=4)and(y>1)then inc(y);
  end;
end;
procedure genforest(x,y:longint);
begin
  for p:=y-random(5)+2 to y+random(5)+2 do
  begin
    for pp:=x-random(5)+2 to x+random(5)+2 do
    begin
      ran:=random(4);
      if ran=0 then
      begin
        if map[p,pp]=0 then map[p,pp]:=8;
        if map[p,pp+1]=0 then map[p,pp+1]:=3;
        if map[p,pp-1]=0 then map[p,pp-1]:=3;
        if map[p-1,pp]=0 then map[p-1,pp]:=3;
        if map[p+1,pp]=0 then map[p+1,pp]:=3;
      end;
    end;
  end;
end;
procedure gendesert(x,y,radius:longint);
var
pr,pr2:longint;
begin
  for pr:=-radius to radius do
  begin
    for pr2:=-radius to radius do
    begin
      if sqrt((pr)*(pr)+(pr2)*(pr2))<radius-0.6 then
      begin
      if map[pr2+y,pr+x]<>2 then begin map[pr2+y,pr+x]:=11; inc(som); end;
      end;
    end;
  end;
end;
procedure genroad(x,y,kier:longint);
begin
  ran:=random(20)+5;
  for p:=1 to ran do
  begin
    if map[y,x]<>1 then map[y,x]:=4;
    if map[y,x]=1 then map[y,x]:=9;
    if (kier=1)and(x<1000)then dec(x);
    if (kier=2)and(y<1000)then dec(y);
    if (kier=3)and(x>1)then inc(x);
    if (kier=4)and(y>1)then inc(y);
  end;
  ran:=random(10)+1;
  if (x<1000)and(x>1)and(y<1000)and(y>1)and(ran<5)then genroad(x,y,ran);
end;
procedure brzuhajPrezesa(czas:longint);
begin
writeln('brzuhbrzuh');
end;
procedure GenCityBorder(x,y:longint);
var
rand,ml,mr,mu,md,rpy,rpx,pri:longint;
begin
  rpx:=0;
  rpy:=0;
  rand:=1;
  ml:=x;
  mr:=x;
  mu:=y;
  md:=y;
  while (cmap[y+rpy,x+rpx]=cn)and(rand>0) do
  begin
    rand:=random(8);
    inc(tc[cn].pop);
    for p3:=-1 to 1 do
    begin
      for p4:=-1 to 1 do
      begin
        cmap[y+p4+rpy,x+p3+rpx]:=cn;
        map[y+p4+rpy,x+p3+rpx]:=2;
        if x+p3+rpx<ml then ml:=x+p3+rpx;
        if x+p3+rpx>mr then mr:=x+p3+rpx;
        if y+p4+rpy<mu then mu:=y+p4+rpy;
        if y+p4+rpy>md then md:=y+p4+rpy;
      end;
    end;
    rpx:=random(mr-ml+1)-((mr-ml+1)div 2);
    rpy:=random(md-mu+1)-((md-mu+1)div 2);
    for pri:=1 to 2 do
    begin
      if cmap[y+rpy,x+rpx]<>cn then
      begin
        rpx:=random(mr-ml+1)-((mr-ml+1)div 2);
        rpy:=random(md-mu+1)-((md-mu+1)div 2);
      end;
    end;
  end;
end;
procedure newstruct(x,y,rar,structNum:longint);
begin

end;
procedure gencity(x,y:longint);
var
rp,lt,d:longint;
begin
  map[y,x]:=2;
  inc(cn);

  tc[cn].who:=random(8);
  lt:=random(2);
  d:=random(3)+4;
  if lt=1 then tc[cn].nm:=dsp[random(constsp)+1] else tc[cn].nm:=dsam[random(constsam)+1];
  while length(tc[cn].nm)<d do
  begin
    lt:=(lt+1)mod 2;
    if lt=1 then tc[cn].nm:=tc[cn].nm+sp[random(constsp)+1] else tc[cn].nm:=tc[cn].nm+sam[random(constsam)+1];
  end;
  //tc[cn].nm:=getCityName();
  tc[cn].x:=x;
  tc[cn].y:=y;
  cmap[y,x]:=cn;
  tm[cn].sprc:=random(15)+70;
  tm[cn].bprc:=random(30)+90;
  GenCityBorder(x,y);
  for rp:=1 to tc[cn].pop do addDeal(cn,chooseItemId());
  inc(tm[cn].o[3]);
  inc(tm[cn].o[4]);
  tm[cn].o[3]:=tm[cn].o[3]*(random(16)+16);
  tm[cn].o[4]:=tm[cn].o[4]*(random(4)+4);
  tc[cn].dpop:=random(tc[cn].pop*120)+120*tc[cn].pop;
  tc[cn].cash:=random(50*(tc[cn].dpop))+tc[cn].dpop;
  for rp:=1 to 4 do
  begin
    ran:=random(3);
    if ran=0 then genroad(x,y,rp);
  end;
end;
procedure inInventory();
var
wd,ai,pi,rp,dq,ipi,con,aai,sci,pr,zbrojka,rp2,isCheat:longint;
ps1:string;
begin
  textbackground(blue);
  clrscr;
  textcolor(white);
  pi:=0;
  ipi:=0;
  sci:=1;
  while eq[sci]<1 do inc(sci);
  while c<>#27 do
  begin
    zbrojka:=0;
    for rp2:=1 to 6 do zbrojka:=zbrojka+ti[armor[rp2]].h;
    dq:=0;
    for rp:=0 to 1000 do
    begin
      if eq[rp]>0 then inc(dq);
    end;
    con:=7;
    if dq<7 then con:=dq;
    if con mod 2 =0 then dec(con);
    if ipi<-1*((con-1)div 2) then ipi:=-1*((con-1)div 2);
    if pi+ipi>dq then
    begin
      dec(pi);
    end;
    if ipi>(con-1)div 2 then ipi:=(con-1)div 2;
    gotoxy(1,1);
    //clrscr;
    wd:=pi*-1;
    ai:=-1;
    writeln(me.nm,'                               ');
    for rp:=1 to 10 do writewidechar(#$2500);
    writeln();
    while (wd<con)and(ai<1000) do
    begin
      inc(ai);
      if eq[ai]>0 then
      begin
        inc(wd);
        textcolor(white);
        if (con-1)div 2+1+ipi=wd then aai:=ai;
        if wd>0 then
        begin
          if ci=ai then textcolor(lightmagenta);
          for pr:=0 to 6 do
          begin
            //if armor[pr]=ai then write('[',armorName[pr],']');
            if armor[pr]=ai then textcolor(lightgreen);
          end;
          if amulet=ai then textcolor(lightred);
          write('   ',ti[ai].nm,' (',eq[ai],')');

          for pr:=0 to 9 do
          begin
            textcolor(lightcyan);
            if nums[pr]=ai then write('[',pr,']');
          end;
          textcolor(white);
          writeln('                   ');
        end;
      end;
    end;
    for rp:=1 to 10 do writewidechar(#$2500);
    writeln();
    writeln('Cash: ',me.cash,'$                       ');
    write('Health: ',round(me.hp / 10):4);
    textcolor(lightred);
    writeln(#3);
    textcolor(white);
    writeln('Armor: ',zbrojka:4,'%');
    writeln('Score: ',me.scr:5);
    gotoxy(1,(con-1)div 2+3+ipi);
    if dq>0 then
    begin
      writewidechar(#$2500);
      writewidechar(#$2500);
      write('>');
    end;
    c:=' ';
    c:=readkey();
    if c='n' then
    begin
      gotoxy(1,1);
      writeln('                                  ');
      gotoxy(1,1);
      textcolor(lightgreen);
      readln(ps1);
      isCheat:=0;
      if ps1='arrowToTheKnee' then
      begin
        eq[3]:=eq[3]+1000;
        isCheat:=1;
      end;
      if ps1='imagodking' then
      begin
        me.gm:=me.gm*-1;
        isCheat:=1;
      end;
      if ps1='niggaNigga' then
      begin
        me.scr:=me.scr+5000;
        inc(eq[itemNamed('Soul Shard')],10);
        inc(me.cash,10000);
        isCheat:=1;
      end;
      if ps1='wiseBottle' then
      begin
        me.scr:=me.scr+5000;
        isCheat:=1;
      end;
      if ps1='demon' then
      begin
        isDemonic:=not(isDemonic);
        isCheat:=1;
      end;
      if ps1='collection' then
      begin
        for rp:=1 to itn do inc(eq[rp]);
        isCheat:=1;
      end;
      if ps1='prezes' then
      begin
        me.cash:=me.cash+10000;
        brzuhajPrezesa(me.cash);
        isCheat:=1;
      end;
      if ps1='soHealthy' then
      begin
        me.hp:=me.mhp;
        isCheat:=1;
      end;
      if ps1='villager' then
      begin
        genCity(me.x,me.y);
        isCheat:=1;
      end;
      if (ps1<>'')and(length(ps1)<25)and(isCheat=0) then me.nm:=ps1;
      textcolor(white);
    end;
    if (c='u')and(hasAnyItems(2))and(ti[aai].p=2) then
    begin
      dec(eq[aai]);
      me.hp:=me.hp+ti[aai].h;
      if me.hp>me.mhp then me.hp:=me.mhp;
      clrscr;
    end;
    if (c='u')and(ti[aai].p=3) then
    begin
      if armor[ti[aai].z]=aai then armor[ti[aai].z]:=0 else armor[ti[aai].z]:=aai;
      clrscr;
    end;
    if (c='u')and(ti[aai].p=6) then
    begin
      if amulet=aai then amulet:=0 else amulet:=aai;
      clrscr;
    end;
    if (ord(c)>47)and(ord(c)<58) then
    begin
      if nums[ord(c)-48]=aai then nums[ord(c)-48]:=0 else nums[ord(c)-48]:=aai;
    end;
    if c='w' then
    begin
      if ipi>0 then dec(ipi)
      else if pi>0 then dec(pi)
      else if (pi=0)and(ipi>-1*((con-1)div 2)) then dec(ipi)
    end;
    if c='s' then
    begin
      if ipi<0 then inc(ipi)
      else if pi<dq-con then inc(pi)
      else if (pi=dq-con)and(ipi<(con-1)div 2) then inc(ipi);
    end;
  end;
  while ipi>(con-1)div 2 do dec(ipi);
  c:=' ';
  clrscr;
  if eq[ci]=0 then
  begin
    inc(ci);
    while eq[ci]=0 do
    begin
      if ci<itn then inc(ci) else ci:=1;
    end;
  end;
end;
procedure addMod(s1:string);
var
modFile:text;
c1,pc1,pc2:char;
pi1,pi2,pi3,pi4,pi5,pi6,pi7,pi8,pi9,pi10,pi11,pr:longint;
ps1,ps2:string;
begin
  assign(modFile,s1);
  reset(modFile);
  while c1<>'}' do
  begin
    read(modFile,c1);
    if c1='i' then
    begin
      readln(modFile,pi1,pi2,pi3,pi4,pi5,ps1);
      ps2:='';
      for pr:=2 to length(ps1) do
      begin
        if ps1[pr]='_' then ps1[pr]:=' ';
        ps2:=ps2+ps1[pr];
      end;
      newitem(ps2,pi1,pi2,pi3,pi4,pi5,20);
    end;
    if c1='m'then
    begin
      readln(modFile,pi1,pi2,pi3,pi4,pi5,pi6,pi7,pi8,pi9,pi10,pi11,pc2,pc1,ps1);
      ps2:='';
      for pr:=2 to length(ps1) do
      begin
        if ps1[pr]='_' then ps1[pr]:=' ';
        ps2:=ps2+ps1[pr];
      end;
      newMobType(ps2,0,pi1,pi2,pi3,pi4,pi5,pi6,pi7,pi8,pi9,pi10,pi11,pc1,false,true);
    end;
  end;
  close(modFile);
end;
procedure incMods();
var
modFile:text;
str1:string;
begin
  assign(modFile,'modlist.pct');
  if not {fileexists('modlist.pct')} false then
  begin
    rewrite(modFile);
    writeln(modFile,'{');
    writeln(modFile,'}');
    close(modFile);
  end;
  reset(modFile);
  while str1<>'}' do
  begin
    readln(modFile,str1);
    if (str1<>'{')and(str1<>'}') then addMod(str1+'.pct');
  end;
  close(modFile);
end;
procedure doSomethingBad();
var
prp:longint;
begin
textbackground(lightgray);
	for prp:=2 to 22 do
  begin
    gotoxy(2,prp);
    if prp=2 then writeln('       O NIE!        ');
    if prp=3 then writeln(' Niefajny murzyn     ');
    if prp=4 then writeln('  kupil sobie rozdzke');
    if prp=5 then writeln('i przy pomocy        ');
    if prp=6 then writeln('     dostarczonych   ');
    if prp=7 then writeln(' shardow nauczyl     ');
    if prp=8 then writeln('    sie zaklecia:    ');
    if prp=9 then writeln('AWADA KEDAWRA !!!!!1 ');
    if prp=10 then writeln('   JEB JEB JEB JEB   ');
    if prp=11 then writeln('JEB JEB JEB JEB      ');
    if prp=12 then writeln('     JEB JEB JEB JEB ');
    if prp=13 then writeln('  JEB JEB JEB JEB    ');
    if prp=14 then writeln('     JEB JEB JEB JEB ');
    if prp=15 then writeln(' PRZEGRALES!         ');
    if (prp>15) then writeln('                     ');
  end;
  while c<>#13 do c:=readkey();
  ent := 1;
end;
procedure mapgen();
var
pr,ppr,pr2:longint;
begin
  for pr:=1 to 1000 do
  begin
    for ppr:=1 to 1000 do
    begin
      ran:=random(10000);
      if ran<24 then genriver(pr,ppr);
      if (ran>9985)and(map[pr,ppr]=0) then gencity(pr,ppr);
      if (ran>1000)and(ran<1100) then genforest(pr,ppr);
    //if ((ran>2000)and(ran<2005))or((ran>2000)and(ran<4000)and(map[ppr,pr]=11)) then gendesert(pr,ppr,random(3)+2);
    genvarious(pr,ppr);
  end;
end;
for pr:=1 to 1000 do
begin
  for ppr:=1 to 1000 do
  begin
    for pr2:=1 to strn do
    begin
      if (random(tst[pr2].rar)=1)and(map[pr,ppr]=0)then genStructure(pr2,pr,ppr);
    end;
  end;
end;
end;
begin
  for p:=1 to 1000000 do tu[p].mode:=-1;
  setRep();
  isDemonic:=false;
  spawnrate:=300;
  badTimer:=-1;
  cursoroff();
  clrscr;
  write('Setting varialbes...');
  blk:=1;
  me.hp:=190;
  me.mhp:=190;
  eq[4]:=10;
  eq[3]:=32;
  eq[2]:=1;
  eq[1]:=1;
  writeln('DONE!');
  //credits
  addCredit('Credits',3);
  addCredit('',0);
  addCredit('',0);
  addCredit('Main Coder',2);
  addCredit('Piotr Kowalewski',0);
  addCredit('',0);
  addCredit('Map Generator',2);
  addCredit('Piotr Kowalewski',0);
  addCredit('',0);
  addCredit('Most of Items',2);
  addCredit('Piotr Kowalewski',0);
  addCredit('',0);
  addCredit('AI and Mobs',2);
  addCredit('Piotr Kowalewski',0);
  addCredit('',0);
  addCredit('Plot',2);
  addCredit('Piotr Kowalewski',0);
  addCredit('Ja',0);
  addCredit('',0);
  addCredit('One Item',2);
  addCredit('Adam Ogorek',0);
  addCredit('',0);
  addCredit('Russian Leader',2);
  addCredit('Vladimir Putin',0);
  addCredit('',0);
  addCredit('Ingame Character',2);
  addCredit('Everyone',0);
  addCredit('',0);
  addCredit('Best Character',2);
  addCredit('Juliusz Pham',0);
  addCredit('',0);
  addCredit('Hero of USSR',2);
  addCredit('Juliusz Pham',0);
  addCredit('',0);
  addCredit('Sounds',2);
  addCredit('Piotr Kowalewski',0);
  addCredit('',0);
  addCredit('Pham',2);
  addCredit('Spham',0);


  //terrain
  write('Defining terrain...');
  newterrain('Plains',2,2,' ',true,'.');
  newterrain('Water',1,15,#0,true,'~');
  newterrain('City',-1,-1,' ',true,'c');
  newterrain('Leaves',2,0,#177,true,'#');
  newterrain('Road',7,7,#0,true,'|');
  newterrain('Rose',2,4,#4,true,'r');
  newterrain('Blue Flower',2,9,#4,true,'f');
  newterrain('Long Grass',2,0,#176,true,'g');
  newterrain('Bark',6,0,#177,false,'b');
  newterrain('Stone',1,8,#254,true,'s');
  newterrain('Stone Wall',7,8,#177,false,'w');
  newterrain('Desert',6,14,#177,true,'d');
  newterrain('Loot Chest',2,6,'X',true,'o');
  newterrain('Black Block',0,8,#177,false,'0');
  newterrain('Battletower',3,8,#177,true,'B');
  newterrain('BattletowerMain',3,8,#177,true,'T');
  newterrain('Water Lily',1,2,#5,true,'l');
  newterrain('Yellow Flower',2,14,#4,true,'y');
  newterrain('Red Block',4,12,#177,false,'4');
  writeln('DONE!');
  write('Defining structures...');
  //structures
  addStructure(['ggggggg','gyyyyyg','gyfffyg','gyfrfyg','gyfffyg','gyyyyyg','ggggggg'],'Garden',750);
  addStructure([' # ','#b#',' # '],'Lone Tree',100);
  addStructure(['www  www','w0wwww0w','wwwyfwww',' wf44yw ',' wy44fw ','wwwfywww','w0wwww0w','www  www'],'Epic Castle',1200);
  addStructure([' ww ','w00w','w00w',' ww '],'Baisic Tower',1000);
  addStructure(['  wBw  ',' w000w ','w00000w','B00T00B','w00000w',' w000w','  wBw  '],'Battletower',3000);
  writeln('DONE!');
  write('Defining items...');
  //items
  newitem('Iron Sword',1,50,4,50,2,100);
  newitem('Hunting Bow',4,60,10,200,8,100);
  newitem('Arrow',5,1,1,3,16,200);
  newitem('Stone',0,1,1,10,4,150);
  newitem('Iron Dagger',1,35,2,35,1,100);
  newitem('Iron Waraxe',1,60,5,65,1,100);
  newitem('Iron Mace',1,70,6,80,2,100);
  newitem('Iron Greatsword',1,85,8,125,3,90);
  newitem('Iron Battleaxe',1,100,10,150,3,90);
  newitem('Iron Warhammer',1,120,12,175,3,90);
  newitem('Chainmal Helmet',3,3,0,140,1,80);
  newitem('Chainmal Chestplate',3,8,0,300,2,80);
  newitem('Chainmal Gauntlets',3,2,0,60,3,80);
  newitem('Chainmal Leggings',3,5,0,180,4,80);
  newitem('Chainmal Boots',3,2,0,60,5,80);
  newitem('Wooden Shield',3,5,0,180,6,80);
  newitem('Minor Health Potion',2,40,1,120,0,150);
  newitem('Steel Dagger',1,56,1,280,1,70);
  newitem('Steel Sword',1,86,4,400,2,70);
  newitem('Steel Waraxe',1,98,5,520,1,70);
  newitem('Steel Mace',1,100,6,640,2,70);
  newitem('Steel Greatsword',1,125,7,1000,3,60);
  newitem('Steel Battleaxe',1,144,9,1200,3,60);
  newitem('Steel Warhammer',1,163,11,1400,3,60);
  newitem('Longbow',4,100,12,560,12,60);
  newitem('Ironplate Helmet',3,6,0,300,1,50);
  newitem('Ironplate Chestplate',3,14,0,750,2,50);
  newitem('Ironplate Gauntlets',3,4,0,200,3,50);
  newitem('Ironplate Leggings',3,11,0,500,4,50);
  newitem('Ironplate Boots',3,4,0,200,5,50);
  newitem('Iron Shield',3,11,0,500,6,50);
  newitem('Strong Health Potion',2,100,1,320,0,90);
  newitem('Damascus Dagger',1,96,1,2300,1,40);
  newitem('Damascus Sword',1,128,3,3200,2,40);
  newitem('Damascus Waraxe',1,144,4,3500,2,40);
  newitem('Damascus Mace',1,160,5,3800,2,40);
  newitem('Damascus Greatsword',1,215,6,4200,3,30);
  newitem('Damascus Battleaxe',1,240,14,4800,3,30);
  newitem('Damascus Warhammer',1,265,10,5400,3,30);
  newitem('Reflex Bow',4,200,10,2400,21,30);
  newitem('Steelplate Helmet',3,9,0,1200,1,20);
  newitem('Steelplate Chestplate',3,22,0,2250,2,20);
  newitem('Steelplate Gauntlets',3,6,0,750,3,20);
  newitem('Steelplate Leggings',3,16,0,1500,4,20);
  newitem('Steelplate Boots',3,6,0,750,5,20);
  newitem('Steel Shield',3,16,0,1500,6,20);
  newitem('Godly Health Potion',2,190,1,720,0,50);
  newitem('Boat',3,47,0,100000,2,1);
  newitem('Amulet of Magdadagan',6,0,1,1300,1,50);
  newitem('Amulet of Tigsalom',6,150,1,1650,2,50);
  newitem('Amulet of Nabob',6,150,1,1200,3,50);
  newitem('Amulet of Mensahe',6,150,1,1000,4,50);
  newitem('Amulrt of Kabalyero',6,130,1,1425,5,50);
  newitem('Amulet of Gamhanan',6,150,1,7500,-1,15);
  newitem('Bojowy Brzuh Wojcieha',1,1000,1,100000,4,1);
  newitem('AK-47',4,1000,0,100000,100,1);
  newitem('Shovel',7,1,1,250,1,25);
  newitem('Fleuve d'+#39+'etoiles',1,300,15,100000,4,1);
  newitem('Soul Shard',8,1,1,1000,1,0);
  writeln('DONE!');
  write('Including mods...');
  incMods();
  writeln('DONE!');
  randomize;
  write('Starting game...');
  writeln('DONE!');
  clrscr;
  menu();
  textbackground(blue);
  clrscr;
  mapgen();
  for p:=1 to cn do map[tc[p].y,tc[p].x]:=2;
  me.x:=500;
  textbackground(black);
  me.y:=500;
  while map[me.y,me.x]<>0 do
  begin
    me.x:=random(800)+100;
    me.y:=random(800)+100;
  end;
  for p:=1 to 25 do
  begin
    for pp:=1 to 23 do write(' ');
    writeln();
  end;
  //start gry
  me.nm:=':putnam:';
  ci:=1;
  me.gm:=-1;
  while ent=0 do
  begin
    tip('new tick');
    p:=random(950)+25;
    pp:=random(950)+25;
    if cmap[p,pp]<>0 then cityGrow(p,pp);
    if (badTimer>-1)and(badTimer<10000) then inc(badTimer);
    if badTimer=999 then doSomethingBad();
    //mobs
    //spawnscr,hp,cd,mcd,col,ri,ro,dol,pow,xp,spawnrate,isArcher:longint  ren:char
    newMobType('Blue Citizan',0,150,15,10,9,4,9,3,20,4,1,0,#2,false,false);
    newMobType('Green Citizan',0,150,15,10,10,4,9,3,20,4,1,0,#2,false,false);
    newMobType('Cyan Citizan',0,150,15,10,11,4,9,3,20,4,1,0,#2,false,false);
    newMobType('Red Citizan',0,150,15,10,12,4,9,3,20,4,1,0,#2,false,false);
    newMobType('Pink Citizan',0,150,15,10,13,4,9,3,20,4,1,0,#2,false,false);
    newMobType('Yellow Citizan',0,150,15,10,14,4,9,3,20,4,1,0,#2,false,false);
    newMobType('White Citizan',0,150,15,10,15,4,9,3,20,4,1,0,#2,false,false);
    newMobType('Bandit',0,150,15,10,0,4,9,5,20,7,10,0,#2+#1,true,true);
    newMobType('Golem',0,225,20,16,11,4,8,7,50,20,5,0,#207,true,true);
    newMobType('Stalker',0,70,10,7,0,5,10,4,14,8,7,0,#15,true,true);
    newMobType('Wisp',1200,10,2,3,7,7,14,16,10,23,3,0,'        '+#21,true,true);
    newMobType('Slayer',5000,400,6,8,4,8,10,83,24,30,2,0,#184,true,true);
    newMobType('Behemoth',10000,1500,24,20,12,4,8,250,191,31,1,0,#148+#153,true,true);
    newMobType('Widow',800,120,30,7,5,9,11,30,50,23,4,1,'x'+#158,true,true);
    newMobType('Ranger',3000,175,20,6,0,10,13,113,75,27,3,1,#177+#177+#177+#177+#176,true,true);
    newMobType('Murzyn',0,8000,15,0,15,50,100,10000,75,1000,0,0,'/' + #196 + '\|',true,true);
    check_Amulet();
    check_Battletower();
    tip('checks');
    delay(2);
    if loat=1 then
    begin
      loat:=0;
      load('pct');
    end;
    for p:=0 to 9 do
    begin
      if eq[nums[p]]<1 then nums[p]:=0;
    end;
    for p:=1 to 6 do
    begin
      if eq[armor[p]]<1 then armor[p]:=0;
    end;

    if me.hp<me.mhp then me.hp:=me.hp+random(2);
    if cooldown>0 then dec(cooldown);
    for ecounter:=1 to en do checkMobDeaths(ecounter);
    tip('mob deaths');
    for ecounter:=1 to en do enemy_sim_spliter(ecounter);
    tip('mob sim');
    for ecounter:=1 to en do if tu[ecounter].mode>-1 then umap[tu[ecounter].x,tu[ecounter].y]:=ecounter;
    for pcounter:=1 to pn do projectiles(pcounter);
    tip('projectiles');
    if mcd>0 then dec(mcd);
    if keypressed then c:=readkey();
    if map[me.y,me.x]=1 then me.hp:=me.hp-round(20*me.waterprc);
    if c='a' then wc:='a';
    if c='d' then wc:='d';
    if c='w' then wc:='w';
    if c='s' then wc:='s'; 
    if c='+' then spawn(me.x+4,me.y+4,1);
    if c='p' then
    begin
      for p:=4 to 20 do
      begin
        for pp:=7 to 14 do
        begin
          gotoxy(p,pp);
          if ((p-3)mod 16=1)or((pp-6)mod 7=1)then textbackground(0) else textbackground(7);
          write(' ');
        end;
      end;
      textcolor(0);
      textbackground(7);
      gotoxy(7,9);
      write('GAME PAUSED');
      gotoxy(7,10);
      write('Press enter');
      gotoxy(7,11);
      write('to continue');
      gotoxy(11,12);
      write('...');
      while (c<>#13)and(c<>#27) do c:=readkey();
      if c=#13 then c:=#177;
    end;
    if c='y' then genStructure(1,me.x,me.y);
    if (wc='a')and(me.x>12)and(mcd=0)and ter[map[me.y,me.x-1]].a and(me.rep[tc[cmap[me.y,me.x-1]].who]<3000) then
    begin
      dec(me.x);
      mcd:=me.speed;
      wc:=' ';
    end;
    if (wc='d')and(me.x<987)and(mcd=0)and ter[map[me.y,me.x+1]].a and(me.rep[tc[cmap[me.y,me.x+1]].who]<3000)then
    begin
      inc(me.x);
      mcd:=me.speed;
      wc:=' ';
    end;
    if (wc='w')and(me.y>12)and(mcd=0)and ter[map[me.y-1,me.x]].a and(me.rep[tc[cmap[me.y-1,me.x]].who]<3000)then
    begin
      dec(me.y);
      mcd:=me.speed;
      wc:=' ';
    end;
    if (wc='s')and(me.y<987)and(mcd=0)and ter[map[me.y+1,me.x]].a and(me.rep[tc[cmap[me.y+1,me.x]].who]<3000)then
    begin
      inc(me.y);
      mcd:=me.speed;
      wc:=' ';
    end;
    if c='b' then blk:=blk*-1;
    if c='z' then
    begin
      dec(ci);
      while eq[ci]=0 do
      begin
        if ci>0 then dec(ci) else ci:=itn;
      end;
    end;
    if c='x' then
    begin
      inc(ci);
      while eq[ci]=0 do
      begin
        if ci<itn then inc(ci) else ci:=1;
      end;
    end;
    if c='e' then inInventory();
    if c='<' then save('pct');
    if c='>' then load('pct');
    if (ord(c)>47)and(ord(c)<58) then
    begin
      if nums[ord(c)-48]<>0 then ci:=nums[ord(c)-48];
    end;
    if (c='k')and(cooldown=0) then
    begin
      if ti[ci].p=1 then attack(me.y+1,me.x,ti[ci].z,0,ti[ci].h)else if ti[ci].p<>4 then use(me.y+1,me.x,ci)
      else
      begin
        if eq[3]>0 then
        begin
          newProjectile(me.y,me.x,ti[ci].z,ti[ci].h,2,0);
          cooldown:=ti[ci].cd;
          dec(eq[3]);
        end;
      end;
    end;
    if (c='i')and(cooldown=0) then
    begin
      if ti[ci].p=1 then attack(me.y-1,me.x,ti[ci].z,0,ti[ci].h)else if ti[ci].p<>4 then use(me.y-1,me.x,ci)
      else
      begin
        if eq[3]>0 then
        begin
          newProjectile(me.y,me.x,ti[ci].z,ti[ci].h,1,0);
          cooldown:=ti[ci].cd;
          dec(eq[3]);
        end;
      end;
    end;
    if (c='l')and(cooldown=0) then
    begin
      if ti[ci].p=1 then attack(me.y,me.x+1,ti[ci].z,0,ti[ci].h)else if ti[ci].p<>4 then use(me.y,me.x+1,ci)
      else
      begin
        if eq[3]>0 then
        begin
          newProjectile(me.y,me.x,ti[ci].z,ti[ci].h,3,0);
          cooldown:=ti[ci].cd;
          dec(eq[3]);
        end;
      end;
    end;
    if (c='j')and(cooldown=0) then
    begin
      if ti[ci].p=1 then attack(me.y,me.x-1,ti[ci].z,0,ti[ci].h)else if ti[ci].p<>4 then use(me.y,me.x-1,ci)
      else
      begin
        if eq[3]>0 then
        begin
          newProjectile(me.y,me.x,ti[ci].z,ti[ci].h,4,0);
          cooldown:=ti[ci].cd;
          dec(eq[3]);
        end;
      end;
    end;
    if (c='R')and(cmap[me.y,me.x]<>0)then tc[cmap[me.y,me.x]].who:=4;
    if (c='B')and(cmap[me.y,me.x]<>0)then tc[cmap[me.y,me.x]].who:=3;
    if (c='P')and(cmap[me.y,me.x]<>0)then tc[cmap[me.y,me.x]].who:=5;
    if (c='Y')and(cmap[me.y,me.x]<>0)then tc[cmap[me.y,me.x]].who:=6;
    if (c='W')and(cmap[me.y,me.x]<>0)then tc[cmap[me.y,me.x]].who:=7;
    if (c='G')and(cmap[me.y,me.x]<>0)then tc[cmap[me.y,me.x]].who:=0;
    if (c='$')and(cmap[me.y,me.x]<>0)then inShop(cmap[me.y,me.x]);
    if c=#27 then
    begin
      gotoxy(2,24);
      textbackground(lightgray);
      textcolor(black);
      write('Are you sure?        ');
      c:=readkey();
      if (c=#27)or(c=#10)or(c=#13) then ent:=2;
    end;
    tip('keys');    
    
    
    for p:=-12 to 12 do
    begin
      for pp:=-12 to 12 do
      begin
        if (c<>#1)and(ren<256)and(umap[me.y+p,me.x+pp]=0)and(map[me.y+p,me.x+pp]=0)and(random(spawnrate)=0)and((abs(p)>10)or(abs(pp)>10))and(not(mobinrange(me.y+p,me.x+pp,2))) then spawn(me.x+pp,me.y+p,chooseMobId());
      end;
    end;
    tip('mobspawn');
    gotoxy(1,1);
    textcolor(black);
    textbackground(black);
    for p:=1 to 23 do writewidechar(#$2588);
    writeln();
    c:=#1;
    for p:=me.y-10 to me.y+10 do
    begin
      textcolor(black);
      writewidechar(#$2588);
      for pp:=me.x-10 to me.x+10 do
      begin
        if(badTimer>0)and(p<me.y-7)and(pp>me.x+3) then
        begin
        end
        else
        begin
          if cmap[p,pp]=0 then render(p,pp) else crender(p,pp);
        end;
      end;
      textcolor(black);
      textbackground(black);
      writewidechar(#$2588);
      writeln();
    end;
    
    textcolor(black);
    textbackground(black);
    for p:=1 to 23 do writewidechar(#$2588);
    textbackground(white);
    writeln();
    writewidechar(#$2588);
    //for p:=1 to 21 do write(' ');
    if cmap[me.y,me.x]<>0 then
    begin
      popstr:='('+strink(tc[cmap[me.y,me.x]].dpop)+#2+') ';
      if tc[cmap[me.y,me.x]].pop>5 then write(' ',tc[cmap[me.y,me.x]].nm,' city',popstr:15-length(tc[cmap[me.y,me.x]].nm))
      else write(' ',tc[cmap[me.y,me.x]].nm,' vile',popstr:15-length(tc[cmap[me.y,me.x]].nm));
      //write(tc[cmap[me.y,me.x]].nm:6,' ',#2,tc[cmap[me.y,me.x]].dpop:4,' $',tc[cmap[me.y,me.x]].cash:6,' ');
      if me.nm='Pham' then ent:=3;
      if (entCity = 0) and (me.scr >= 5000) then fab1();
      if (entCity = 1) and (me.cash >= 10000) then fab2();
      if (entCity = 3) and (hasItemName('Soul Shard') >= 10) then fab5();
    end else
    //totu
    begin
      cos1:=length(ter[map[me.y,me.x]].n);
      for p:=1 to ((21-cos1)div 2) do write(' ');
      write(ter[map[me.y,me.x]].n);
      for p:=(((21-cos1)div 2)+1+cos1) to 21 do write(' ');
	  if entcity = 2 then entcity := 1;
	  if entcity = 4 then entcity := 3;
    end;
    textbackground(black);
    writewidechar(#$2588);
    textbackground(white);
    writeln();
    writewidechar(#$2588);
    textcolor(lightred);
    write(' ');
    for p:=1 to 19 do
    begin
      if (p-1)*me.mhp div 19+me.mhp div 38<me.hp then write(#3) else write(' ');
    end;
    write(' ');
    textcolor(black);
    textbackground(black);
    writewidechar(#$2588);
    textbackground(white);
    writeln();
    writewidechar(#$2588);
    write(' x=',me.x:4,'       y=',me.y:4,' ');
    textbackground(black);
    writewidechar(#$2588);
    textbackground(white);
    writeln();
    writewidechar(#$2588);
    s3:=ti[ci].nm;
    if (ti[ci].p=0)or(ti[ci].p=5) then
    begin
      str(eq[ci],s4);
      s3:=s3+'('+s4+')';
    end;
    if ti[ci].p=4 then
    begin
      str(eq[3],s4);
      s3:=s3+'('+#24+':'+s4+')';
    end;
    cos1:=length(s3);
    for p:=1 to ((21-cos1)div 2) do write(' ');
    if cooldown=0 then textcolor(black) else textcolor(darkgray);
    write(s3);
    textcolor(black);
    for p:=(((21-cos1)div 2)+1+cos1) to 21 do write(' ');
    textbackground(black);
    writewidechar(#$2588);
    writeln();
    for p:=1 to 23 do writewidechar(#$2588);
    writeln();
    if badTimer>1 then
    begin
      gotoxy(16,2);
      textcolor(black);
      textbackground(lightgray);
      writewidechar(#$2588);
      textcolor(lightred);
      write('Timer:');
      gotoxy(16,3);
	  textcolor(black);	
      writewidechar(#$2588);
      textcolor(lightred);
      write(1000-badTimer:6);
      gotoxy(16,4);
      textcolor(black);
      textbackground(black);
      write('       ');
    end;
    //writeln(tu[umap[me.x,me.y]].mcd,':',umap[me.x,me.y],' (',hm,'),tick:',tick);
    if me.gm=1 then me.hp:=me.mhp;
    if me.hp<0 then ent:=1;
    for p:=0 to 7 do if me.rep[p]<1300 then 
    begin
      if not canRule then winScr();
      canRule:=true;
    end;
    tip('drawmap');  
  end;
  if ent=1 then deathScr();
  if ent=3 then phamScr();
end.

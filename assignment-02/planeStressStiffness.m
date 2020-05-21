clear all;
clc;

node = [
0	0;
2.4	0;
-1.2	1.9;
1.2	1.9;
3.6	1.9;
0 3.7;
2.4 3.7;
];

elem = [
  0 3 2;
  0 1 3;
  1 4 3;
  3 4 6;
  3 6 5;
  3 5 2;
];
elem += 1;


bound = [
1	0	0;
2	0	0;
];

GFFC = [
0
0
0
0
0
0
0
0
0
0
0
-0.003
0
-0.003
];

# material constants
E = 30.6;
nu = 0.3;

lam = E * nu / ( (1 + nu) * (1 - 2 * nu) );
mu = E / 2 / (1 + nu);

#thickness of model
t = 0.85;

##============================== начало скрипта ================================

ss = "";
for ne = 1:length(elem),
  ss = strcat (ss, "   elem_", num2str(ne), "@");
  aai = _a(node,elem,ne);  
  bbi = _b(node,elem,ne);
  cci = _c(node,elem,ne);
  ddi = _delta(node,elem,ne);
  for row = 1:3,
    aa(row,ne) = aai(row); 
    bb(row,ne) = bbi(row);
    cc(row,ne) = cci(row);
    dd(1,ne) = ddi;
  endfor;
endfor;
disp(ss);
## вывод коэффициентов функций форм по всем  Ё
aa = aa
bb = bb
cc = cc
dd = dd

## блочна€ матрица жЄсткости, где p q - локальные узлы  Ё, ne - его номер
p = 1;
q = 1;
ne = 1;
KM = _KM (p, q, node, elem, ne, lam, mu, t)

## локальные матрицы жЄсткости (дл€ выбранныз  Ё)
for ne = 1:length(elem),
printf("for element %i \n", ne);  
LKK = _LKK (node, elem, ne, lam, mu, t)
endfor;

## глобальна€ матрица жЄсткости
GKK = _GKK (node, elem, 1, lam, mu, t);
for ie = 2:length(elem),
GKK = GKK + _GKK (node, elem, ie, lam, mu, t);
endfor
GKK
GGKC = _GKKC (node, elem, ne, lam, mu, t, bound, GKK);
GGKC
GGKCR = GGKC^(-1);
GGKCR
uu=GGKCR*GFFC;
uu
def = zeros(3,1);
stress = zeros(3,1);
for ne = 1:length(elem),
  printf("for element %i \n", ne);  
  for j=1:3,
def(1)=def(1)+bb(j,ne)*uu(2*elem(ne,j)-1)/dd(1,ne);
endfor;
for j=1:3,
def(2)=def(2)+cc(j,ne)*uu(2*elem(ne,j))/dd(1,ne);
endfor;
for j=1:3,
def(3)=def(3)+cc(j,ne)*uu(2*elem(ne,j)-1)+bb(j,ne)*uu(2*elem(ne,j))/dd(1,ne);
endfor;
def
s(1)=E/(1-nu^2)*(def(1)+nu*def(2));
s(2)=E/(1-nu^2)*(def(2)+nu*def(1));
s(3)=E/(1+nu)*def(3)/2;
s
endfor;
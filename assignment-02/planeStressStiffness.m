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
t = 1;

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

GGKC = _GKKC (node, elem, ne, lam, mu, t, bound, GKK);
uu = GGKC^(-1)*GFFC;

for ne = 1:length(elem),
  strain = zeros(3, 1);
  printf("for element %i \n", ne);  
  for j = 1:3,
    strain(1) += bb(j, ne) * uu(2 * elem(ne, j) - 1) / dd(1, ne);
  endfor;
  for j = 1:3,
    strain(2) += cc(j, ne) * uu(2 * elem(ne, j)) / dd(1, ne);
  endfor;
  for j = 1:3,
    strain(3) += (cc(j, ne) * uu(2 * elem(ne, j) - 1) + bb(j, ne) * uu(2 * elem(ne, j))) / dd(1, ne);
  endfor;
  strain
  stress = [
    E / (1 - nu^2) * (strain(1) + nu * strain(2));
    E / (1 - nu^2) * (strain(2) + nu * strain(1));
    E / (1 + nu) * strain(3) / 2;
  ]
endfor;
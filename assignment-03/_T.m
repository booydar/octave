function result = _T (node, elem, ne, K, AT, nu, E, t)
  b = _b(node, elem, ne); 
  c = _c(node, elem, ne);
  result = zeros(2 * K, 1);
  n = 3;
  for p = 1:n,
    bp = b(p);
    cp = c(p);
    result(2 * elem(ne, p) - 1) = bp * AT * E * t / (1 - nu) / 2;
    result(2 * elem(ne, p)) = cp * AT * E * t / (1 - nu) / 2;
  endfor;
endfunction

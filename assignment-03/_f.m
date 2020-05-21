function result = _f (node, elem, ne, K, t, rho, g)
  d = _delta(node, elem, ne);
  result = zeros(2 * K, 1);
  n = 3;
  for i = 1:n
    result(2 * elem(ne, i) - 1) = d * t * rho * g(1) / 6;
    result(2 * elem(ne, i)) = d * t * rho * g(2) / 6;
  endfor;
endfunction
function result = _GKK (node, elem, ne, lam, mu, t)
  n = 3;
  d = 2;
  N = length(node);
  
  result = zeros(N * d, N * d);
  for p = 1:n,
    for q = 1:n,
      LKK = _LKK (node, elem, ne, lam, mu, t);
      for i = 1:d,
        for j = 1:d,
          #result(,) = LK(,);
          result(i + d*(elem(ne, p)-1), j + d*(elem(ne, q)-1)) = LKK(i + d*(p-1), j + d * (q-1));
        endfor;
      endfor;
    endfor;
  endfor;   
endfunction

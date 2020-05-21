function result = _GKK (node, elem, ne, lam, mu, t)
  
 N = length(node);
  d = 2;
  n = 3;
  result = zeros(N * d, N * d);
  LKK = _LKK (node, elem, ne, lam, mu, t);
  for p = 1:n,
    for q = 1:n,
      for i = 1:d,
        for j = 1:d,
          result(d*(elem(ne,p)-1)+i,d*(elem(ne,q)-1)+j) = LKK(i+d*(p-1),j+d*(q-1));
        endfor;
      endfor;
    endfor;
  endfor;   
endfunction
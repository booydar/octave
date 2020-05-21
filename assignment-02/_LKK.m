function result = _LKK (node, elem, ne, lam, mu, t)
  n = 3;
  d = 2;
  result = zeros(n * d, n * d);
  for p = 1:n,
    for q = 1:n,
      KM = _KM (p, q, node, elem, ne, lam, mu, t);
      for i = 1:d,
        for j = 1:d,
          result(i + d*(p - 1),j + d*(q - 1)) = KM(i, j);
        endfor; 
      endfor;
    endfor;
  endfor;  
endfunction
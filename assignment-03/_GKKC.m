function result = _GKKC (node, elem, ne, lam, mu, t, bound, GKK)
  K = length(bound) - 1;
  d = 2;
  N = length(node);
  result = zeros(N * d, N * d);
  for i = 1:(N * d),
    for j = 1:(N * d),
      result(i, j) = GKK(i, j);
    endfor;
  endfor;
  for p = 1:K,
    for i = 1:(N * d),
      for j = (bound(p, 1) * d + 1):((bound(p, 1) + 1) * d),
        if(i == j),
          result(i, j) = GKK(i, j);
        else,
          result(i, j) = 0;
        endif;
      endfor;
    endfor;
  endfor;
  for p = 1:K,
    for i = (bound(p, 1) * d + 1):((bound(p, 1) + 1) * d),
      for j = 1:(N * d),
        if(i == j),
          result(i, j) = GKK(i, j);
        else,
          result(i, j) = 0;
        endif;
      endfor;
    endfor;
  endfor;   
endfunction
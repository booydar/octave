function result = _KM (p, q, node, elem, ne, lam, mu, t)
  b = _b(node, elem, ne); 
  c = _c(node, elem, ne);
  d = _delta(node, elem, ne);  
  bp = b(p);
  bq = b(q);
  cp = c(p);
  cq = c(q);  
  result = [
    (lam + 2 * mu) * bp * bq + mu * cp * cq  lam * bp * cq + mu * cp * bq;
     lam * cp * bq + mu * bp * cq            (lam + 2 * mu) * cp * cq + mu * bp * bq;
  ] * t / 2 / d;
endfunction
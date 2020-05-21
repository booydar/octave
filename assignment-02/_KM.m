function result = _KM (p, q, node, elem, ne, lam, mu, t)
  b = _b(node, elem, ne); 
  c = _c(node, elem, ne);
  d = _delta(node, elem, ne);  
  bp = b(p);
  bq = b(q);
  cp = c(p);
  cq = c(q);  
  result = [
    bp*bq+(lam+2*mu)*cp*cq/4/(lam+mu)  lam*bp*cq/2/(lam+mu)+(lam+2*mu)*cp*bq/4/(lam+mu);
     lam*cp*cq/2/(lam+mu)+(lam+2*mu)*bp*cq/4/(lam+mu)            cp*cq+(lam+2*mu)*bp*bq/4/(lam+mu);
  ] * t * mu * 2 * (lam+mu) / d / (lam+2*mu);
endfunction
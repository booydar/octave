function result = _b (node, elem, ne)
  result(1,1) = node(elem(ne,2),2) - node(elem(ne,3),2);
  result(2,1) = node(elem(ne,3),2) - node(elem(ne,1),2);
  result(3,1) = node(elem(ne,1),2) - node(elem(ne,2),2);
endfunction

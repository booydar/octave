function result = _c (node, elem, ne)
  result(1, 1) = node(elem(ne, 3), 1) - node(elem(ne, 2), 1);
  result(2, 1) = node(elem(ne, 1), 1) - node(elem(ne, 3), 1);
  result(3, 1) = node(elem(ne, 2), 1) - node(elem(ne, 1), 1);
endfunction

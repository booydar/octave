function result = _a (node, elem, ne)
  result = [
  result(1, 1) = node(elem(ne, 2), 1) * node(elem(ne, 3), 2) - node(elem(ne, 3), 1) * node(elem(ne, 2), 2);
  result(2, 1) = node(elem(ne, 3), 1) * node(elem(ne, 1), 2) - node(elem(ne, 1), 1) * node(elem(ne, 3), 2);
  result(3, 1) = node(elem(ne, 1), 1) * node(elem(ne, 2), 2) - node(elem(ne, 2), 1) * node(elem(ne, 1), 2);
  ];
endfunction
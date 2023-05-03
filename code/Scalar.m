function [A] = Scalar(A, scalar)
  [row, col] = size(A);
  
  for i=1 : row
    for j=1 : col
      A(i,j) = scalar * A(i,j);
    endfor
  endfor
endfunction

function [C] = Addition(A,B)
  [row1 , col1] = size(A);
  
  for i=1 : row1
    C(i,i)=0;
    for j=1 : col1
      C(i,j) = A(i,j) + B(i,j);
    endfor
  endfor
endfunction

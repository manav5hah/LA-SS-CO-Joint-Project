function [s1] = Covariance(X, u)
  TOTCLASS=2;
  [row,col] = size(X);
  s1 = [0,0;0,0];
  
  for i=1:row
    for j=1:col
      v(j) = X(i, j) - u(j);
    endfor
    t = Transpose(v);
    m = Multiplication(t, v);
    s1 = Addition(m, s1);
  endfor
  s1 = s1/(row-1);
  
endfunction

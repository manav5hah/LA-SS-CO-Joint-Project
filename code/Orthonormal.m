function [Q] = Orthonormal(X)
  [row,col] = size(X);
  for i=1:col
    squar=0;
    for j=1:row
      squar = squar+(X(j,i)*X(j,i));
    endfor
    squarroot = sqrt(squar);
    Q(:,i) = Scalar(X(:,i),1/squarroot);
  endfor
endfunction

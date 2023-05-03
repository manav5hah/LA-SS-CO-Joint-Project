function [X, Y] = Find(A, rowNo, colNo, Y)
  %X=[0;0];
  %if (Y(colNo)==1)
   % return;
  %else
    X = (-1) * A(:, colNo);
    
    X(colNo) = 1;
    Y(colNo) = 1;
  %endif
  
endfunction

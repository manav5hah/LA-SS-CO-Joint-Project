A = [1,2,3 ; 4,5,6 ; 7,8,9];
B = [1,2,3,1,0,0 ; 4,5,6,0,1,0 ; 7,8,9,0,0,1];

[row,col] = size(A);
  
  [row1,col1] = size(B);
  
  A = B(: , col+1:col1); 
  disp("A");
  disp(A);
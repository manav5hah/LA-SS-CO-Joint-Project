%A=[-1,-2,-2;1,2,1;-1,-1,0]
%A=[1,1,1,1,1;16,8,4,2,1;81,27,9,3,1;256,64,16,4,1;625,125,25,5,1]
function [V,D]= Eigen(A)

  
  %A=[9.2213,6.489;4.2339,2.9794];
  disp(A)
  B = A;
  [row,col] = size(A);
  
  cnt=1;
  
  for k=1 : 20
    
    [Q,R] = QR(A);
    A = Multiplication(R,Q);
    
  endfor
  
  for i=1 : row
    for j=1 : col
      if (i==j)
        D(i,j) = A(i,j);
      else
        D(i,j)=0;
      endif
    endfor
  endfor
  
  for i=1 : row
    C=B;
    
    for j=1 : col
      C(j,j) = C(j,j) - D(i,i);
    endfor
   
    C = RREF(C,0);
    
    result(:,cnt) = EigenVector(C);
    cnt=cnt+1;
  endfor
  
  V = Orthonormal(result);
  disp("EigenVector");
  disp(V);
  disp("Diagonal");
  disp(D);
endfunction
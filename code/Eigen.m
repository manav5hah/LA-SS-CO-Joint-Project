%A=[-1,-2,-2;1,2,1;-1,-1,0]
%A=[1,1,1,1,1;16,8,4,2,1;81,27,9,3,1;256,64,16,4,1;625,125,25,5,1]
function [V,D]= Eigen(A)

  %A=[1,1,1,1,1;16,8,4,2,1;81,27,9,3,1;256,64,16,4,1;625,125,25,5,1]
 % C=[9.2213,6.489;4.2339,2.9794];
  
  A =[ 0.00117795   0.00035526
   0.00039553   0.00011929];
 
  disp("A")
  disp(A)
  B = A;
  B1 = A;
  [row,col] = size(A);
  cnt=1;
  
  for k=1 : 20
    
    [Q,R] = QR(B1);
    B1 = Multiplication(R,Q);
    
  endfor
  disp("B1")
  disp(B1);
  for i=1 : row
    for j=1 : col
      if (i==j)
        D(i,j) = B1(i,j);
      else
        D(i,j)=0;
      endif
    endfor
  endfor
  
  disp("D")
  disp(D)
  
  for i=1 : row
    C=B;
    disp("C = B")
    disp(C)
    for j=1 : col
      C(j,j) = C(j,j) - D(i,i);
    endfor
    disp("C")
    disp(C)
    C = RREF(C,0);
    disp("after RREF C")
    disp(C)
    result(:,cnt) = EigenVector(C);
    cnt=cnt+1;
  endfor
  
  V = Orthonormal(result);
  disp("EigenVector");
  disp(V);
  disp("Diagonal");
  disp(D);
endfunction
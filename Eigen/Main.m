function Main 
X1 = [4, 2;
      2, 4;
      2, 3;
      3, 6;
      4, 4];
%sample for class 2:
X2 = [9, 10;
      6, 8;
      9, 5;
      8, 7;
      10, 8];
u1 = Mean(X1, 2);
disp(u1)
u = [3.0000;
   3.8000];
disp(u)
u2 = Mean(X2, 2);

s1 = Covariance(X1,u1);
s2 = Covariance(X2,u2);

sw = Addition(s1,s2);

sb1 = Substaction(u1, u2);
sb2 = Transpose(sb1);
sb = Multiplication(sb1,sb2);
disp("sb")
disp(sb)

sb1 = [29.160   20.520
   20.520   14.440];
   disp("sb1")
   disp(sb1)
if (u1(2)==u(2))
    disp("Yes");
  else
    disp("No")
  endif



swi = Inverse(sw);

swisb = Multiplication(swi, sb);

A = [9.2213,6.4890;4.2339,2.9794];
B = Inverse(A);
disp("swisb");
disp(swisb);
C = [ 0.43154,  -0.70370
  -0.45914,   1.00000];
  disp("A");
disp(A);
swisb = A(1,1)

B(1,1)= C(1,1);

  
[V,D]=Eigen(A);
endfunction

function [u] = Mean(X, TOTCLASS)
  u = [0.0;0.0];
  [row,col] = size(X);

  for i=1:row
          
    for j=1:TOTCLASS
        u(j,1) = X(i,j)+u(j,1);
    end
  end

  u = 1/length(X)*(u);
endfunction


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

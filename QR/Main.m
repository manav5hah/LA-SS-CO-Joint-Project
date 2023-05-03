%A=[-1,-2,-2;1,2,1;-1,-1,0]
%A=[1,1,1,1,1;16,8,4,2,1;81,27,9,3,1;256,64,16,4,1;625,125,25,5,1]
A=[9.2213,6.489;4.2339,2.9794];
B = A;
for k=1 : 20
  disp(k)
  [Q,R] = QR(A);
  A = Multiplication(R,Q);
  disp("Q");
  disp(Q);
  disp("R");
  disp(R);
  disp("A");
  disp(A);
  disp(" ");
  disp(" ");
endfor
disp("A..");
disp(A);

[V,D] = eig(B);

disp("V..")
disp(V)

disp("D..")
disp(D)
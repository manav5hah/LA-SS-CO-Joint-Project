function [Q,R] = QR(A)

[row, col] = size(A);

X(:,1) = A(:,1);

for i=2 : col     % current column
  X(:,i) = A(:,i);
  for j=1 : i-1   % basis column
    tran = Transpose(X(:,j));  % transpose of basis column
    dot = Multiplication(tran, A(:,i));
    basis = Multiplication(tran, X(:,j));
    %disp("A(:,j)")
    %disp(X(:,j))
    div = dot/basis;
    %disp(tran);
    %disp(dot);
    %disp(basis);
    %disp(div);
    
    %disp("X(:,j)");
    %disp(X(:,j));
    %disp("X(:,i)")
    %disp(X(:,i));
    X(:,i) = Substaction(X(:,i) , Scalar((X(:,j)),div));
    %{
    disp("div");
    disp(div);
    disp("Scalar((X(:,j)),div)");
    disp(Scalar((X(:,j)),div));
    disp("X(:,j)");
    disp(X(:,j));
    disp("X(:,i)")
    disp(X(:,i));
    disp("X..");
    disp(X);
    %}
  endfor
  min = X(1,i);
  for k=2 : row
    if (X(k,i)<min && X(k,i)~=0)
      if(X(k,i)<0)
        min = -1 * X(k,i);
      else
        min = X(k,i);
      end
    end
  endfor
  if min==0 || min<0;
    min=1;
  end
  X(:,i) = Scalar(X(:,i),1/min);
  %disp(X(:,i));
  %disp(" ");
endfor
disp("X..")
disp(X);

Q = Orthonormal(X);
%disp("Q..");
%disp(Q);

R = Multiplication(Transpose(Q),A);
%disp("R..");
%disp(R);
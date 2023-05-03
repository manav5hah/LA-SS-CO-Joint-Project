function [u] = Mean(X, TOTCLASS)
u = [0.0;0.0];
[row,col] = size(X);

for i=1:row
        
  for j=1:TOTCLASS
      u(j,1) = X(i,j)+u(j,1);
  end
end

u = 1/length(X)*(u);

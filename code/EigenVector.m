%A = [1, -2.177955;
%     0,0]
function [result] = EigenVector(A)
Y=[0];
[row,col] = size(A);
%result=[0;0];
cnt=1;

cnt_1=1;
for i=1 : row
  if (A(i,:)==0)
    cnt_1=cnt_1+1;
  endif
endfor
for rowNo=1 : row
  for colNo=rowNo : col
    
    if (A(rowNo,colNo)==1 )
      for k=rowNo+1 : row
        
        if (A(rowNo,k)~=0 && cnt~=cnt_1)
          [X,Y] = Find(A, rowNo, k, Y);
          
          result(:,cnt) = X(:);
          cnt=cnt+1;
          
        endif
      endfor
    endif
  endfor
endfor
disp("result")
disp(result);
[row1,col1]=size(result);

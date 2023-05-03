function [A] = RREF(A,t)

[row,col] = size(A);
C = A;
if(t==1)
  for i=1: row
    for j=1 : col
      if (i==j)
        B(i,j) = 1;
      else
        B(i,j) = 0;
      endif
    endfor
  endfor
  A = [A,B];
else
  A = [A];
endif

[row1,col1] = size(A);

for colNo=1 : col
  for rowNo=colNo : row
    cnt=0;
    if (colNo == rowNo)
      %if (A(rowNo,colNo) == 1)
     
      if (A(rowNo,colNo)>-0.1 && A(rowNo,colNo)<0.1)
        A(row,col)=0;
        %endif
      elseif (A(rowNo,colNo) ~= 0)
        temp= A(rowNo,colNo);
        A(rowNo,:) =A(rowNo,:)/ temp;
       
      else
        for k=rowNo : row
          if(A(k,colNo) ~=0)
            temp = A(rowNo,:);
            A(rowNo,:) = A(k,:);
            A(k,:) = temp;
            cnt=cnt+1;
          endif  
          break;
        endfor
        if cnt>0
          rowNo=rowNo-1;
        endif
      endif    
    else
      if(A(rowNo,colNo)~=0)
        temp = A(rowNo,colNo);
        A(rowNo,:) = A(rowNo,:) - (temp* A(colNo,:));
        
      endif
    endif
 
  endfor
endfor

disp("INRREF")
disp(A);


for colNo=col:-1:2
  for rowNo = colNo-1:-1:1
    if (A(rowNo,colNo)~=0)
      
      colChange = colNo;
      if (A(rowNo,colNo)~=1)
        for j=colNo-1:-1:rowNo+1
          if (A(rowNo,j) ~=0)
            colChange = j;
            break;
          endif
        endfor
      endif
      temp = A(rowNo,colNo);
      A(rowNo,:) = A(rowNo,:) - (temp*A(colChange,:));
      
    endif
   
  endfor
endfor

%{
if (t == 1)
  max = C(1,1);
  for i=1 : row
    if (max<C(i,i))
      max = C(i,i);
      disp("Max")
      disp(max);
    endif
  endfor
  temp_2 = A(1,col+1);
  A = Scalar(A,max);
  disp(temp_2)
  A = Scalar(A,1/temp_2);
endif
%}
endfunction
A = [-2.9794,6.489;
    4.2339,-9.2213]
  
B  = [0;
      0];
      
[row,col] = size(A);
A = [A,B];
for colNo=1 : col
  for rowNo=colNo : row
    cnt=0;
    if (colNo == rowNo)
      %if (A(rowNo,colNo) == 1)
      if (A(rowNo,colNo)>-0.1 && A(rowNo,colNo)<0.1)
        A(row,col)=0;
        %endif
      elseif (A(rowNo,colNo) != 0)
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
  disp("A...")
  disp(A)

  endfor
endfor


for colNo=col:-1:2
  for rowNo = colNo-1:-1:1
    if (A(rowNo,colNo)~=0)
      disp("rowNo");
      disp(rowNo);
      disp("colNo");
      disp(colNo);
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
      disp("colChange");
      disp(colChange);
      disp("temp");
      disp(temp);
      disp("A(rowNo,:)");
      disp(A(rowNo,:));
    endif
  disp("A..")
  disp(A)  
  endfor
endfor


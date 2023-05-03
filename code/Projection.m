function Projection(w, X1,X2);

  [r,c] = size(w);
  [row1, col1] = size(X1);
  [row2, col2] = size(X2);
  %{
  squar=0;
  squarroot=0;
  for i=1:r
    squar = squar + (w(i)*w(i));
    disp(squar);
  end
  squarroot = sqrt(squar);

  disp(squar);
  disp(squarroot);
  for i=1:r
    w(i) = w(i)/squarroot;
  end
  %}

  %meanDiff = Substaction(u1,u2);
  %w1 = Multiplication(swi,temp);
  %w1=[0.9088;0.4173];
  disp("Most impoert eigenVector")
  disp(w)


  %disp("other")
  %disp(w1)
  %w2=[0.9088;0.4173]
  %wsmall = [-0.5755;0.8178]
  scatter(X1(:,1),X1(:,2),100,'filled')
  hold on
  scatter(X2(:,1),X2(:,2),100,'filled')
  hold on

  title("LDA projection vector with highest eigen value");
  xlabel("X-axis")
  ylabel("y-axis")
  %legend("X1","X2") ;
  %plot(w,'r')
  %hold on

  %plot(w,'b')

  %hold on
  %plot(w2,'g')
  %hold on
  %plot(wsmall,'y')

  
  k=1;
  for i=1:row1
    
    Xn(k)=0;
    for j=1:r
      Xn(k) =Xn(k)+ Multiplication(X1(i,j), w(j));
    endfor
    hold on
    %scatter(Xn(k),Xn(k),'g')
    k=k+1;
  endfor

  
  for i=1:row2
    Xn(k)=0;
    for j=1:r
      Xn(k) = Xn(k)+ Multiplication(X2(i,j), w(j));
    endfor
    %scatter(Xn(k),Xn(k),'k')
    k=k+1;
  endfor

  plot(Xn,Xn);
  scatter(Xn(1:row1),Xn(1:row1),100,'k');

  scatter(Xn(row1+1:row1+row2),Xn(row1+1:row1+row2),100,'r');
  legend("X1","X2","LDA","X1-projection","X2-projection")
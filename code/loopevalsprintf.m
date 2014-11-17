%Levene's Procedure.
n=[];s2=[];Z=[];
indice=Y(:,2);
for i=1:k
   Ye=find(indice==i);
   eval(sprintf('Y%d=Y(Ye,1);', i));
   eval(sprintf('mY%d=mean(Y(Ye,1));', i));
   eval(sprintf('n%d=length(Y%d);', i, i));
   eval(sprintf('s2%d=(std(Y%d).^2);', i, i));
   eval(sprintf('Z%d=abs((Y%d) - mY%d);', i, i, i));
   eval(sprintf('xn=n%d;', i));
   eval(sprintf('xs2=s2%d;', i));
   eval(sprintf('x=Z%d;', i));
   n=[n;xn];s2=[s2;xs2];Z=[Z;x];
end

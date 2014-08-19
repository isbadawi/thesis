%Levene's Procedure.
n=[];s2=[];Z=[];
indice=Y(:,2);
for i=1:k
   Ye=find(indice==i);
   eval(['Y' num2str(i) '=Y(Ye,1);']);
   eval(['mY' num2str(i) '=mean(Y(Ye,1));']);
   eval(['n' num2str(i) '=length(Y' num2str(i) ') ;']);
   eval(['s2' num2str(i) '=(std(Y' num2str(i) ').^2) ;']);
   eval(['Z' num2str(i) '= abs((Y' num2str(i) ') - mY' num2str(i) ');']);
   eval(['xn= n' num2str(i) ';']);
   eval(['xs2= s2' num2str(i) ';']);
   eval(['x= Z' num2str(i) ';']);
   n=[n;xn];s2=[s2;xs2];Z=[Z;x];
end

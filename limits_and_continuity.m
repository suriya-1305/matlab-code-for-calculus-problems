clc
clear all
syms x y m n
f=input('Enter the function f(x,y):');
lp=input('\nEnter limit point:');
x0=lp(1);
y0=lp(2);
L1=limit(limit(f,x,x0),y,y0);
L1=double(L1);
L2=limit(limit(f,y,y0),x,x0);
L2=double(L2);
disp(['L1=',num2str(L1),' L2=',num2str(L2)])
L=input('\nEnter the value of f at (x0,y0):');
L=double(L);
if((L1==NaN)||(L2==NaN)||(L1~=L2))
 disp(['Limit does not exist.'])
 return
elseif(L1==L2)
 if(L1~=L)
 disp(['Limit exists but may fail to be continuous.'])
 return
 else
 eps=2;
 D=[x0-eps,x0+eps,y0-eps,y0+eps];
 xv=linspace(D(1),D(2),20);
 npaths=input('\nInput the number of paths:');
 ac=['k','g','r','b','y'];
 ezsurf(f,D)
 colormap('cool')
 shading('flat')
 hold on
 plot3(x0,y0,L1,'bo')
 yp=y0+m*(x-x0).^n;
 f=subs(f,y,yp);
 for i=1:npaths,
 val=input('\nInput values of m and n:');
m=val(1);
 n=val(2);
 y=subs(yp);
 fprintf('\nThe path considered is y=%s');
 disp(y);
 fp=subs(f);
 yv=subs(y,'x',xv);
 fv=subs(fp,'x',xv).*ones(size(xv));
 plot3(xv,yv,fv,ac(i));
 L3=limit(fp,x,x0);
 L3=double(L3);
 disp(['Limit along this path is',num2str(L3)])
 disp(['Function may be continuous at the limit point.'])
 if((L3==NaN)||(L3~=L1))
 disp(['Limit does not exist. Function fails to be continuous at the limit point.'])
 return
 end
 end
 end
end
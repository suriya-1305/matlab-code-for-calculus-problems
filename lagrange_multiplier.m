clc
clear all
syms x y lam real
f=input('Enter f(x,y) to b eextremised:');
g=input('Enter the constraint function g(x,y):')
F=f-lam*g;
Fd=jacobian(F,[x y lam])
[ax,ay,az]=solve(Fd,[x y lam])
ax=double(ax)
ay=double(ay)
T=subs(f,{x,y},{ax,ay})
T=double(T)
epx=3;
epy=3;
for i=1:length(T),
 figure
 D=[ax(i)-epx,ax(i)+epx,ay(i)-epy,ay(i)+epy]
 fprintf('The critical point (x,y) is
(%10.3f,%10.3f).',ax(i),ay(i))
 fprintf('The value of the function is %10.3f\n',T(i))
 ezcontour(f,D)
 hold on
 h=ezplot(g,D)
 set(h,'color',[1,0.7,0.9])
 plot(ax(i),ay(i),'k.','markersize',25)
end

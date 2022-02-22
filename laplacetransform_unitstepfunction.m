clear all
clc
syms x
g1=x*(heaviside(x-0)-heaviside(x-1))
g2=(2-x)*(heaviside(x-1)-heaviside(x-2))
f=g1+g2
F=laplace(f)
xv=linspace(0,2,100);
g1v=subs(g1,x,xv);
g2v=subs(g2,x,xv);
fv=subs(f,x,xv);
subplot(3,1,1)
plot(xv,g1v,'g*')
subplot(3,1,2)
plot(xv,g2v,'r+')
subplot(3,1,3)
plot(xv,fv,'r^')
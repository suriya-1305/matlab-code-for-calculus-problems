clc
clear all
syms t s
T=input('enter the period')
n=input('enter the number of partitions')
fun=0*t;
for i=1:n
 a(i)=input('enter the leftend point')

 b(i)=input('enter the right end
point')

 f(i)=input('enter the function f(i)')
 fun=fun+f(i)*(heaviside(t-a(i))-
heaviside(t-b(i)))
end
ezplot(fun,[a(i) b(n)])
sum=0;
for i=1:n
 sum=sum+int(f(i)*exp(-
s*t),t,a(i),b(i))
end
g=(1/1-exp(-s*T))*sum
g1=simplify(g)
figure
ezplot(g1,[0 b(n)])
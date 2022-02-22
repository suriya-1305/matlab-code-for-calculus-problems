clear
clc
syms x y real
f=x^2+x*y+y^2-6*x+2;
fx = diff(f,x); fy = diff(f,y);
[cx, cy] = solve(fx,fy); cx=double(cx); cy=double(cy);
fxx = diff(fx,x); fxy=diff(fx,y); fyy=diff(fy,y);
D = fxx*fyy - fxy^2;
for i=1:size(cx)
 figure
 T1=subs(subs(D,x,cx(i)),y,cy(i)); T1 = double(T1);
 T2=subs(subs(fxx,x,cx(i)),y,cy(i)); T2 = double(T2);
 T3=subs(subs(f,x,cx(i)),y,cy(i)); T3=double(T3);
 if (T1 == 0)
 fprintf('The critical point (%d,%d) need further
investigation.\n', cx(i),cy(i))
 elseif (T1 < 0)
 fprintf('The critical point (%d,%d) is a saddle point.',
cx(i),cy(i))
 fprintf('The value of the function is %d\n', T3)
 else
 if (T2 < 0)
 fprintf('The maximum point is (%d,%d) ',
cx(i),cy(i))
 fprintf('The maximum value of the function is %d\n',
T3)
 else
 fprintf('The minimum point is (%d,%d) ',
cx(i),cy(i))
 fprintf('The minimum value of the function is %d\n',
T3)
 end
 end
 R=[cx(i)-0.1, cx(i)+0.1, cy(i)-0.1, cy(i)+0.1];
ezsurf(f,R); colormap('cool'); shading('flat');
 hold on
 plot3(cx(i),cy(i),T3,'r+','markersize',10)
end

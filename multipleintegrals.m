clc
clear all
syms x y z
viewSolid(z,0+0*x+0*y,x3*y^2+0*y,y,1+0*x,2+0*y,x,0,2)
int(int(x-3*y^2+0*y,y,1,2),x,0,2)


##qstn 2
clc
clear all
syms x y z
viewSolid(z,0+0*x+0*y,y*sin(x*y),x,1+0*y,2+0*y,y
,0,pi)
int(int(y*sin(x*y)+0*y,x,1,2),x,0,pi)

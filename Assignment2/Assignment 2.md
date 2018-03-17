# Assignment 2  

标签（空格分隔）： 未分类

## 1
（a）the solution of x=g(x)=$\frac{1}{2}$(x+$\frac{a}{x}$) is x*=$\sqrt{a}$
     the first derivative:g'(x*)=$\frac{1}{2}$-$\frac{a}{2{x*}^2}$=0
     the second derivative:g''(x*)=$\frac{a}{{x*}^3}$=$\frac{1}{\sqrt{a}}$
     so the limit is
 $$\lim_{n \to +\infty} \frac{x_{n+1}-x^*}{(x_n-{x^*})^2}$$=$\frac{g''(x^*)}{2!}$≠0
 So the convergence is quadratic, and for any $x_1$>0, the iteration converges to $\sqrt{a}$ 
 (b)
 Code:Fixedpoint.m
 ``
 %% to write a function of fixed point and output the convergence result and graph.
%Author:Lyon(515072910019)
function Fixedpoint(x_initial,g)%函数形参：x_initial:初始点 g：函数表达式
N=100;eps=1e-8;%循环次数和结果精度
x_former=x_initial;
x=linspace(2,2.6,101);
% the interval of picture change with the function g when we use this code.
y=g(x);
plot(x,y,x,x);% 首先画出两个主图：x和g(x)
hold on
for i=1:N
    x_latter=g(x_former);
    fprintf("N:%d \t xf:%.8f \t xl:%.8f \n",i,x_former,x_latter);
    plot([x_former,x_former],[x_former,x_latter]);
    hold on
    plot([x_former,x_latter],[x_latter,x_latter]);%画fixedpoint过程线
    hold on
    if abs(x_latter-x_former)<eps
        fprintf("the final result is %.8f \n",x_latter);
        break
    end
    x_former=x_latter;
end
end
``
Call this function, and the command window and picture is as followings:
![此处输入图片的描述][1]
![此处输入图片的描述][2]
(c)
 we use g(x)=$x^2-5$ to evaluate $\sqrt{5}$ by using Newton-Rafson method.
 code:New_Raf.m
 ``
 clear all;close all;clc;
N=100;eps=1e-8;%循环次数和结果精度
x1=2.2;%接近2.5
g=@(x) x.^2-5;
g_prime=@(x) 2.*x;
for i=1:N
    x2=x1-g(x1)./g_prime(x1);
    fprintf("N:%d \t x1:%.8f \t x2:%.8f \n",i,x1,x2);
    if abs(x2-x1)<eps
        fprintf("the final result is %.8f \n",x2);
        break
    end
    x1=x2;
end
``
After running the code, we get the result:
![此处输入图片的描述][3]

##3.
From the lecture, we know that the bond length req is the equilibrium distance when $V(r)$ is at its minimum. So we should find the root of $V'(r)=0$
$V(r)=-\frac{e^2}{r}+V_0 e^{-\frac{r}{r_0}}$
$V'(r)=\frac{e^2}{r^2}-\frac{V_0}{r_0}e^{-\frac{r}{r_0}}$
so using the Newton-Rafson method:
code: pro3.m
``
clear all;close all;clc;
x1=2.5;e_square=14.4;v0=1090;r0=0.330;
g=@(x) e_square./(x.^2) - (v0/r0)*exp(-x./r0);
g_prime=@(x) -2*e_square./(x.^3)+(v0/(r0^2))*exp(-x./r0);
N=100;eps=1e-8
for i=1:N
    x2=x1-g(x1)./g_prime(x1);
    fprintf("N:%d \t x1:%.8f \t x2:%.8f \n",i,x1,x2);
    if abs(x2-x1)<eps
        fprintf("the result of Newton-Rafson is %.8f \n",x2);
        break
    end
    x1=x2;
end

v=@(x) -e_square/x + v0*exp(-x/r0);
req=fminsearch(v,x1);
fprintf("the result of matlab built-in fminsearch is %.8f \n",req)
``
the result is:
![此处输入图片的描述][4]
we find that the result is equal.


  [1]: https://github.com/lyon182/computationalphysics_sjtu515072910019/raw/master/Assignment2/Picture/1.png
  [2]: https://github.com/lyon182/computationalphysics_sjtu515072910019/raw/master/Assignment2/Picture/2.png
  [3]: https://github.com/lyon182/computationalphysics_sjtu515072910019/raw/master/Assignment2/Picture/3.png
  [4]: https://github.com/lyon182/computationalphysics_sjtu515072910019/raw/master/Assignment2/Picture/4.png
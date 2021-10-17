function [ alpha ] = TVD_SGD( sigma,q,T )
%input  sigma of Gaussian mechanism, sampling rate q and number of steps T
%function compute the parameter of TVD privacy  alpha
syms x
fun=log(exp(-x^2/(2*sigma^2))/((1-q)*exp(-x^2/(2*sigma^2))+q*exp(-(x-1)^2/(2*sigma^2))))*1/(sqrt(2*pi)*sigma)*exp(-x^2/(2*sigma^2));
z=int(fun,x,-inf,inf);

fun2=log(((1-q)*exp(-x^2/(2*sigma^2))+q*exp(-(x-1)^2/(2*sigma^2)))/exp(-x^2/(2*sigma^2)))*1/(sqrt(2*pi)*sigma)*((1-q)*exp(-x^2/(2*sigma^2))+q*exp(-(x-1)^2/(2*sigma^2)));
z2=int(fun2,x,-inf,inf);
alpha=sqrt(max(double(z), double (z2))*T/2);

end


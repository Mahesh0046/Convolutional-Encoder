clc;
clear all;
close all;
% Taking dimen
n=input('value of n(no. of outputs) -');
k=input('value of k(no. of inputs) -');
m=input('value of m(no. of shift registers) -');
n1=input('message length-');
u=zeros(1,(n1*k));
for i=0:1:(k-1)
    temp = ['Enter the message signal u(',num2str(i),')-'];
    disp(temp);
    u(1,((i*n1)+1):((i+1)*n1))=input('');
end
u=reshape(u,[n1,k]);
u=u';
disp('Message to be encoded -');
disp(u);
g=zeros(1,(n*(m+1)*k)); 
for j=0:1:(k-1)
    for i=0:1:(n-1)
        temp=['Enter the generator signal g(',num2str(i+1),') ',num2str(j+1),'-'];
        disp(temp);
        g(1,((j*(n*(m+1)))+(i*(m+1))+1):((j*(n*(m+1)))+((i+1)*(m+1))))=input(''); 
    end
end
g=reshape(g,[(n*(m+1)),k]);
g=g';
disp(g);

v1=zeros(1,(n*(m+n1)*k));
v1=reshape(v1,[(n*k),(n1+m)]);

i=1;
for j=1:1:k
    for  i1=0:1:(n-1)
        [v1(i,:)] = convolution(g(j,(i1*(m+1))+1:(i1+1)*(m+1)),u(j,:));
        i=i+1;
    end
end
v1=mod(v1,2);
v = zeros(1,(n*(m+n1)));
v = reshape(v,[n,(m+n1)]);

for x=1:1:n
    for y=0:1:(k-1)
        a=v(x,:);
        b=v1(((n*y)+x),:);
        v(x,:) = xor(a,b);
    end
end
disp('CODE WORD -');
disp(v);

function [Y] = convolution(x,h)

m9=length(x);
n9=length(h);
X=[x,zeros(1,n9)];
H=[h,zeros(1,m9)];
Y=zeros(1,(m9+n9-1));
for i9=1:m9+n9-1
  for j9=1:m9
    if(i9-j9+1>0)
    Y(i9)=Y(i9)+X(j9)*H(i9-j9+1);
    end
  end
end  
end
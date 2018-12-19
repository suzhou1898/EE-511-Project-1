[mu,sig1]=unifstat(0,1)               %evaluate the mean and variance of uniform random variables
                                   
currentdata1=rand(10);              %compute the sample mean and sample variance of 100 random numbers on the interval of (0,1)
currentmean1=mean(currentdata1(:))
currentvar1=var(currentdata1(:))
currentdata2=rand(100);             %repeat for 10000 random numbers
currentmean2=mean(currentdata2(:))  
currentvar2=var(currentdata2(:))
Nrepeat1=100000;
for k=1:Nrepeat1                    %generate 100000 sample means
    currentdata3=rand(100);
    currentmean3(1,k)=mean(currentdata3(:));
end
currentvar3=var(currentmean3(:))      %estimate the (sample) variance of these sample means
 
Nrepeat2=50;
for k=1:Nrepeat2                    %generate 100 random numbers between (0,1) and repeat this process for 50 times
    currentdata4=rand(10);
    currentmean4(1,k)=mean(currentdata4(:));    %compute the sample mean of 100 random numbers from each of 50 trials
end
figure(1);                           %estimate roughly whether these 50 sample means apply for normal distribution with built-in function normplot( )
normplot(currentmean4(:));
x1=0.40:0.0001:0.60;               
sig2=(sig1/100)^(0.5);
y1=normpdf(x1,mu,sig2);             
figure(2);                           %draw the graph of normal distribution with parameters mean mu=0.5 and variance sig2=0.0289
plot(x1,y1,'r');
hold on;
x2=currentmean4;
y2=zeros(1,50);                     
plot(x2,y2,'k*');                     %plot the 50 sample means on the X-axis
y3=0:14;
y4=0:14;
x3=(mu+2*sig2)*ones(1,15);
x4=(mu-2*sig2)*ones(1,15);
plot(x3,y3,'b',x4,y4,'b');              %draw two reference lines x3=mu+2*sig2 and x4=mu-2*sig2 which are the upper and lower bound of confidence interval of 95%
grid on;
 
currentdata5=unifrnd(0,1,1,1001);   
S=mean(currentdata5(1,1:1000));
T=mean(currentdata5(1,2:1001));
for j=1:1000
    c(1,j)=currentdata5(1,j)*currentdata5(1,j+1);
end
Q=mean(c(:));
Z=Q-S*T                          %compute the value of Z                       
 





    
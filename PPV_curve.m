function PPV_curve(sample_rate,epsilon,delta,alpha )
%This code is used to measure the membership advantage curve of the randomized mechanism.
%Input sampling rate differential privacy parameters and TVD privacy parameters of the randomized mechanism.
%The function will plot the privacy images corresponding to the two privacy definitions.
Fp=[0:0.01:1];
for i=1:101%%%%%DP保证
f(1,i)=max(0,max(1-delta-exp(epsilon)*Fp(1,i),exp(-epsilon)*(1-delta-Fp(1,i))));%f_(epsilon,delta)
end
for i=1:101%%%%%DP保证
PPV_dp(1,i)=(1-f(1,i))/(1-f(1,i)+sample_rate*Fp(1,i));
end
for i=1:101%%%%%TVD保证
PPV_tvd(1,i)=min(1, (Fp(1:i)+alpha)/(Fp(1:i)+alpha+sample_rate*Fp(1:i)));
end
plot(Fp,PPV_dp,'LineWidth',1)
hold on
plot(Fp,PPV_tvd,'LineWidth',1)
legend('DP','TVD');
xlabel('false positive rate')
ylabel('Positive Predictive Value')
end


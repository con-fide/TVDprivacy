function membership_advantage_curve(epsilon,delta,alpha)
%This code is used to measure the membership advantage curve of the randomized mechanism.
%Input differential privacy parameters and TVD privacy parameters of the randomized mechanism.
%The function will plot the privacy images corresponding to the two privacy definitions.
Fp=[0:0.01:1];
for i=1:101
f(1,i)=max(0,max(1-delta-exp(epsilon)*Fp(1,i),exp(-epsilon)*(1-delta-Fp(1,i))));%f_(epsilon,delta)
end
for i=1:101
adv_dp(1,i)=1-Fp(1,i)-f(1,i);
end
for i=1:101
adv_tvd(1,i)=min(1-Fp(1,i),alpha);
end
plot(Fp,adv_dp,'LineWidth',1)
hold on
plot(Fp,adv_tvd,'LineWidth',1)
legend('DP','TVD');
xlabel('false positive rate')
ylabel('membership advantage')
end


function [ output_args ] = ROC_curve(epsilon,delta,alpha)
%%This code is used to measure the ROC curve of the randomized mechanism.
%%Input differential privacy parameters and TVD privacy parameters of the randomized mechanism.
%%The function will plot the privacy images corresponding to the two privacy definitions.
FA_DP=[0:0.01:1];
TA_DP=FA_DP*exp(epsilon)+delta;
TA_DP2=1+(FA_DP-1+delta)/exp(epsilon);
for i=1:101
    TA_DP(1,i)=min(TA_DP(1,i),TA_DP2(1,i));
end
TA_tvd=[0:0.01:1];
FA_tvd=TA_tvd-alpha;
for i=1:101
    if FA_tvd(1,i)<0
        FA_tvd(1,i)=0;
    end
end
plt=plot(FA_DP,TA_DP,'LineWidth',1);
hold on
plot(FA_tvd,TA_tvd,'--','LineWidth',1)
legend('DP','TVD');
axis([0 1 0 1])
end


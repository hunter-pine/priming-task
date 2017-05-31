%% Load data
data = xlsread('Participant_Feet_Data.xlsx'); 

%% Sort data into arrays
prime_side=data(:,1);
prime_type=data(:,2);
target_side=data(:,3);
congruency=data(:,4);
rt=data(:,5);
accuracy=data(:,6);

%% Length of the Array
length_arr=length(prime_side);

%% SETTING A GOOD SD INDEX - CHOOSING VALUES BELOW 2 SDs + mean.
mean_rt = mean(rt);
std_rt = std(rt);
goodSDindex = rt < mean_rt + 2 * std_rt;


%% HAND CONDITIONS
% FIRST CONDITION - HAND-PALM-COMPATIBLE
% if(prime_type(i)==1 && congruency(i)==1 && accuracy == 1)

hand_palm_comp=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==1 && accuracy(i) == 1 && goodSDindex(i) == 1)
        hand_palm_comp=[hand_palm_comp, rt(i)] ;
    end
end
avg_hand_palm_compatible=mean(hand_palm_comp);
std__hand_palm_compatible=std(hand_palm_comp);

% % SECOND CONDITION - HAND-PALM-INCOMPATIBLE
% if(prime_type(i)==1 && congruency(i)==0 && accuracy == 1)

hand_palm_incomp=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==0 && accuracy(i) == 1 && goodSDindex(i) == 1)
        hand_palm_incomp=[hand_palm_incomp, rt(i)] ;
    end
end
avg_hand_palm_incompatible=mean(hand_palm_incomp);
std_hand_palm_incompatible=std(hand_palm_incomp);


% % THIRD CONDITION - BACK-COMPATIBLE
% if(prime_type(i)==0 && congruency(i)==1 && accuracy == 1)

hand_back_comp=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==1 && accuracy(i) == 1 && goodSDindex(i) == 1)
        hand_back_comp=[hand_back_comp, rt(i)] ;
    end
end
avg_hand_back_compatible=mean(hand_back_comp);
std_hand_back_compatible=std(hand_back_comp);

% %FOURTH CONDITION - BACK-INCOMPATIBLE
% if(prime_type(i)==0 && congruency(i)==0 && accuracy= = 1)
hand_back_incomp=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==0 && accuracy(i) == 1 && goodSDindex(i) == 1)
        hand_back_incomp=[hand_back_incomp, rt(i)] ;
    end
end
avg_hand_back_incompatible=mean(hand_back_incomp);
std_hand_back_incompatible=std(hand_back_incomp);

%% FEET CONDITIONS
% FIRST CONDITION - FEET-PALM-COMPATIBLE
% if(prime_type(i)==3 && congruency(i)==1 && accuracy == 1)

feet_palm_comp=[];
for i=1:length_arr
    if(prime_type(i)==3 && congruency(i)==1 && accuracy(i) == 1 && goodSDindex(i) == 1)
        feet_palm_comp=[feet_palm_comp, rt(i)] ;
    end
end
avg_feet_palm_compatible=mean(feet_palm_comp);
std_feet_palm_compatible=std(feet_palm_comp);


% % SECOND CONDITION - FEET-PALM-INCOMPATIBLE
% if(prime_type(i)==3 && congruency(i)==0 && accuracy == 1)

feet_palm_incomp=[];
for i=1:length_arr
    if(prime_type(i)==3 && congruency(i)==0 && accuracy(i) == 1 && goodSDindex(i) == 1)
        feet_palm_incomp=[feet_palm_incomp, rt(i)] ;
    end
end
avg_feet_palm_incompatible=mean(feet_palm_incomp);
std_feet_palm_incompatible=std(feet_palm_incomp);


% % THIRD CONDITION - FEET-BACK-COMPATIBLE
% if(prime_type(i)==2 && congruency(i)==1 && accuracy == 1)

feet_back_comp=[];
for i=1:length_arr
    if(prime_type(i)==2 && congruency(i)==1 && accuracy(i) == 1 && goodSDindex(i) == 1)
        feet_back_comp=[feet_back_comp, rt(i)] ;
    end
end
avg_feet_back_compatible=mean(feet_back_comp);
std_feet_back_compatible=std(feet_back_comp);

% %FOURTH CONDITION - FEET-BACK-INCOMPATIBLE
% if(prime_type(i)==2 && congruency(i)==0 && accuracy= = 1)
feet_back_incomp=[];
for i=1:length_arr
    if(prime_type(i)==2 && congruency(i)==0 && accuracy(i) == 1 && goodSDindex(i) == 1)
        feet_back_incomp=[feet_back_incomp, rt(i)] ;
    end
end
avg_feet_back_incompatible=mean(feet_back_incomp);
std_feet_back_incompatible=std(feet_back_incomp);


% end

%% Plotting
% figure
% subplot(4,2,1)
% xlabel('Congruency')
% ylabel('Reaction Time (ms)')
% title('Congruency in Hand Primes')
% boxplot(palm_comp)

disp=[avg_hand_palm_compatible avg_hand_palm_incompatible;avg_hand_back_compatible avg_hand_back_incompatible; avg_feet_palm_compatible avg_feet_palm_incompatible;avg_feet_back_compatible avg_feet_back_incompatible];
Name= ['Palm' ;'Back'];
bar(disp)
ylim([300 500])
legend('Comp','Incomp');
set(gca,'xticklabel',Name)
ylabel('Reaction Time (ms)')


%% EXPORTING TO EXCEL
conditional_data = [hand_palm_comp,hand_palm_incomp,hand_back_comp,hand_back_incomp,feet_palm_comp,feet_palm_incomp,feet_back_comp,feet_back_incomp];
values=[avg_hand_palm_compatible,avg_hand_palm_incompatible,avg_hand_back_compatible,avg_hand_back_incompatible,avg_feet_palm_compatible,avg_feet_palm_incompatible,avg_feet_back_compatible,avg_feet_back_incompatible];
hand_palm_comp_cells=num2cell(hand_back_incomp, [1,300]);

col_header={'Hand Palm Compatible', 'Hand Palm Incompatible', 'Hand Back Compatible', 'Hand Back Incompatible', 'Feet Palm Compatible', 'Feet Palm Incompatible', 'Feet Back Compatible', 'Feet Back Incompatible'};


xlswrite('meanRTfile',values);


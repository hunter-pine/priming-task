%% Load data
data = xlsread('priming.xlsx'); 

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

%% HAND CONDITIONS
% FIRST CONDITION - HAND-PALM-COMPATIBLE
% if(prime_type(i)==1 && congruency(i)==1 && accuracy == 1)
% Reaction Time
hand_palm_comp_unfiltered=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==1 && accuracy(i) == 1)
        hand_palm_comp_unfiltered=[hand_palm_comp_unfiltered, rt(i)] ;
    end
end

avg_hand_palm_compatible_unfiltered=mean(hand_palm_comp_unfiltered);
std_hand_palm_compatible_unfiltered=std(hand_palm_comp_unfiltered);

aboveSDindex_HPC = rt < avg_hand_palm_compatible_unfiltered + 2 * std_hand_palm_compatible_unfiltered;
belowSDindex_HPC = rt > avg_hand_palm_compatible_unfiltered - 2 * std_hand_palm_compatible_unfiltered;

% % NOW THE DATA IS FILTERED FOR THE VALUES OUTSIDE 2 SDs
% % REACTION-TIME

hand_palm_comp=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==1 && accuracy(i) == 1 && aboveSDindex_HPC(i) == 1 && belowSDindex_HPC(i) == 1)
        hand_palm_comp=[hand_palm_comp, rt(i)] ;
    end
end
avg_hand_palm_compatible=mean(hand_palm_comp);
std_hand_palm_compatible=std(hand_palm_comp);

% PERCENT-ERROR

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==1 && accuracy(i) == 0 && aboveSDindex_HPC(i) == 1 && belowSDindex_HPC(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==1 && congruency(i)==1)
        count=count+1;
    end
end
err_hand_palm_comp=100*err_count/count;

% % SECOND CONDITION - HAND-PALM-INCOMPATIBLE
% if(prime_type(i)==1 && congruency(i)==0 && accuracy == 1)

hand_palm_incomp_unfiltered=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==0 && accuracy(i) == 1)
        hand_palm_incomp_unfiltered=[hand_palm_incomp_unfiltered, rt(i)] ;
    end
end

avg_hand_palm_incompatible_unfiltered=mean(hand_palm_incomp_unfiltered);
std_hand_palm_incompatible_unfiltered=std(hand_palm_incomp_unfiltered);

aboveSDindex_HPI = rt < avg_hand_palm_incompatible_unfiltered + 2 * std_hand_palm_incompatible_unfiltered;
belowSDindex_HPI = rt > avg_hand_palm_incompatible_unfiltered - 2 * std_hand_palm_incompatible_unfiltered;


% % NOW THE DATA IS FILTERED FOR THE VALUES OUTSIDE 2 SDs
% % REACTION-TIME

hand_palm_incomp=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==0 && accuracy(i) == 1 && aboveSDindex_HPI(i) == 1 && belowSDindex_HPI(i) == 1)
        hand_palm_incomp=[hand_palm_incomp, rt(i)] ;
    end
end
avg_hand_palm_incompatible=mean(hand_palm_incomp);
std_hand_palm_incompatible=std(hand_palm_incomp);

% PERCENT-ERROR

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==0 && accuracy(i) == 0 && aboveSDindex_HPI(i) == 1 && belowSDindex_HPI(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==1 && congruency(i)==0)
        count=count+1;
    end
end
err_hand_palm_incomp=100*err_count/count;


% % THIRD CONDITION - BACK-COMPATIBLE
% if(prime_type(i)==0 && congruency(i)==1 && accuracy == 1)

hand_back_comp_unfiltered=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==1 && accuracy(i) == 1)
        hand_back_comp_unfiltered=[hand_back_comp_unfiltered, rt(i)] ;
    end
end

avg_hand_back_compatible_unfiltered=mean(hand_back_comp_unfiltered);
std_hand_back_compatible_unfiltered=std(hand_back_comp_unfiltered);

aboveSDindex_HBC = rt < avg_hand_back_compatible_unfiltered + 2 * std_hand_back_compatible_unfiltered;
belowSDindex_HBC = rt > avg_hand_back_compatible_unfiltered - 2 * std_hand_back_compatible_unfiltered;


% % NOW THE DATA IS FILTERED FOR THE VALUES OUTSIDE 2 SDs
% % REACTION-TIME

hand_back_comp=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==1 && accuracy(i) == 1 && aboveSDindex_HBC(i) == 1 && belowSDindex_HBC(i) == 1)
        hand_back_comp=[hand_back_comp, rt(i)] ;
    end
end
avg_hand_back_compatible=mean(hand_back_comp);
std_hand_back_compatible=std(hand_back_comp);

% PERCENT-ERROR

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==1 && accuracy(i) == 0 && aboveSDindex_HPC(i) == 1 && belowSDindex_HPC(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==0 && congruency(i)==1)
        count=count+1;
    end
end
err_hand_back_comp=100*err_count/count;

% %FOURTH CONDITION - BACK-INCOMPATIBLE
% if(prime_type(i)==0 && congruency(i)==0 && accuracy= = 1)

hand_back_incomp_unfiltered=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==0 && accuracy(i) == 1)
        hand_back_incomp_unfiltered=[hand_back_incomp_unfiltered, rt(i)] ;
    end
end

avg_hand_back_incompatible_unfiltered=mean(hand_back_incomp_unfiltered);
std_hand_back_incompatible_unfiltered=std(hand_back_incomp_unfiltered);

aboveSDindex_HBI = rt < avg_hand_back_incompatible_unfiltered + 2 * std_hand_back_incompatible_unfiltered;
belowSDindex_HBI = rt > avg_hand_back_incompatible_unfiltered - 2 * std_hand_back_incompatible_unfiltered;


% % NOW THE DATA IS FILTERED FOR THE VALUES OUTSIDE 2 SDs
% % REACTION-TIME

hand_back_incomp=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==0 && accuracy(i) == 1 && aboveSDindex_HBI(i) == 1 && belowSDindex_HBI(i) == 1)
        hand_back_incomp=[hand_back_incomp, rt(i)] ;
    end
end
avg_hand_back_incompatible=mean(hand_back_incomp);
std_hand_back_incompatible=std(hand_back_incomp);

% PERCENT-ERROR

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==0 && accuracy(i) == 0 && aboveSDindex_HBI(i) == 1 && belowSDindex_HBI(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==0 && congruency(i)==0)
        count=count+1;
    end
end
err_hand_back_incomp=100*err_count/count;


%% Plotting
% figure
% subplot(4,2,1)
% xlabel('Congruency')
% ylabel('Reaction Time (ms)')
% title('Congruency in Hand Primes')
% boxplot(palm_comp)

disp=[avg_hand_palm_compatible avg_hand_palm_incompatible;avg_hand_back_compatible avg_hand_back_incompatible];
Name= ['Palm' ;'Back'];
bar(disp)
ylim([300 500])
legend('Comp','Incomp');
set(gca,'xticklabel',Name)
ylabel('Reaction Time (ms)')


%% EXPORTING TO EXCEL
conditional_data = [hand_palm_comp,hand_palm_incomp,hand_back_comp,hand_back_incomp];
values=[avg_hand_palm_compatible,avg_hand_palm_incompatible,avg_hand_back_compatible,avg_hand_back_incompatible,err_hand_palm_comp,err_hand_palm_incomp,err_hand_back_comp,err_hand_back_incomp];
hand_palm_comp_cells=num2cell(hand_back_incomp, [1,300]);
col_header={'Hand Palm Compatible', 'Hand Palm Incompatible', 'Hand Back Compatible', 'Hand Back Incompatible'};

xlswrite('primingfile',values);

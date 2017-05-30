%% Load data
data = xlsread('workk.xlsx'); 

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


%% CONDITIONS
% FIRST CONDITION - PALM-COMPATIBLE
% if(prime_type(i)==1 && congruency(i)==1 && accuracy == 1)

palm_comp=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==1 && accuracy(i) == 1 && goodSDindex(i) == 1)
        palm_comp=[palm_comp, rt(i)] ;
    end
end
avg_palm_compatible=mean(palm_comp);
std_palm_compatible=std(palm_comp);


% % SECOND CONDITION - PALM-INCOMPATIBLE
% if(prime_type(i)==1 && congruency(i)==0 && accuracy == 1)

palm_incomp=[];
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==0 && accuracy(i) == 1 && goodSDindex(i) == 1)
        palm_incomp=[palm_incomp, rt(i)] ;
    end
end
avg_palm_incompatible=mean(palm_incomp);
std_palm_incompatible=std(palm_incomp);


% % THIRD CONDITION - BACK-COMPATIBLE
% if(prime_type(i)==0 && congruency(i)==1 && accuracy == 1)

back_comp=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==1 && accuracy(i) == 1 && goodSDindex(i) == 1)
        back_comp=[back_comp, rt(i)] ;
    end
end
avg_back_compatible=mean(back_comp);
std_back_compatible=std(back_comp);

% %FOURTH CONDITION - BACK-INCOMPATIBLE
% if(prime_type(i)==0 && congruency(i)==0 && accuracy= = 1)
back_incomp=[];
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==0 && accuracy(i) == 1 && goodSDindex(i) == 1)
        back_incomp=[back_incomp, rt(i)] ;
    end
end
avg_back_incompatible=mean(back_incomp);
std_back_incompatible=std(back_incomp);

% end

%% Plotting
% figure
% subplot(4,2,1)
% xlabel('Congruency')
% ylabel('Reaction Time (ms)')
% title('Congruency in Hand Primes')
% boxplot(palm_comp)

disp=[avg_palm_compatible avg_palm_incompatible;avg_back_compatible avg_back_incompatible];
Name= ['Palm' ;'Back'];
bar(disp)
ylim([300 450])
legend('Comp','Incomp');
set(gca,'xticklabel',Name)
ylabel('Reaction Time (ms)')


%% EXPORTING TO EXCEL
conditional_data = [palm_comp,palm_incomp,back_comp,back_incomp];
values=[avg_palm_compatible,avg_palm_incompatible,avg_back_compatible,avg_back_incompatible];
palm_comp_cells=num2cell(back_incomp, [1,300]);

col_header={'Palm Compatible', 'Palm Incompatible', 'Back Compatible', 'Back Incompatible'};


xlswrite('meanRTfile',values);


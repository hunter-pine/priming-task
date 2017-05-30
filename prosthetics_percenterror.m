%% Load data
data = xlsread('workk.xlsx'); 


%% Sort data into arrays
prime_side=data(:,1);
prime_type=data(:,2);
target_side=data(:,3);
congruency=data(:,4);
rt=data(:,5);
accuracy=data(:,6);

%% SETTING A GOOD SD INDEX - CHOOSING VALUES ABOVE 2 SDs FROM THE MEAN
mean_rt = mean(rt);
std_rt = std(rt);
goodSDindex = rt < mean_rt + 2 * std_rt;


%% CONDITIONS
% FIRST CONDITION - PALM-COMPATIBLE
% if(prime_type(i)==1 && congruency(i)==1 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==1 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==1 && congruency(i)==1)
        count=count+1;
    end
end
err_hand_palm_comp=100*err_count/count;


%
% % SECOND CONDITION - PALM-INCOMPATIBLE
% if(prime_type(i)==1 && congruency(i)==0 && accuracy == 1)

err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==1 && congruency(i)==0 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==1 && congruency(i)==0)
        count=count+1;
    end
end
err_hand_palm_incomp=100*err_count/count;



% % THIRD CONDITION - BACK-COMPATIBLE
% if(prime_type(i)==0 && congruency(i)==1 && accuracy == 1)


err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==1 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==0 && congruency(i)==1 )
        count=count+1;
    end
end
err_hand_back_comp=100*err_count/count;

% 
% %FOURTH CONDITION - BACK-INCOMPATIBLE
% if(prime_type(i)==0 && congruency(i)==0 && accuracy= = 1)

err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==0 && congruency(i)==0 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==0 && congruency(i)==0 )
        count=count+1;
    end
end
err_hand_back_incomp=100*err_count/count;

%% Cosmetic CONDITIONS
% FIRST CONDITION - COSM-PALM-COMPATIBLE
% if(prime_type(i)==3 && congruency(i)==1 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==3 && congruency(i)==1 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==3 && congruency(i)==1)
        count=count+1;
    end
end
err_cosm_palm_comp=100*err_count/count;


% % SECOND CONDITION - COSM-PALM-INCOMPATIBLE
% if(prime_type(i)==3 && congruency(i)==0 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==3 && congruency(i)==0 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==3 && congruency(i)==0)
        count=count+1;
    end
end
err_cosm_palm_incomp=100*err_count/count;


% % THIRD CONDITION - COSM-BACK-COMPATIBLE
% if(prime_type(i)==2 && congruency(i)==1 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==2 && congruency(i)==1 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==2 && congruency(i)==1)
        count=count+1;
    end
end
err_cosm_back_comp=100*err_count/count;

% %FOURTH CONDITION - COSM-BACK-INCOMPATIBLE
% if(prime_type(i)==2 && congruency(i)==0 && accuracy= = 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==2 && congruency(i)==0 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==2 && congruency(i)==0)
        count=count+1;
    end
end
err_cosm_back_incomp=100*err_count/count;

%% FUNCTIONAL CONDITIONS
% FIRST CONDITION - FUNC-PALM-COMPATIBLE
% if(prime_type(i)==5 && congruency(i)==1 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==5 && congruency(i)==1 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==5 && congruency(i)==1)
        count=count+1;
    end
end
err_func_palm_comp=100*err_count/count;


% % SECOND CONDITION - FUNC-PALM-INCOMPATIBLE
% if(prime_type(i)==5 && congruency(i)==0 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==5 && congruency(i)==0 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==5 && congruency(i)==0)
        count=count+1;
    end
end
err_func_palm_incomp=100*err_count/count;


% % THIRD CONDITION - FUNC-BACK-COMPATIBLE
% if(prime_type(i)==4 && congruency(i)==1 && accuracy == 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==4 && congruency(i)==1 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==4 && congruency(i)==1)
        count=count+1;
    end
end
err_func_back_comp=100*err_count/count;

% %FOURTH CONDITION - FUNC-BACK-INCOMPATIBLE
% if(prime_type(i)==4 && congruency(i)==0 && accuracy= = 1)

length_arr=length(prime_side);
err_count=0;
count=0;
for i=1:length_arr
    if(prime_type(i)==4 && congruency(i)==0 && accuracy(i) == 0 && goodSDindex(i) == 1)
        err_count= err_count + 1 ;
    elseif(prime_type(i)==4 && congruency(i)==0)
        count=count+1;
    end
end
err_func_back_incomp=100*err_count/count;


% end

% %PLOTTING PERCENT ERROR
disp=[err_hand_palm_comp err_hand_palm_incomp;err_hand_back_comp err_hand_back_incomp;err_cosm_palm_comp err_cosm_palm_incomp; err_cosm_back_comp err_cosm_back_incomp; err_func_palm_comp err_func_palm_incomp; err_func_back_comp err_func_back_incomp];
Name= ['Palm' ;'Back'];
bar(disp)
ylim([0 20])
legend('Comp','Incomp');
set(gca,'xticklabel',Name)
ylabel('Percent Error (%)')

% %EXPORTING TO EXCEL
values=[err_hand_palm_comp,err_hand_palm_incomp, err_hand_back_comp,err_hand_back_incomp, err_cosm_palm_comp, err_cosm_palm_incomp, err_cosm_back_comp, err_cosm_back_incomp, err_func_palm_comp, err_func_palm_incomp, err_func_back_comp, err_func_back_incomp];
xlswrite('percenterrorfile',values);

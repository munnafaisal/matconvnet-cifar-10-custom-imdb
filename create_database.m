%load every mat file for each class

cd 'folder_mat'
load('folder_1.mat');
kk1=kk;
load('folder_2.mat');
kk2=kk;
%%%%%%% If you have more folder then load them too..
cd (cfolder)
%accumulate every class data in an array named 'kkk'
kkk=[kk1 kk2]; %% If you have more folder then add them too...for example "kk=[ kk1 kk2 kk3 .....kkn]"
%randomizing datesets  
disp([' Randomizing databases']);
pp=size(kkk);
for i=1:1:100
p=randperm(pp(2));
B = kkk(:,p);
end

disp(['Saving ...DB.mat']);
%saving randomized data set as 'DB.mat' 
save('DB.mat','B');



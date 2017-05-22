load 'DB.mat'

%%cc=size(B);
disp(['......Creating Batched dataset']);
%we will create 5 batched dataset (like data_batch_1.mat like 'cifar' in matconvnet
% we will also ceate a test_batch.mat file in the end
%divide the total number of image in to 6 batch, 5 for training and 1 for test
% suppose we have total 21,000 images so in each batch we have 3500 images

mkdir('batched_mat_folder')

s=size(kkk);
cd 'batched_mat_folder' 
c=(s(2)-mod(s(2),6))/6;
for j=1:1:5
db=zeros(128*128*3,c); 
lebels=zeros(c,1);
k=1;
for i=(j-1)*c+1:1:j*c
    ddata=B(:,(i))';
    lebels(k)=ddata(128*128*3+1);
    ddata=ddata(1:128*128*3);
    db(:,k)=ddata';
    k=k+1;
    disp(['now reading' ' '  num2str(i)  ' '  'data']);
end

disp([' .......Converting to uint8 data format']);
db=uint8(db);
lebels=uint8(lebels);
labels=lebels;
data=db';
batch_label=['training batch ' num2str(j) ' of 5'];

disp(['Saving as batched mat file']);
fname=['data_batch_' num2str(j) '.mat'];

% saving as 4 dimensional structure
save(fname,'data' ,'labels','batch_label'); 

end

disp([ 'Preparing test batch']);

db=zeros(128*128*3, c);
lebels=zeros(c,1);
k=1;
for i=(j)*c+1:1:(j+1)*c
    ddata=B(:,(i))';
    lebels(k)=ddata(128*128*3+1);
    ddata=ddata(1:128*128*3);
    db(:,k)=ddata';
    k=k+1;
    disp(['now reading' ' '  num2str(i)  ' '  'data']);
end

disp([' Converting to uint8 data format']);
db=uint8(db);
lebels=uint8(lebels);
labels=lebels;
data=db';
batch_label=['training batch 1 of 1'];

disp(['......Saving as batched mat file']);
fname=['test_batch.mat'];
save(fname,'data' ,'labels','batch_label');

cd (cfolder)
disp([ '......Programe ended']);



cfolder=cd;
load('T.mat');
 s=max(size(T));
 x=128;
 y=128;
 c=3;
 imsize=(x*y*c); %% Image Size (128x128x3)
 for j=1:1:s
 k=1;
 % suppose dimenson of image is 128x128x3 (while the dimension of cifar-10 dataset is 32x32x3=3072) 
 %we add an extra dimenson for labeling so total size of array is (imsize+1)    
 kk=zeros(8,imsize+1); % suppose we have atleast 8 images for each class 
 kk=kk';
 
 %ss=dir('./Folder'); % read every folder class, 
 %assume in "Folder" we alreay have folders for each class containing images 
 %ss=struct2cell(ss);% 'ss' cell contains folder names and other  information 
 %mm=size(ss);
 
 ss=T.Folder(j);
 sequence=cell2mat(ss);

 cd 'Folder' %cd to current parent folder "Folder" 
 cd (sequence) % cd to current subfolder class
 files=dir('*.jpg'); %access name of every jpg image
 files=struct2cell(files); 
 m=size(files);
 %read images from current subfolder
 disp(['now reading images of' ' ' sequence ' '  ]);
 class=T.Class(j);
 %class=cell2mat(class);
 
 for i=1:1:m(2)
    
 I=imread(cell2mat(files(1,i)));
 I1=imresize(I, [x, y]);
 I2=reshape(I1,1,(imsize));
 % add a class number/labeling for current folder class in every reshaped image array  
 I2=[I2 class];
 size(I2);
 kk(:,k)=I2';
 k=k+1;
 
 end
 
 cd (cfolder)
 


kk=uint8(kk);
fname=['folder_' num2str(j) '.mat'];
% save 'kk' as mat file for every class
mkdir('folder_mat')
cd 'folder_mat'
save(fname,'kk');
cd (cfolder)
 end
 
 create_database %% If you have more classes and folders then modify "create_database.m" according to instructions given there  
 dbfinal

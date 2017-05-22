%%cd 'E:\MONI Vaia\Coocking Robot\TACoS Corpus\MATLAB\Test read xlsx file\indexxlsx\index\Test database'
cfolder=cd;
load('T.mat');
 s=max(size(T));
 x=128;
 y=128;
 c=3;
 imsize=(x*y*c);
 for j=1:1:s
 k=1;
 % suppose dimenson of image is 38x38x3= 4332 (while the dimension of cifar-10 dataset is 32x32x3=3072) 
 %we add an extra dimenson for labeling so total size of array is 4332+1=4333    
 kk=zeros(8,imsize+1); % suppose we have atleast 50 images for each class 
 kk=kk';
 %cd 'E:\MONI Vaia\Coocking Robot\TACoS Corpus\MATLAB\Test read xlsx file\indexxlsx\index\Test database'
 
 %ss=dir('./Folder'); % read every folder class, 
 %assume in "Folder" we alreay have a folder for each class  
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
 disp(['now reading' ' ' sequence  ' ' 'progess reading' ' ' ]);
 class=T.Class(j);
 %class=cell2mat(class);
 
 for i=1:1:m(2)
     cell2mat(files(1,i))
 I=imread(cell2mat(files(1,i)));
 I1=imresize(I, [x, y]);
 I2=reshape(I1,1,(imsize));
 % add a class number/labeling for current folder class in every reshaped image array  
 I2=[I2 class];
 size(I2)
 kk(:,k)=I2';
 k=k+1;
 
 end
 %cd 'E:\MONI Vaia\Coocking Robot\TACoS Corpus\MATLAB\Test read xlsx file\indexxlsx\index\'
 cd (cfolder)
 %disp(['now reading' ' ' sequence  ' ' 'progess reading' ' ' num2str(i) ' ' ]);


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
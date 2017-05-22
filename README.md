# matconvnet-cifar-10-custom-imdb
It creates custom imdb for matconvnet cifar-10
It creates 5 training "data_batch_1.mat.... data_batch_5.mat" and also "test_batch.mat" same as original cifar-10 dataset
It does not creat "batches.meta.mat" which is left for you

The example contains a parent folder named "Folder" which has two subfolders "folder_1" and  "folder_2" these two folder contains two different class of images.

The table "T.mat" contains subfolder names and their classes

If you have more images of different class then add more subfolders to "Folder" and also add in table "T.mat"

In the example you will see that image dimension is 128x128x3 rather than 32x32x3 in original cifar-10, you can modufy that for your customization.

Run "matconversion" first and you will get 6 batched mat files in the folder named "batched_mat_folder" then you have to replace all 6 mat files in ./data/cifar/cifar-10-batches-mat" (If you previously run original "cifar.m" then these allready ben created, otherwise you have to create this folder too)  folder with newly created mat files in "batched_mat_folder" and also modify "batches.meta.mat" files according to your number of classes and their names. 

If your image dimenson is differnt other than (32,32,3) then you have to change all previous image dimension (32,32,3) with your custome image size like (128,128,3) for all three "cnn_cifar,mat", "cnn_cifar_init.mat" , "cnn_cifar_init_min.mat" files in "matconvnet/examples/cifar" folder.  

Initially you have to change input image size (According to your custom image size like 128,128,3) for input layer of the CNN neural network but to have desired results you may have to change filter size in each layer of the network which is left for you.

For (128,128,3) image size it will take signicant amount of time for eigen-decomposition and normalization, so it is recommended that first you will try for lower dimension like (40,40,3)

Sorry for my poor English

Best of luck.


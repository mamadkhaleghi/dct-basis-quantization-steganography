clc
clear

cover_Image = imread('Cover_Image.png');
secret_path = 'IUT.jpg';
secret_image = imread(secret_path) ; 
%====================================================
Key = numel(uint8(fread(fopen(secret_path), '*ubit1')));
%==================================================== Stego Image
stego_image = embed_secret(cover_Image, secret_path);
%==================================================== Extracted Image
extracted_image = extract_secret(stego_image, Key ); 
%====================================================
PSNR = My_PSNR(secret_image, extracted_image);
disp(['Extracted Image PSNR: ', num2str(PSNR)]);

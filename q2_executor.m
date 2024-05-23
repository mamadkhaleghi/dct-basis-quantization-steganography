clc
clear
%=======================================================
d = 5 ;
%=======================================================
files = dir(fullfile('Images'));
numFiles = numel(files);
total_entropy = 0 ;
toall_PSNR = 0 ;
%=======================================================
for fileIndex=3:numFiles
    %=======================================================
    original_Image = imread(fullfile('Images', files(fileIndex).name)) ;
    s = size(original_Image);
    %=======================================================
    Q_Image = Quantization(original_Image,d);
    %=======================================================
    Input_data = Q_Image(:)' ;
    %=======================================================
    % (Encoding)
    compressed_data = rlc(Input_data);
    %=======================================================
    % (Decoding)
    reconstructed_data = rlc(compressed_data);
    reconstructed_image = reshape(reconstructed_data, s);
    %=======================================================
    % (Entropy of compressed data)
    values_entropy      = My_Entropy(compressed_data{1}) * length(compressed_data{1})/(s(1)*s(2));
    run_lenghts_entropy = My_Entropy(compressed_data{2}) * length(compressed_data{2})/(s(1)*s(2));
    Entropy = values_entropy + run_lenghts_entropy  ; 
    %=======================================================
    PSNR = My_PSNR(original_Image, reconstructed_image);
    %=======================================================
    disp(['image: ', files(fileIndex).name]);
    fprintf('Entropy: %.4f\n', Entropy);
    fprintf('PSNR: %.4f\n', PSNR);
    disp('======================================');
    total_entropy = total_entropy + Entropy ;
    toall_PSNR = toall_PSNR + PSNR ; 
%=======================================================
end
fprintf('Average_Entropy: %.4f\n', total_entropy/10);
fprintf('Average_PSNR: %.4f\n', toall_PSNR/10);
%=======================================================


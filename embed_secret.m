function stego_image = embed_secret(cover_image, secret_path)
    %============================================= 
    secret_id = fopen(secret_path); % reading as a file
    secret_bits = uint8(fread(secret_id, '*ubit1'));  
    fclose(secret_id);
    %=============================================
    % key = length of secret message
    Key = numel(secret_bits); 
    %=============================================
    % creating the lsb as a vector
    LSB = uint8(zeros([numel(cover_image), 1]));    
    % place the secret at the beginning of the lsb vector
    LSB(1:Key) = secret_bits; 
    %=============================================
    % setting the random seed
    rng(Key);
    % create a random pattern with the size of lsb
    Random_Pattern = (round(rand(size(LSB))) == 1); 
             
    %=============================================
    % encode it with the random pattern
    randomized_lsb = xor(LSB, Random_Pattern);
    %=============================================
    % reshaping LSB into the size of the cover image 
    randomized_lsb = reshape(randomized_lsb, size(cover_image));
    %=============================================
    % LSB flipping
    stego_image = bitset(cover_image, 1, randomized_lsb);
    %=============================================
    PSNR = My_PSNR(cover_image, stego_image);
    disp(['Stego Image PSNR: ', num2str(PSNR)]);
    %=============================================
    imwrite(stego_image, 'Stego_Image.png');
    %=============================================
end
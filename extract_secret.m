function extracted_image = extract_secret(stego_image, Key)

    LSB = (bitget(stego_image, 1) == 1);
    LSB = uint8(reshape(LSB, [numel(stego_image), 1]));

    rng(Key);
    
    Random_Pattern = round(rand(size(LSB)));
    
    Decoded_LSB = xor(LSB, Random_Pattern);

    extracted_image = Decoded_LSB(1:Key);
    %===========================================
    save_to = 'extracted_image.jpg';
    write = fopen(save_to, 'w');
    fwrite(write, extracted_image, 'ubit1'); 
    fclose(write);
    extracted_image = imread(save_to);
    %===========================================
    
end

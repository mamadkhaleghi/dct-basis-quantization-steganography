function Q_Image = Quantization(original_image,d)

    [H, W] = size(original_image);
    %========================================================
    Cols_Vector = int16(reshape(original_image, 1, []));
    Rows_Vector = int16(reshape(original_image', 1, []));
    %========================================================
    for i=2:length(Cols_Vector)
        %----------------------------------------------
        if abs(Cols_Vector(i-1) - Cols_Vector(i)) <= d
            Cols_Vector(i) = Cols_Vector(i-1);
        end
        %----------------------------------------------
        if abs(Rows_Vector(i-1) - Rows_Vector(i)) <= d
            Rows_Vector(i) = Rows_Vector(i-1);
        end
        %----------------------------------------------
    end
    %----------------------------------------------
    Cols_Vector = uint8(Cols_Vector);
    Rows_Vector = uint8(Rows_Vector);
    %========================================================
    C_rle = rlc(Cols_Vector);
    R_rle = rlc(Rows_Vector);
    %========================================================
    Entropy_C =  My_Entropy(C_rle{1})*length(C_rle{1})/(H*W) + ...
                 My_Entropy(C_rle{2})*length(C_rle{2})/(H*W);
    %==============================================
    Entropy_R =  My_Entropy(R_rle{1})*length(R_rle{1})/(H*W) + ...
                 My_Entropy(R_rle{2})*length(R_rle{2})/(H*W);
    %========================================================
    if Entropy_C >= Entropy_R
        Q_Image = uint8(reshape(Rows_Vector, H, W)');
    else
        Q_Image = uint8(reshape(Cols_Vector, H, W));
    end
    %========================================================    
end

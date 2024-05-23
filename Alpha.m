function alpha = Alpha(i, size)    % "i" here represents the "p" or "q" in the 2D DCT formula

    if i == 0
        alpha = sqrt(1/size);
    else
        alpha = sqrt(2/size);
    end
    
end
function DCT = DCT_Basis(B, M,N)

    DCT = zeros([B, B, M, N]);
    figure;
    % =============================================================================== %
    for q=0:B-1
        for p=0:B-1
            %---------------------------  basis function at (q, p)
            alph_p = Alpha(p, M);
            alph_q = Alpha(q, N);
            for m=0:M-1
                for n=0:N-1
                    DCT(p+1, q+1, m+1, n+1) = alph_p * alph_q *...
                                              cos((pi*(2*m+1)*p)/(2*M))*...
                                              cos((pi*(2*n+1)*q)/(2*N)) ;
                end
            end
            %---------------------------
            % Display DCT basis images at (q, p)
            subplot(B, B, p * B + q+1);
            imagesc(squeeze(DCT( p+1, q+1, :, :)));
            axis off;
            axis square;
            colormap gray;
            %--------------------------------------------------------------------
        end
    end
end

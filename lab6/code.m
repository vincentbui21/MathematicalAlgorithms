function image_pipeline()
    % Load your own image (object, face, landscape, etc.)
    I = im2double(rgb2gray(imread('peppers.png')));

    % Pre-process: noise removal
    I_filt = medfilt2(I, [3 3]);

    % Enhance contrast
    I_enh = imadjust(I_filt, [0.2 0.8], [0 1]);

    % Extract features (edges)
    edges = edge(I_enh, 'Canny', [0.1 0.25]);

    % Optional frequency-domain mask
    F = fftshift(fft2(I_enh));
    [M, N] = size(F);
    [u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
    H = double(sqrt(u.^2 + v.^2) < 60);
    I_lp = real(ifft2(ifftshift(F .* H)));

    % Visualization
    figure; 
    montage({I, I_filt, I_enh, edges, I_lp}, 'Size', [1 5]);
    title('Original | Denoised | Enhanced | Edges | LP result');
end
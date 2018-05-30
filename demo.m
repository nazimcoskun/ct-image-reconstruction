% Part 1: Create a sample image (create_image.m)
sample_image = create_image();

% Part 2: Create sinogram for different number of views (sinogram.m)
sinogram_10 = sinogram(sample_image, 10);
sinogram_30 = sinogram(sample_image, 30);
sinogram_60 = sinogram(sample_image, 60);
sinogram_120 = sinogram(sample_image, 120);
sinogram_180 = sinogram(sample_image, 180);

% Part 3: Simple back-projection for different number of views (back_projection.m)
bp_10 = back_projection(sinogram_10, 10);
bp_30 = back_projection(sinogram_30, 30);
bp_60 = back_projection(sinogram_60, 60);
bp_120 = back_projection(sinogram_120, 120);
bp_180 = back_projection(sinogram_180, 180);

% Part 4 - Filtered back-projection for different number of views (fbp_filter.m)
fbp_10 = back_projection(fbp_filter(sinogram_10, 10), 10);
fbp_30 = back_projection(fbp_filter(sinogram_30, 30), 30);
fbp_60 = back_projection(fbp_filter(sinogram_60, 60), 60);
fbp_120 = back_projection(fbp_filter(sinogram_120, 120), 120);
fbp_180 = back_projection(fbp_filter(sinogram_180, 180), 180);

% Display all images
figure('Color',[0 0 0],'InvertHardcopy','on','units','normalized','outerposition',[0 0 1 1]);
subplot(4,5,3); imshow(sample_image,[]); title("\color{white}Original image");
subplot(4,5,6); imshow(sinogram_10,[], 'XData', [0 1], 'YData', [0 1]); title("\color{white}Sinogram (n=10)");
subplot(4,5,7); imshow(sinogram_30,[], 'XData', [0 1], 'YData', [0 1]); title("\color{white}Sinogram (n=30)");
subplot(4,5,8); imshow(sinogram_60,[], 'XData', [0 1], 'YData', [0 1]); title("\color{white}Sinogram (n=60)");
subplot(4,5,9); imshow(sinogram_120,[], 'XData', [0 1], 'YData', [0 1]); title("\color{white}Sinogram (n=120)");
subplot(4,5,10); imshow(sinogram_180,[], 'XData', [0 1], 'YData', [0 1]); title("\color{white}Sinogram (n=180)");
subplot(4,5,11); imshow(bp_10,[]); title("\color{white}Simple BP (n=10)");
subplot(4,5,12); imshow(bp_30,[]); title("\color{white}Simple BP (n=30)");
subplot(4,5,13); imshow(bp_60,[]); title("\color{white}Simple BP (n=60)");
subplot(4,5,14); imshow(bp_120,[]); title("\color{white}Simple BP (n=120)");
subplot(4,5,15); imshow(bp_180,[]); title("\color{white}Simple BP (n=180)");
subplot(4,5,16); imshow(fbp_10,[]); title("\color{white}Filtered BP (n=10)");
subplot(4,5,17); imshow(fbp_30,[]); title("\color{white}Filtered BP (n=30)");
subplot(4,5,18); imshow(fbp_60,[]); title("\color{white}Filtered BP (n=60)");
subplot(4,5,19); imshow(fbp_120,[]); title("\color{white}Filtered BP (n=120)");
subplot(4,5,20); imshow(fbp_180,[]); title("\color{white}Filtered BP (n=180)");

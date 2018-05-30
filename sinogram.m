function sinogram_image = sinogram(sample_image, number_of_views)

    % Convert number of views to angles
    angles = linspace(1, 180, number_of_views);

    % Add padding (zeros) to avoid data loss while rotating
    image_size = 128;
    image_diagonal = sqrt(image_size^2 + image_size^2);
    padding_amount = ceil(image_diagonal - image_size) + 2;
    padded_image = zeros(image_size+padding_amount, image_size+padding_amount);
    padded_image(ceil(padding_amount/2):(ceil(padding_amount/2)+image_size-1), ...
                 ceil(padding_amount/2):(ceil(padding_amount/2)+image_size-1)) = sample_image;

    % Rotate the image for each angle and sum up the columns of each projected image to create sinogram
    n = length(angles);
    sinogram_image = zeros(size(padded_image,2), n);
    for i = 1:n
        temp_image = imrotate(padded_image, 90-angles(i), 'bilinear', 'crop');
        sinogram_image(:,i) = (sum(temp_image))';     
    end


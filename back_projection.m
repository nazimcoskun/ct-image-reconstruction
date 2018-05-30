function result = back_projection(projection, n)

    % Find the size of the projected image
    side_size = size(projection,1);
    
    % Convert number of views to angles
    theta = linspace(1, 180, n);

    % Convert theta to radians
    theta = pi - ((pi/180)*theta);

    % Prepare image
    m = length(theta); 
    result = zeros(side_size,side_size);

    % Find the center of the projection
    center_index = (side_size+1)/2;

    %  Create x and y matrices
    x = 1:side_size;
    y = 1:side_size;
    [X,Y] = meshgrid(x,y);
    x_proj = X - (side_size+1)/2;
    y_proj = Y - (side_size+1)/2;

    for i = 1:m
        % Use the backprojection formula to determine which areas on the projected images add up 
        filter_index = round(center_index + x_proj * sin(theta(i)) - y_proj * cos(theta(i)));

        % While in bounds, add the point
        bp_image = zeros(side_size,side_size);
        point = find((filter_index > 0) & (filter_index <= side_size));
        new_filter_index = filter_index(point);
        bp_image(point) = projection(new_filter_index(:),i);

        result = result + bp_image; 
    end

    result = result ./ m;

function result = fbp_filter(proj, number_of_views)

    % Convert number of views to angles
    angles = linspace(1, 180, number_of_views);
    
    % Filtered back projection
    n = length(angles);
    delta = angles(2) - angles(1);
    K = (-n:n-1) * delta;
    odd = rem(n,2);
    phi = zeros(2*n, 1);
    phi(2-odd:2:end) = -1 ./ (pi^2 * K(2-odd:2:end).^2);
    phi(n+1) = 1 / (4 * delta^2);
    phi = phi * delta^2;
    result = conv2(proj, phi, "same");
function result = create_image()

    result = zeros(128);

    for x = 1:128
        for y = 1:128

            % Create an ellipse, representing body contour
            if (x-64)^2/40^2 + (y-64)^2/50^2 <= 1
                result(x,y) = 40;
            end

            % Create an ellipse, representing left lung
            if (x-64)^2/25^2 + (y-85)^2/20^2 <= 1
                result(x,y) = 10;
            end

            % Create an ellipse, representing right lung
            if (x-64)^2/24^2 + (y-43)^2/21^2 <= 1
                result(x,y) = 10;
            end

            % Create a circle, representing lesion in the right lung
            if (x-50)^2 + (y-43)^2 <= 5^2
                result(x,y) = 80;
            end

            % Create a circle, representing another lesion in the right lung
            if (x-70)^2 + (y-36)^2 <= 2^2
                result(x,y) = 60;
            end

            % Create a circle, representing lesion in the left lung
            if (x-73)^2 + (y-86)^2 <= 3^2
                result(x,y) = 70;
            end
            
            % Create a square, representing lesion in the left lung
            if x>70 && x<73 && y>70 && y<73
                result(x,y) = 50;
            end

        end
    end

end
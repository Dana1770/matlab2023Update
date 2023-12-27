function result=RM_1_order(in, fact_r, fact_c)
    [r, c, ch] = size(in);
    new_r = r * fact_r;
    new_c = c * fact_c;
    r_ratio = r / new_r;
    c_ratio = c / new_c;
    out = zeros(new_r, new_c, ch);

    for k = 1:ch
        for new_x = 1:new_r%for loop in new image rows 1:4
            old_x = new_x * r_ratio;
            if (old_x == 0)
                old_x = 1;
            end
            x1 = floor(old_x);
            x2 = x1 + 1;
            if x1 < 1
                x1 = 1;
            end
            if x2 > r
                x2 = r;
            end

            for new_y = 1:new_c%1 :6
                old_y = new_y * c_ratio;
                if (old_y == 0)
                    old_y = 1;
                end
                y1 = floor(old_y);
                y2 = y1 + 1;
                if y1 < 1
                    y1 = 1;
                end
                if y2 > c
                    y2 = c;
                end

                p1 = in(x1, y1, k);
                p2 = in(x2, y1, k);
                p3 = in(x1, y2, k);
                p4 = in(x2, y2, k);
                
                x_fraction = old_x - x1;
                y_fraction = old_y - y1;

                z1 = p1 * (1 - x_fraction) + p2 * x_fraction;
                z2 = p3 * (1 - x_fraction) + p4 * x_fraction;
                new_pixel = z1 * (1 - y_fraction) + z2 * y_fraction;
                out(new_x, new_y, k) = uint8(new_pixel);
            end
        end
    end

    disp(out);
    out = uint8(out);
%     figure, imshow(in), title('Original');
%     figure, imshow(out), title('Resized 1');
result=out;
end
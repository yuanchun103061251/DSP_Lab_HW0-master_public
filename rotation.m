% rotate image clockwised around center point (1,1), with a radius degrees 
% input1---source image: I
% input2---rotation degrees: radius (ex: pi/3)
% output---rotated image: I_rot

function I_rot = rotation(I, radius);
% RGB channel
R(:,:) = I(:,:,1);
G(:,:) = I(:,:,2);
B(:,:) = I(:,:,3);

% get height, width, channel of image
[height, width, channel] = size(I);

%% create new image
% step1. record image vertex, and use rotation matrix to get new vertex.
matrix = [cos(radius) -sin(radius) ; sin(radius) cos(radius)]; 
vertex = [1 width 1 width;1 1 height height];
vertex_new = matrix*vertex;

% step2. find min x, min y, max x, max y, use "min()" & "max()" function is ok
%%% ... 
left_width = min(vertex_new(1,:));
left_height = min(vertex_new(2,:));
right_width = max(vertex_new(1,:));
right_height = max(vertex_new(2,:));


% step3. consider how much to shift the image to the positive axis
x_shift = -left_width;
y_shift = -left_height;

% step4. calculate new width and height, if they are not integer, use
% "ceil()" & "floor()" to help get the largest width and height.
width_new = ceil(right_width) - floor(left_width);
height_new = ceil(right_height) - floor(left_height);

% step5. initial r,g,b array for the new image
R_rot = zeros(height_new,width_new);
G_rot = zeros(height_new,width_new);
B_rot = zeros(height_new,width_new);
%res_red= zeros(1;2);


%% back-warping using bilinear interpolation
% for each pixel on the rotation image, find the correspond r,g,b value 
% from the source image, and save to R_rot, G_rot, B_rot.
matrix_inverse = [cos(radius) sin(radius) ; -sin(radius) cos(radius)]; 
 for y_new = 1 : height_new
     for x_new = 1 : width_new
        
        % step5. shift the new pixel (x_new, y_new) back, and rotate -radius
        % degree to get (x_old, y_old)
        %%% ... 
        aaa = [x_new-x_shift; y_new-y_shift]; 
        reg= matrix_inverse*aaa;
        xx = reg(1);
        yy = reg(2);
        %res_green= matrix_inverse*(x_new-x_shift, y_new-y_shift);
        %res_blue= matrix_inverse*(x_new-x_shift, y_new-y_shift);
        
        
        %R_rot(y_new, x_new) = [res_red(1,2),res_red(1,1)];
        %G_rot(y_new, x_new) = [res_green(1,2),res_green(1,1)];
        %B_rot(y_new, x_new) = [res_blue(1,2),res_blue(1,1)];
        % step6. using "ceil()" & "floor()" to get interpolation coordinates
        % x1, x2, y1, y2
        %%% ..
        %x1 = ceiling(res_red(1))-res_red(1);
        %x2 = res_red(1)-floor(res_red(1));
        %y1 = ceiling(res_red(2))-res_red(2));
        %y2 = res_red(2)-floor(res_red(1));
        %R_rot(y_new, x_new) = R(ceiling(res_red(1)),ceiling(res_red(2)))*x2*y2+R(ceiling(res_red(1)),floor(res_red(2)))*x2*y1+R(floor(res_red(1)),floor(res_red(2)))*x1*y1+R(floor(res_red(1)),ceiling(res_red(2)))*x1*y2;       
        x1 = ceil(xx);
        x2 = floor(xx);
        y1 = ceil(yy);
        y2 = floor(yy);
        
        % step7. if (x_old, y_old) is inside of the source image, 
        % calculate r,g,b by interpolation.
        % else if (x_old, y_old) is outside of the source image, set
        % r,g,b = 0(black).
        if (x1 >= 1) && (x1 <= width) && (x2 >= 1) && (x2 <= width) && ...
            (y1 >= 1) && (y1 <= height)&& (y2 >= 1) && (y2 <= height)
            % step8. calculate weight wa, wb. Notice that if x1=x2 or y1=y2 ,
            % function "wa=()/(x1-x2)" will be fail. At this situation, you
            % need to assign a value to wa directly.
            %%% ...
            wa = (xx-x2)/(x1-x2);
            wb = (yy-y2)/(y1-y2);
            % step9. calculate weight w1, w2 w3, w4 for 4 neighbor pixels. 
            %%% ...
            w1 = (1-wa)*(1-wb);
            w2 = wa*(1-wb);
            w3 = wa*wb;
            w4 = (1-wa)*wb;
            % step10. calculate r,g,b with 4 neighbor point and their weight
            %%% ...
            r = double(R(ceil(yy),ceil(xx))*w3+R(ceil(yy),floor(xx))*w2+R(floor(yy),floor(xx))*w1+R(floor(yy),ceil(xx))*w4);           
            g = double(G(ceil(yy),ceil(xx))*w3+G(ceil(yy),floor(xx))*w2+G(floor(yy),floor(xx))*w1+G(floor(yy),ceil(xx))*w4); 
            b= double(B(ceil(yy),ceil(xx))*w3+B(ceil(yy),floor(xx))*w2+B(floor(yy),floor(xx))*w1+B(floor(yy),ceil(xx))*w4);  
            
            
            
        else
            r = 0;
            g = 0;
            b = 0;
        end
        R_rot(y_new, x_new) = r/255;
        G_rot(y_new, x_new) = g/255;
        B_rot(y_new, x_new) = b/255;
    end
 end

% save R_rot, G_rot, B_rot to output image
I_rot(:,:,1) = R_rot;
I_rot(:,:,2) = G_rot;
I_rot(:,:,3) = B_rot;


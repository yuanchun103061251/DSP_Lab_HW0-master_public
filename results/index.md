# Your Name <span style="color:red">(羅元均 103061251 lab0_report)</span>

# Project 0 / pixel array manipulation

## Overview
The project is related to 
> flipping and rotation of RGB images


## Implementation
1. flipping algorithm
	* design flow
		* horizontal flipping
			1. devide a RGB image to three parts, red, green, and blue.
			2. flip every channel in the horizontal direction, implemented by the following codes:
				```
				R_flip(h, w) = R(h, width-w+1);
				```
		* vertical flipping
			1. devide a RGB image to three parts, red, green, and blue.
			2. flip every channel in the vertical direction, implemented by the following codes:
				```
				R_flip(h, w) = R(height-h+1, w);
				```
		* horizontal and vertical flipping
			1. devide a RGB image to three parts, red, green, and blue.
			2. flip every channel in the vertical and horizontal direction, implemented by the following codes:
				```
				R_flip(h, w) = R(height-h+1, width-w+1);
				```
	* images		
		# the original image
		<img src="/files/image.jpg" width="24%"/>   <br />
		# the horizontally flipped image
		<img src="/files/horizontally_flipped.jpg" width="24%"/>   <br />
		# image of the vertically flipped image
		<img src="/files/vertically_flipped.jpg" width="24%"/>   <br />
		# image of the vertically and horizontally flipped image
		<img src="/files/horizontally_vertically_flipped.jpg" width="24%"/>   <br />

2. rotation algorithm	
	* design flow
		1. devide a RGB image to three parts, red, green, and blue.
		2. set a rotation matrix:
			```
			matrix = [cos(radius) -sin(radius) ; sin(radius) cos(radius)]; 
			```
		3. put the four corners into operation:
			```
			vertex = [1 width 1 width;1 1 height height];
			vertex_new = matrix*vertex;
			```
		4. find the new width and height(step 2~4):
			```
			width_new = ceil(right_width) - floor(left_width);
			height_new = ceil(right_height) - floor(left_height);
			```
			
		5. inverse the matrix
			```
			matrix_inverse = [cos(radius) sin(radius) ; -sin(radius) cos(radius)]; 
			
			```
		6. shift and rotate back to the original
			```
			aaa = [x_new-x_shift; y_new-y_shift]; 
        	reg= matrix_inverse*aaa;
        	xx = reg(1);
        	yy = reg(2);
			```
		7. find integer points near the point rotated back
			```
			x1 = ceil(xx);
        	x2 = floor(xx);
        	y1 = ceil(yy);
        	y2 = floor(yy);
			```
		8. calculate the final value of every point by interpolation
			```
			wa = (xx-x2)/(x1-x2);
            wb = (yy-y2)/(y1-y2);
           	w1 = (1-wa)*(1-wb);
            w2 = wa*(1-wb);
            w3 = wa*wb;
            w4 = (1-wa)*wb;
            r = double(R(ceil(yy),ceil(xx))*w3+R(ceil(yy),floor(xx))*w2+R(floor(yy),floor(xx))*w1+R(floor(yy),ceil(xx))*w4); 
            g = double(G(ceil(yy),ceil(xx))*w3+G(ceil(yy),floor(xx))*w2+G(floor(yy),floor(xx))*w1+G(floor(yy),ceil(xx))*w4); 
            b=  double(B(ceil(yy),ceil(xx))*w3+B(ceil(yy),floor(xx))*w2+B(floor(yy),floor(xx))*w1+B(floor(yy),ceil(xx))*w4); 
			```
		9. combine r, g, and b to build the image after rotation
		

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
		
		## image of the horizontally flipped image

		<table border=1>
		<tr>
		<td>
		<img src="placeholder.jpg" width="24%"/>
		<img src="placeholder.jpg"  width="24%"/>
		<img src="placeholder.jpg" width="24%"/>
		<img src="placeholder.jpg" width="24%"/>
		</td>
		</tr>

		<tr>
		<td>
		<img src="placeholder.jpg" width="24%"/>
		<img src="placeholder.jpg"  width="24%"/>
		<img src="placeholder.jpg" width="24%"/>
		<img src="placeholder.jpg" width="24%"/>
		</td>
		</tr>

		</table>



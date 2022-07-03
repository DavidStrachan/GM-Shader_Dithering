# GM-Shader_Dithering
Full screen Dithering effect for GameMaker using shaders.


![Dithering Shader in GameMaker](http://www.davetech.co.uk//i/github_images/dither2.gif)

This is a GameMaker v2022.600 project file with a full screen dithering shader similar to what you see in the game: Return of the Obra Dinn. (this repo has nothing to do with Return of the Obra Dinn I just made it for fun). 

## Features:
- Ability to pick from up to two colours! 
- You can adjust the size of the pixels. 
- You can select you own grid for different types of dithering. 

![Full Screen Dither Effect](http://www.davetech.co.uk//i/github_images/dither3b.png)

This project works by breaking the screen into many Magic Squares. These magic squares tell the pixel at that point what brightness values should be used to switch between the two colours. You can enter your own values for each Magic Square and this allows you to get different effects on the dither.

![Full Screen Dither Effect](http://www.davetech.co.uk//i/github_images/dither4.png)

Select what threshold needs to be met to switch between colours. 

```
magic_grid = [	8/16,	11/16,	14/16,	1/16,
	        13/16,	2/16,	7/16,	12/16,
	        3/16,	16/16,	9/16,	6/16,
	        10/16,	5/16,	4/16,	15/16]
```

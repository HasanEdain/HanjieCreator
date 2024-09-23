# README
## About
Hanjie are puzzles that start with an image. The image is in a rectangular grid.
Each row and column indicates how many consecutive "on" pixels are in it. By finding which dots are on, the image is revealed.

## Use
The editor is buggy, but can be used.
change the grid size, hit "Resize" then "Toggle" twice.

The rest should work pretty reasonably.
There is a bug with vertical size. It is hard coded right now (render size) so the rendeered puzzle may be too tall or too short depending on the number of hints needed.

Clear sets all cells to "off"

Save should make three files:
<fileName>_<saveCount>_puzzle.txt
<fileName>_<saveCount>_puzzle.pdf
<fileName>_<saveCount>_solved.pdf

save count is set to 0 at startup and increments each time save is pressed

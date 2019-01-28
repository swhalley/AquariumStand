# Aquarium Stand Overview
This is a CAD design for an aquarium stand using [OpenSCAD](http://www.openscad.org).

The aquarium design is based off of a few different youtube videos. Here is a link to one of the few videos used for this 
design - https://www.youtube.com/watch?v=wPMn0xXjZF4

# Getting Started
* Download and Install OpenSCAD (created with version 2015.03-2)
* Download the `Aquarium Stand.scad` file from this repository
* Open the file in OpenSCAD
* Make and configurations (see below). Use `F5` to preview and `F6` to Render. Note that in the current release there is 
no color with render.

# Configuring the Stand
There are a few numbers that need to be tweaked to work for custom stand sizes. This design is for a 75 Gallon 
tank (48.25"x18.25"x9.75") with a 28" high stand. The build was with 2x4's.

The numbers you need to tweak are in the `scad` file.

`wood` - Adjust this value for the wood size you are using. This should be the dried size of the wood. For example a 2x4 is 
actually closer to 1.5"x3.5" in dimension. Google these values if you don't know them.

`aquarium` - plug in the dimensions of your aquarium in inches.

`stand` - The stand is designed to give a 1" buffer, which works out to be a 1/2" lip around the outside. If you want the stand to 
be the exact size of the aquarium, remove the `+1` in the equation. For the height of the stand, change the last value (default 28") 
to the height you want your stand.

`middleSupports` - If you want a center support for some extra heaft, switch this variable from `false` to `true`.

`drawAquarium` - If you want to see the relative size of your tank sitting on the stand, turn this value from `false` to `true`

# Materials List
Look in the Log. You will see entries like `ECHO: "Long Base", 49.25`. Group and count up the pieces to know what needs to be cut.

# Disclaimer
Make sure you spend some time understanding the weight of your tank, and what lumber and designs will support it. Based on the research 
I did this seems to be a good build for a 75 gallon tank. Also double calculate anything you see here. My math is horrible and there 
are probably errors.

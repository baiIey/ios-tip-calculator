# iOS Tip Calculator

This is an iOS demo application 

Time spent: 5 hours spent in total

Completed user stories:

 * [x] Required: User can view a list of latest box office movies including title, cast and tomatoes rating
 * [x] Required: User can click on a movie in the list to bring up a details page with additional information such as synopsis
 * [x] Optional: Placeholder image is used for movie posters loaded in from the network
 
Notes:
Spent time trying to adjust the numeric format of the selected tip percentage. tipPercentLabel.text = String(format: "%g percent tip", showTip) prints "percent" instead of "%" because I couldn't figure out how to couple the additional "%" to "%g%"

Couldn't implement an animation block that contained the initial state and the final state, zero to one, in the same block. Instead, the code for both states rest onLoad and onEditingChanged, respectively.

Walkthrough of all user stories:

![Video Walkthrough](anim_rotten_tomatoes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).
Framework for animation blocks reference guidance from the blog of [Mathew Sanders](http://mathewsanders.com/prototyping-iOS-iPhone-iPad-animations-in-swift/)
String formats referenced from Microsoft Developer Network's [Standard Numeric Format Strings](http://msdn.microsoft.com/en-us/library/dwhawy9k%28v=vs.110%29.aspx)

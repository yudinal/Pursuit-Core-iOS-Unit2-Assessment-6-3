//
//  ProjectNotes.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Eric Widjaja on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


/*
 
 1. Rename VC to MainViewController.
 2. On Main.Storyboard, created Table View with one prototype cell. Added two labels inside the cell, to show CrayonColorName and CrayonHex#
 3. Connect IBOutlet firstTableView to MainViewController. Named 'ReuseIdentifier' and MainViewController.
 4. Commit and push on gitHub
 5. Declare a private variable [as arr of arrs] inside the class MainVC as the main place to look for data
 6. Conform the datasource, by making the extension, add the protocols, write the codes, declare two constant vars and put in the correct name for 'reuseable cell identifier'
 7. Set the background color, textLabel and detailTextLabel. Change CellType into Subtitle, otherwise the two Labels' AutoLayout went awry.
 8. Preparing the segue:
 a. Create Detailed VC with: RGB Sliders, RGB Labels, Alpha Slider & Label, Reset Button and CrayonColorName Label.
 b. Create two constant variabels, to receive the segue, and to be used in the Detail VC.
 c. Change the name of Detail VC to CrayonsDetailVC and its folder too when you connect the segue.
 d. Create private functions for defaultValue, updateLabels, updateColors, and connected them to their apropiate buttons/stepper.
 
 9. Run the and debugged.
 10. Adjust the Auto Layout on all the buttons, labels.
 
 
 */


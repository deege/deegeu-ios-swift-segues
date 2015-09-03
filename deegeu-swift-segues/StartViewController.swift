//
//  StartViewController.swift
//  deegeu-swift-segues
//
//  Created by Daniel Spiess on 9/3/15.
//  Copyright © 2015 Daniel Spiess. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, DestinationViewDelegate {

    
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Prepares for segue to destination controller. We cannot set the controls directly
    // because they are not wired up at this point. So we set a variable to be used
    // during viewDidLoad in the destination.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "pickColorSegue") {
            let destination = segue.destinationViewController as! DestinationViewController
            destination.delegate = self

            if (colorView.backgroundColor!.isEqual(UIColor.redColor())) {
                destination.colorLabelText = "Was red"
            } else if (colorView.backgroundColor!.isEqual(UIColor.greenColor())) {
                destination.colorLabelText = "Was green"
            } else if (colorView.backgroundColor!.isEqual(UIColor.blueColor())) {
                destination.colorLabelText = "Was blue"
            } else {
                destination.colorLabelText = "Unselected"
            }

        } else {
            print("Unknown segue")
        }
    }
    
    // Called from the destination controller via delegation
    func setColor(colorName: String) {
        if (colorName == "Red") {
            colorView.backgroundColor = UIColor.redColor()
        } else if (colorName == "Green") {
            colorView.backgroundColor = UIColor.greenColor()
        } else if (colorName == "Blue") {
            colorView.backgroundColor = UIColor.blueColor()
        }
    }

}


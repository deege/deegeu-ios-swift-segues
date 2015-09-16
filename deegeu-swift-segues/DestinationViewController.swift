//
//  DestinationViewController.swift
//  deegeu-swift-segues
//
//  Created by Daniel Spiess on 9/3/15.
//  Copyright © 2015 Daniel Spiess. All rights reserved.
//

import UIKit

protocol DestinationViewDelegate {
    func setColor(colorName: String);
}

class DestinationViewController: UIViewController {
    
    @IBOutlet weak var destinationOutletLabel: UILabel!
    
    var delegate : DestinationViewDelegate! = nil
    var colorLabelText : String! = nil
    
    // Sets the color on the delegate (StartViewController) and then pops to the root view
    @IBAction func touchUpInsideSelectedColor(sender: UIButton) {
        if let title = sender.currentTitle {
            delegate.setColor(title)
            self.navigationController?.popToRootViewControllerAnimated(true)
        } else {
            print("title is nil")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the color text to the value passed in from
        // the segue
        destinationOutletLabel.text = colorLabelText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
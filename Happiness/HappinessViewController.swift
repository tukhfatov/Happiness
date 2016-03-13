//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Tukhfatov Margulan on 3/7/16.
//  Copyright © 2016 Tukhfatov Margulan. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource{

    @IBOutlet weak var myFaceView: FaceView! {
        didSet {
            myFaceView.dataSource = self
        }
    }
    
    @IBOutlet weak var myLabel: UILabel!
    
    var happiness: Int = 50 {
        didSet {
            happiness = min(max(happiness, 0) , 100)
            print("Happiness \(happiness)")
            updateUI()
        }
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }

    func updateUI() {
        if (happiness < 50){
            myLabel.text = "У Сундета настра нету"
            if (happiness == 0){
                myLabel.text = "У Сундета все х*ево"
            }
        }else if(happiness > 50){
            myLabel.text = "У Сундета все нормально"
            if (happiness == 100){
                myLabel.text = "У Сундета все зашибись"
            }
        }
        myFaceView.setNeedsDisplay()
    }
    @IBAction func sliderValueChanged(sender: UISlider) {
        happiness = Int(sender.value)
    }
    
}

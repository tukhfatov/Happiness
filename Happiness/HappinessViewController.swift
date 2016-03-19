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
            myFaceView.addGestureRecognizer(UIPinchGestureRecognizer(target: myFaceView, action: "scale:"))
        }
    }
    
    @IBOutlet weak var myLabel: UILabel!
    
    private struct Constants {
        static let HappinessGestureScale:CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state{
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(myFaceView)
            let happinessChange = -Int(translation.y/Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: myFaceView)
            }
        default: break
        }
    }
    var happiness: Int = 50 {
        didSet {
            happiness = min(max(happiness, 0) , 100)
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
    
}

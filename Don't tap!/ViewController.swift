//
//  ViewController.swift
//  Don't tap!
//
//  Created by Saumya Raval on 12/11/16.
//  Copyright © 2016 Rush A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myTimer: NSTimer!
    var score: Int = 0

    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var ghostBtn: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        happyBtn.hidden = false
    }


    @IBAction func happyTapped(sender: AnyObject) {
        //startTimer()
        //randomHappyButton()
        //changeGameState()
        
        //let rand = arc4random_uniform(2)

        //let image = UIImage(named: "happy.png") as UIImage!
        //happyBtn.setImage(image, forState: .Normal)
        randomHappyButton(happyBtn)
        //updateScore()
//        } else if rand == 1 {
//            let image = UIImage(named: "ghost_emo.png") as UIImage!
//            happyBtn.setImage(image, forState: .Normal)
//            randomHappyButton()
//    
//        }
    
        updateScore()
    }
    
    
    @IBAction func ghostTapped(sender: AnyObject) {
        
    }
    
    func startTimer() {
        if myTimer != nil {
            myTimer.invalidate()
        }
        
        myTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        updateScore()
        //randomHappyButton()
    }
    
    func updateScore() {
        score += 1
        scoreLbl.text = "Score: \(score)"
    }
    
    func randomHappyButton(happyBtn: UIButton) -> UIButton {
        // Find the button's width and height
        let buttonWidth = happyBtn.frame.width
        let buttonHeight = happyBtn.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = happyBtn.superview!.bounds.width
        let viewHeight = happyBtn.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        happyBtn.center.x = xoffset + buttonWidth / 2
        happyBtn.center.y = yoffset + buttonHeight / 2
        
        //happyBtn.frame = CGRectMake(xoffset, yoffset, buttonWidth, buttonHeight)
        return happyBtn
    }

}


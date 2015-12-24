//
//  ViewController.swift
//  casino1
//
//  Created by scotty on 12/22/15.
//  Copyright © 2015 Piccard. All rights reserved.
//
import AVFoundation
import UIKit

var stop:Bool = false
var d1:Int = 1
var d2:Int = 1
var dice_one:String = "dice" + String(d1)
var dice_two:String = "dice" + String(d2)


class ViewController: UIViewController {

    
    
   
    var DiceSoundEffect: AVAudioPlayer!
    
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice1: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dice1.image = UIImage(named: "dice6")
        dice2.image = UIImage(named: "dice2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PlaySound()
    {
        let path = NSBundle.mainBundle().pathForResource("sliceBombFuse.caf", ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            DiceSoundEffect = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func rollButtonPressed(sender: UIButton)
    {
        stop = true
        print("roll was pressed")
        d1 = Int(arc4random_uniform(6)+1)
        d2 = Int(arc4random_uniform(6)+1)
        dice_one = "dice" + String(d1)
        dice_two = "dice" + String(d2)
        dice1.image = UIImage(named: dice_one)
        dice2.image = UIImage(named: dice_two)
        
        print(dice_one)
        print(dice_two)
    }
    
    
    
    
    func SetDice(d: UIImageView)
    {
        //This is just a comment
        let i = Int(arc4random_uniform(6)) + 1
        if(i==1)
        {
            d.image = UIImage(named: "dice1")!
        }
        if(i==2)
        {
            d.image = UIImage(named: "dice2")!
        }
        if(i==3)
        {
            d.image = UIImage(named: "dice3")!
        }
        if(i==4)
        {
            d.image = UIImage(named: "dice4")!
        }
        if(i==5)
        {
            d.image = UIImage(named: "dice5")!
        }
        if(i==6)
        {
            d.image = UIImage(named: "dice6")!
        }

    }
    
    @IBAction func GetRandom()
    {
       
        SetDice(dice1)
        SetDice(dice2)
            sleep(3)
        
    }
}


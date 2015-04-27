//
//  ViewController.swift
//  LeaMaroltSonnenschein
//
//  Created by Lea Marolt on 4/25/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // user defaults
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // circleViews
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var developmentView: UIView!
    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var extraView: UIView!
    
    // labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var designLabel: UILabel!
    @IBOutlet weak var developmentLabel: UILabel!
    @IBOutlet weak var extraLabel: UILabel!
    @IBOutlet weak var desNdevLabel: UILabel!
    
    // images
    @IBOutlet weak var extraImage: UIImageView!
    @IBOutlet weak var devImage: UIImageView!
    @IBOutlet weak var personalImage: UIImageView!
    @IBOutlet weak var desImage: UIImageView!
    
    // buttons
    @IBOutlet weak var personalButton: UIButton!
    @IBOutlet weak var devButton: UIButton!
    // actions
    @IBOutlet weak var desButton: UIButton!
    @IBOutlet weak var extraButton: UIButton!
    
    @IBAction func personalActivate(sender: AnyObject) {
        
        defaults.setInteger(0, forKey: "category")
        
        fillCircleToTransition(personalView, color: green)
        personalImage.image = UIImage(named: "leaLine")
        
        performSegueWithIdentifier("sendToDetail", sender: sender)
    }
    
    @IBAction func devActivate(sender: AnyObject) {
        
        defaults.setInteger(1, forKey: "category")
        
        fillCircleToTransition(developmentView, color: red)
        devImage.image = UIImage(named: "gear")
        
        performSegueWithIdentifier("sendToDetail", sender: sender)
    }
    
    @IBAction func desActivate(sender: AnyObject) {
        
        defaults.setInteger(2, forKey: "category")
        
        fillCircleToTransition(designView, color: blue)
        desImage.image = UIImage(named: "palette")
        
        performSegueWithIdentifier("sendToDetail", sender: sender)
    }
    
    @IBAction func extraActivate(sender: AnyObject) {
        
        defaults.setInteger(3, forKey: "category")
        
        fillCircleToTransition(extraView, color: yellow)
        extraImage.image = UIImage(named: "extra")
        
        performSegueWithIdentifier("sendToDetail", sender: sender)
    }
    // variables
    let green = UIColor(red: 41.0/255.0, green: 181.0/255.0, blue: 163.0/255.0, alpha: 1.0)
    let red = UIColor(red: 253.0/255.0, green: 84.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    let blue = UIColor(red: 55.0/255.0, green: 165.0/255.0, blue: 239.0/255.0, alpha: 1.0)
    let yellow = UIColor(red: 239.0/255.0, green: 173.0/255.0, blue: 55.0/255.0, alpha: 1.0)
    
    var testLayer: CAShapeLayer = CAShapeLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func circularizeWithColor(squareView: UIView, color: UIColor) {
        
        var circleLayer: CAShapeLayer = CAShapeLayer()
        
        squareView.layer.masksToBounds = true
        squareView.layer.cornerRadius = 50
        squareView.layer.borderWidth = 3.0
        squareView.layer.borderColor = color.CGColor
        
        circleLayer.frame = CGRect(
            x: squareView.bounds.origin.x,
            y: squareView.bounds.origin.y,
            width: squareView.bounds.size.width,
            height: squareView.bounds.size.height)
        

    }
    
    func fillCircleToTransition(squareView: UIView, color:UIColor) {
        
        var circleLayer: CAShapeLayer = CAShapeLayer()
        
        circleLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: squareView.bounds.size.width,
            height: squareView.bounds.size.height)
    
        circleLayer.backgroundColor = UIColor.clearColor().CGColor
        circleLayer.cornerRadius = 50
        
        squareView.layer.addSublayer(circleLayer)
        
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        
        animation.fromValue = circleLayer.backgroundColor
        animation.toValue = color.CGColor
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        // Finally, add the animation to the layer
        circleLayer.addAnimation(animation, forKey: "backgroundColor")
        
        circleLayer.backgroundColor = color.CGColor
        
    }
    
    func setUpView() {
        
        nameLabel.font = UIFont(name: "Corbel-Bold", size: 82)
        personalLabel.font = UIFont(name: "Corbel-Bold", size: 16)
        designLabel.font = UIFont(name: "Corbel-Bold", size: 16)
        developmentLabel.font = UIFont(name: "Corbel-Bold", size: 16)
        extraLabel.font = UIFont(name: "Corbel-Bold", size: 16)
        desNdevLabel.font = UIFont(name: "Corbel", size: 12)
        
        circularizeWithColor(personalView, color: green)
        circularizeWithColor(developmentView, color: red)
        circularizeWithColor(designView, color: blue)
        circularizeWithColor(extraView, color: yellow)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
                
        if segue.identifier == "sendToDetail"{
            if (sender.isEqual(personalButton)) {
                
                if let destinationViewController = segue.destinationViewController as? DetailedInfoViewController {
                    destinationViewController.view.backgroundColor = green
                    destinationViewController.categoryInfo.text  = "Personal"
                }
            }
            
            if (sender.isEqual(devButton)) {
                
                if let destinationViewController = segue.destinationViewController as? DetailedInfoViewController {
                    destinationViewController.view.backgroundColor = red
                    destinationViewController.categoryInfo.text = "Development"
                    
                }
            }
            
            if (sender.isEqual(desButton)) {
                
                if let destinationViewController = segue.destinationViewController as? DetailedInfoViewController {
                    destinationViewController.view.backgroundColor = blue
                    destinationViewController.categoryInfo.text = "Art"
                    
                }
            }
            
            if (sender.isEqual(extraButton)) {
                
                if let destinationViewController = segue.destinationViewController as? DetailedInfoViewController {
                    destinationViewController.view.backgroundColor = yellow
                    destinationViewController.categoryInfo.text = "Extra"
                    
                }
            }
        }
    }

}


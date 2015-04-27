//
//  PageItemController.swift
//  LeaMaroltSonnenschein
//
//  Created by Lea Marolt on 4/26/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {

    @IBOutlet weak var contentImage: UIImageView!
    
    var itemIndex: Int = 0 // ***
    
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = contentImage {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImage!.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func exit(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

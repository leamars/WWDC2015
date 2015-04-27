//
//  DetailedInfoViewController.swift
//  LeaMaroltSonnenschein
//
//  Created by Lea Marolt on 4/26/15.
//  Copyright (c) 2015 Hellosunschein. All rights reserved.
//

import UIKit

class DetailedInfoViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    // user defaults
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var catInfo: String!
    
    @IBOutlet weak var desNDev: UILabel!
    @IBOutlet weak var categoryInfo: UILabel!
    // create instance of our custom transition manager
    let transitionManager = TransitionManager()
    
    let green = UIColor(red: 41.0/255.0, green: 181.0/255.0, blue: 163.0/255.0, alpha: 1.0)
    let red = UIColor(red: 253.0/255.0, green: 84.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    let blue = UIColor(red: 55.0/255.0, green: 165.0/255.0, blue: 239.0/255.0, alpha: 1.0)
    let yellow = UIColor(red: 239.0/255.0, green: 173.0/255.0, blue: 55.0/255.0, alpha: 1.0)
    
    var category: Int = 0
    
    ///////////////////////
    
    private var pageViewController: UIPageViewController?
    
    // Initialize it right away here
    private let contentImages = [["personal1",
        "personal2", "personal3"], ["dev1", "dev2", "dev3", "dev4", "dev5", "dev6", "dev7", "dev8", "dev9", "dev10"], ["des1", "des2", "des3", "des4", "des7", "des5", "des6"], ["ex1", "ex2", "ex3", "ex4", "ex5", "exLast"]];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpView()
        
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
    
    ////////////////////////////////////////////
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self
        
        if contentImages[category].count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    func setUpView() {
        self.transitioningDelegate = self.transitionManager
        
        categoryInfo.font = UIFont(name: "Corbel-Bold", size: 26)
        desNDev.font = UIFont(name: "Corbel", size: 12)
        
        category = defaults.integerForKey("category")
        
        /////////////////////////////
        createPageViewController()
        setupPageControl()
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 0.5)
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.clearColor()
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex+1 < contentImages[category].count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageItemController? {
        
        if itemIndex < contentImages[category].count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[category][itemIndex] as! String
            return pageItemController
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return contentImages[category].count
    
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}


//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Andrew McGovern on 11/6/17.
//  Copyright © 2017 Andrew McGovern. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var theView: UIView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // This needed to be moved from viewDidLoad to 
        // viewDidAppear, because the frame data
        // is not available to us yet in viewDidLoad
        
        var contentWidth: CGFloat = 0.0
        
        print("Scrollview width: \(scrollView.frame.size.width))")
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            let scrollWidth = scrollView.frame.size.width
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        // I accomplished this task during the bonus
        // exercise to enable the swipe even
        // when the user swipes outside
        // of the scroll view area
        theView.addGestureRecognizer(scrollView.panGestureRecognizer)
    }

}


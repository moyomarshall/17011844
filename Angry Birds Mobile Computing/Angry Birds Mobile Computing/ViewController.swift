//
//  ViewController.swift
//  Angry Birds Mobile Computing
//
//  Created by mm17aft on 21/12/2019.
//  Copyright © 2019 mm17aft. All rights reserved.
//

import UIKit

protocol subviewDelegate {
    func updateLocation(dx: CGFloat, dy: CGFloat, center: CGPoint)
}

class ViewController: UIViewController, subviewDelegate{
    
    var angleX: CGFloat!
    var angleY: CGFloat!
    var releasePoint: CGPoint!
   
 
    func updateLocation(dx: CGFloat, dy: CGFloat, center: CGPoint) {
        angleX = dx
        angleY = dy
        releasePoint = center
    }
    

    
    
    

    @IBOutlet weak var targetImageView: DragImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetImageView.BDelegate = self
        
        
        
        
        
        // Do any additional setup after loading the view.
    }


}


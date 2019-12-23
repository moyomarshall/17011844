//
//  ViewController.swift
//  Angry Birds Mobile Computing
//
//  Created by mm17aft on 21/12/2019.
//  Copyright © 2019 mm17aft. All rights reserved.
// Marshall Moyo

import UIKit

protocol subviewDelegate {
    func updateLocation(dx: CGFloat, dy: CGFloat, center: CGPoint)
    func ball()
    
}

class ViewController: UIViewController, subviewDelegate{
    
    var dynamicAnimator: UIDynamicAnimator!
    var ballCollisionBehavior: UICollisionBehavior!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var gravityBehavior: UIGravityBehavior!
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
 
    var ballArray:[UIImageView] = []
    
    func ball() {
        let ball = UIImageView(image: nil)
        ball.image = UIImage( named: "ball.png")
        ball.frame = CGRect(x: W * 0.10, y: H * 0.5, width: W * 0.10, height: H * 0.17 )
        self.view.addSubview(ball)
        self.view.bringSubviewToFront(ball)
        self.ballArray.append(ball)
       
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: ballArray)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        dynamicItemBehavior.addItem(ball)
        dynamicItemBehavior.addLinearVelocity(CGPoint(x: angleX * 2, y: angleY ), for: ball)
        
        //adding gravity
        //gravityBehavior = UIGravityBehavior(items: [ball])
       // dynamicAnimator.addBehavior(gravityBehavior)
        
        
        // adding collision behaviour
        
        ballCollisionBehavior = UICollisionBehavior(items: ballArray)
       // ballCollisionBehavior.translatesReferenceBoundsIntoBoundary = true 
        
       ballCollisionBehavior.addBoundary(withIdentifier: "Top_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint(x: self.W * 1.0, y: self.H * 0.0))
     ballCollisionBehavior.addBoundary(withIdentifier: "Left_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 0.0), to: CGPoint(x: self.W * 0.0, y: self.H * 1.0))
       ballCollisionBehavior.addBoundary(withIdentifier:  "Bottom_Boundary" as NSCopying, from: CGPoint(x: self.W * 0.0, y: self.H * 1.0), to: CGPoint(x: self.W * 1.0, y: self.H * 1.0 ))
        
        dynamicAnimator.addBehavior(ballCollisionBehavior)
        
        
        
        
        
        
    }
    
    
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


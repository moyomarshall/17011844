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
        let ballView = UIImageView(image: nil)
        ballView.image = UIImage( named: "ball.png")
        ballView.frame = CGRect(x: W * 0.10, y: H * 0.5, width: 50, height: 50 )
        self.view.addSubview(ballView)
        self.view.bringSubviewToFront(ballView)
        self.ballArray.append(ballView)
       
        dynamicItemBehavior = UIDynamicItemBehavior(items: ballArray)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        dynamicItemBehavior.addItem(ballView)
        dynamicItemBehavior.addLinearVelocity(CGPoint(x: angleX * 2, y: angleY ), for: ballView)
        
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
        
        ballCollisionBehavior.action = {
            
            for randomball in self.ballArray{
                for randomBird in self.birdArray {
                    if randomball.frame.intersects(randomBird.frame){
                        let dead = self.view.subviews.count
                        randomBird.removeFromSuperview()
                        let alive = self.view.subviews.count
                        
                        if (dead != alive){
                            self.score += 1
                            self.scoreLabel.text = String(self.score)
                            
                        }
                        
                    }
                    
                }
            }
            
        }
        
        
        
        
    }
    
var score = 0

 var birdImageArray: [UIImage] = [
        UIImage( named: "bird1.png")!,
        UIImage( named: "bird2.png")!,
        UIImage( named: "bird3.png")!,
        UIImage( named: "bird4.png")!,
        UIImage( named: "bird5.png")!,
        UIImage( named: "bird6.png")!,
       UIImage( named: "bird7.png")!,
      UIImage( named: "bird8.jpg")!,
    UIImage( named: "bird9.png")!,
       UIImage( named: "bird10.png")!,
      UIImage( named: "bird11.png")!,
       UIImage( named: "bird12.png")!,
       UIImage( named: "bird13.png")!,
        
        ]

    
    var birdArray: Array<UIImageView> = []

    func birds(){
        let numberOfBirds = 5
        let bird_size = Int(self.H)/numberOfBirds-1
        
        //let randomHieght = Int(self.H) / numberOfBirds *
            //Int.random(in: 0...numberOfBirds)
        
        let birdView =  UIImageView (image: nil)
        birdView.image = self.birdImageArray.randomElement()
        birdView.frame = CGRect(x: W * 0.89, y: H * 0.0, width: CGFloat(bird_size), height: CGFloat(bird_size))
        self.view.addSubview(birdView)
        self.view.bringSubviewToFront(birdView)
        
        let birdView2 =  UIImageView (image: nil)
        birdView2.image = self.birdImageArray.randomElement()
        birdView2.frame = CGRect(x: W * 0.89, y: H * 0.2, width: CGFloat(bird_size), height: CGFloat(bird_size))
        self.view.addSubview(birdView2)
        self.view.bringSubviewToFront(birdView2)
        
        let birdView3 =  UIImageView (image: nil)
        birdView3.image = self.birdImageArray.randomElement()
        birdView3.frame = CGRect(x: W * 0.89, y: H * 0.4, width: CGFloat(bird_size), height: CGFloat(bird_size))
        self.view.addSubview(birdView3)
        self.view.bringSubviewToFront(birdView3)
        
        let birdView4 =  UIImageView (image: nil)
        birdView4.image = self.birdImageArray.randomElement()
        birdView4.frame = CGRect(x: W * 0.89, y: H * 0.6, width: CGFloat(bird_size), height: CGFloat(bird_size))
        self.view.addSubview(birdView4)
        self.view.bringSubviewToFront(birdView4)
        
        let birdView5 =  UIImageView (image: nil)
        birdView5.image = self.birdImageArray.randomElement()
        birdView5.frame = CGRect(x: W * 0.89, y: H * 0.8, width: CGFloat(bird_size), height: CGFloat(bird_size))
        self.view.addSubview(birdView5)
        self.view.bringSubviewToFront(birdView5)
        
     
        self.birdArray.append(birdView)
        self.birdArray.append(birdView2)
        self.birdArray.append(birdView3)
        self.birdArray.append(birdView4)
        self.birdArray.append(birdView5)
        
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: true){_ in
            let numberOfBirds = Int.random(in: 0...4)
            self.view.addSubview(self.birdArray[numberOfBirds])
            
        }
        
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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    
    
    func reply(){
//        let when = DispatchTime.now() + 20
//        DispatchQueue.main.asyncAfter(deadline: when){
//            self.view.addSubview(replayFrame)
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let replayFrame = UIImageView(image: UIImage(named: "replay.png"))
      //  replayFrame.frame = UIScreen.main.bounds
       // self.view.sendSubviewToBack(<#T##view: UIView##UIView#>)
       // self.view.addSubview(replayFrame)
        
//        let when = DispatchTime.now() + 2
//        DispatchQueue.main.asyncAfter(deadline: when){
//            self.view.addSubview(replayFrame)
//        }
        
       
        
        
        let backgroundView = UIImageView(image: UIImage(named: "background.jpg"))
        backgroundView.frame = UIScreen.main.bounds
        self.view.sendSubviewToBack(backgroundView)
        self.view.addSubview(backgroundView)
        
        self.view.bringSubviewToFront(targetImageView)
        self.view.bringSubviewToFront(scoreLabel)
        targetImageView.BDelegate = self
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)

        
        birds()
        
        // Do any additional setup after loading the view.
    }


}


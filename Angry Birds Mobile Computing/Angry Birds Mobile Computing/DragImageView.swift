//
//  DragImageView.swift
//  Angry Birds Mobile Computing
//
//  Created by mm17aft on 21/12/2019.
//  Copyright © 2019 mm17aft. All rights reserved.
//

import UIKit

class DragImageView: UIImageView {
    
 
    

    var startlocation: CGPoint?
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    var BDelegate:subviewDelegate?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startlocation = touches.first?.location(in: self) //When touch begins, retrieve the starting point
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //When touch moves, work out the differences between x and y axis, and assign the new centre
        let currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startlocation!.x
        let dy = currentLocation!.y - startlocation!.y
        var newCenter = CGPoint(x: self.center.x + dx, y: self.center.y + dy)
        
        //constrain the movement to the phone screen bounds
        let halfx = self.bounds.midX
        newCenter.x = max(halfx, newCenter.x)
        newCenter.x = min(self.superview!.bounds.width - halfx - ( W * 0.72), newCenter.x)
        
        let halfy = self.bounds.midY
        newCenter.y = max(halfx + (H *
            0.23), newCenter.y)
        newCenter.y = min(self.superview!.bounds.height - halfy - (H * 0.23), newCenter.y)
        
        
        self.center = newCenter
        
        self.BDelegate?.updateLocation(dx: dx * 10, dy: dy * 10, center: self.center)
    

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.BDelegate?.ball()
        self.center = CGPoint (x: W * 0.075, y: H * 0.50)
    }
   

}

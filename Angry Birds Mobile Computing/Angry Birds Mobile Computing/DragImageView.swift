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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startlocation = touches.first?.location(in: self)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startlocation!.x
        let dy = currentLocation!.y - startlocation!.y
        let newCenter = CGPoint(x: self.center.x + dx, y: self.center.y + dy)
        
        self.center = newCenter
    

    }
   

}

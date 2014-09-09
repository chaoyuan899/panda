//
//  Platform.swift
//  panda
//
//  Created by aaron on 14-9-9.
//  Copyright (c) 2014年 The Technology Studio. All rights reserved.
//

import SpriteKit

class Platform : SKNode {
    var width: CGFloat = 0.0
    var height: CGFloat = 10.0
    
    func onCreate(aarSprite: [SKSpriteNode]) {
        for platform in aarSprite {
            platform.position.x = self.width
            self.addChild(platform)
            self.width += platform.size.width
        }
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.width, self.height), center: CGPointMake(self.width / 2.0, 0))
        self.physicsBody?.categoryBitMask = BitMaskType.platform
        self.physicsBody?.dynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0
    }
}

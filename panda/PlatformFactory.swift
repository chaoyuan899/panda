//
//  PlatformFactory.swift
//  panda
//
//  Created by aaron on 14-9-9.
//  Copyright (c) 2014年 The Technology Studio. All rights reserved.
//

import SpriteKit

class PlatformFactory: SKNode {
    let textureLeft = SKTexture(imageNamed: "platform_l")
    let textureMid = SKTexture(imageNamed: "platform_m")
    let textureRight = SKTexture(imageNamed: "platform_r")
    
    var platforms = [Platform]()
    var sceneWith : CGFloat = 0
    var delegate: ProtocolMainScene?
    
    func createPlatformRandom() {
        //随机创建平台长度
        let midNum: UInt32 = UInt32(arc4random()%4 + 1)
        //随机间隔
        let gap: CGFloat = CGFloat(arc4random()%8 + 1)
        //x坐标
        let x: CGFloat = self.sceneWith + CGFloat(midNum * 50) + gap + 100
        //y坐标
        let y: CGFloat = CGFloat(arc4random()%200 + 200)
        
        createPlatform(midNum, x: x, y: y)
    }
    
    func createPlatform(midNum: UInt32, x: CGFloat, y: CGFloat) {
        let platform = Platform()
        let platform_left = SKSpriteNode(texture: textureLeft)
        platform_left.anchorPoint = CGPointMake(0, 0.9)
        
        let platform_right = SKSpriteNode(texture: textureRight)
        platform_right.anchorPoint = CGPointMake(0, 0.9)
        
        var aarPlatform = [SKSpriteNode]()
        
        aarPlatform.append(platform_left)
        platform.position = CGPointMake(x, y)
        
        for i in 1...midNum {
            let platform_mid = SKSpriteNode(texture: textureMid)
            platform_mid.anchorPoint = CGPointMake(0, 0.9)
            aarPlatform.append(platform_mid)
        }
        aarPlatform.append(platform_right)
        
        platform.onCreate(aarPlatform)
        
        self.addChild(platform)
        
        platforms.append(platform)
        
        //通用公式：平台的长度 + x坐标 - 主场景的宽度
        delegate?.onGetData (platform.width + x - sceneWith)
        
    }
    
    func move(speed: CGFloat) {
        for p in platforms {
            p.position.x -= speed
        }
        if platforms[0].position.x < -platforms[0].width {
            platforms[0].removeFromParent()
            platforms.removeAtIndex(0)
        }
    }
}
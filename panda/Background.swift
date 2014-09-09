//
//  Background.swift
//  panda
//
//  Created by aaron on 14-9-9.
//  Copyright (c) 2014年 The Technology Studio. All rights reserved.
//

import SpriteKit

class Background: SKNode {
    
    //近处的背景数组
    var arrBG = [SKSpriteNode]()
    //远处的背景数组
    var arrFar = [SKSpriteNode]()
    override init() {
        super.init()
        var farTexture = SKTexture(imageNamed: "background_f1")
        
        var farBg0 = SKSpriteNode(texture: farTexture)
        farBg0.anchorPoint = CGPointMake(0, 0)
        farBg0.position.y = 150
        
        var farBg1 = SKSpriteNode(texture: farTexture)
        farBg1.anchorPoint = CGPointMake(0, 0)
        farBg1.position.x = farBg0.frame.width
        farBg1.position.y = 150
        
        var farBg2 = SKSpriteNode(texture: farTexture)
        farBg2.anchorPoint = CGPointMake(0, 0)
        farBg2.position.x = farBg0.frame.width * 2
        farBg2.position.y = 150
        
        self.addChild(farBg0)
        self.addChild(farBg1)
        self.addChild(farBg2)
        arrFar.append(farBg0)
        arrFar.append(farBg1)
        arrFar.append(farBg2)
        
        //近处的背景
        var texture = SKTexture(imageNamed: "background_f0")
        var bg0 = SKSpriteNode(texture: texture)
        bg0.anchorPoint = CGPointMake(0, 0)
        bg0.position.y = 70
        
        var bg1 = SKSpriteNode(texture: texture)
        bg1.anchorPoint = CGPointMake(0, 0)
        bg1.position.x = bg0.frame.width
        bg1.position.y = 70
        
        self.addChild(bg0)
        self.addChild(bg1)
        arrBG.append(bg0)
        arrBG.append(bg1)
    }
    
    func move(speed: CGFloat) {
        //近景
        for bg in arrBG {
            bg.position.x -= speed
        }
        if arrBG[0].position.x + arrBG[0].frame.width < speed {
            arrBG[0].position.x = 0
            arrBG[1].position.x = arrBG[0].frame.width
        }
        
        //远景
        for far in arrFar {
            far.position.x -= speed / 4
        }
        if arrFar[0].position.x + arrFar[0].frame.width < speed / 4 {
            arrFar[0].position.x = 0
            arrFar[1].position.x = arrFar[0].frame.width
            arrFar[2].position.x = arrFar[0].frame.width * 2
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

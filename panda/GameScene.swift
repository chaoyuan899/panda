//
//  GameScene.swift
//  panda
//
//  Created by aaron on 14-9-9.
//  Copyright (c) 2014年 The Technology Studio. All rights reserved.
//

import SpriteKit


protocol ProtocolMainScene {
    func onGetData (dist: CGFloat)
}

class GameScene: SKScene , ProtocolMainScene, SKPhysicsContactDelegate{
    lazy var panda = Panda()
    lazy var platformFactory = PlatformFactory()
    lazy var bg = Background()
    var moveSpeed: CGFloat = 10
    var lastDis: CGFloat = 0.0
    
    func didBeginContact(contact: SKPhysicsContact) {
        if(contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.platform | BitMaskType.panda) {
            panda.run()
            panda.jumpEnd = panda.position.y
            if panda.jumpEnd - panda.jumpStart <= -70 {
                panda.roll()
            }
        }
        
        if(contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.scene | BitMaskType.panda) {
            println("游戏结束")
        }
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        panda.jumpStart = panda.position.y
    }
    
    override func didMoveToView(view: SKView) {
        let skyColor = SKColor(red: 113/255.0, green: 197/255.0, blue: 207/255.0, alpha: 1)
        self.backgroundColor = skyColor
        
        //背景
        self.addChild(bg)
        bg.zPosition = 20 //数值越大越先渲染
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.categoryBitMask = BitMaskType.scene
        self.physicsBody?.dynamic = false
        
        panda.position = CGPointMake(200,400)
        panda.zPosition = 40
        self.addChild(panda)
        
        self.addChild(platformFactory)
        platformFactory.delegate = self
        platformFactory.zPosition = 30
        platformFactory.sceneWith = self.frame.size.width
        platformFactory.createPlatform(3, x: 20, y: 200)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        panda.jump()
    }
   
    override func update(currentTime: CFTimeInterval) {
        bg.move(moveSpeed / 5)
        lastDis -= moveSpeed
        if lastDis <= 0 {
            print("create new platform")
//            platformFactory.createPlatform(1, x: 1500, y: 200)
            platformFactory.createPlatformRandom()
        }
        platformFactory.move(moveSpeed)
       
    }
    
    func onGetData(dist: CGFloat) {
        self.lastDis = dist
    }
}

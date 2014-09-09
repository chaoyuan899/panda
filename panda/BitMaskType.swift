//
//  BitMaskType.swift
//  panda
//
//  Created by aaron on 14-9-9.
//  Copyright (c) 2014年 The Technology Studio. All rights reserved.
//


class BitMaskType {
    class var panda: UInt32 {
        return 1 << 0
    }
    class var platform: UInt32 {
        return 1 << 1
    }
    class var apple:UInt32 {
        return 1 << 2
    }
    class var scene: UInt32 {
        return 1 << 3
    }
}

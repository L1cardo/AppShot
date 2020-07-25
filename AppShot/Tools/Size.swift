//
//  Size.swift
//  AppShot
//
//  Created by Licardo on 2020/7/19.
//  Copyright © 2020 Licardo. All rights reserved.
//

import Foundation

struct Screen {
    var width: CGFloat
    var height: CGFloat
    var mockupWidth: CGFloat
    var mockupHeight: CGFloat
}

struct Size {
    static var iphone6_5 = Screen(width: 1242, height: 2688, mockupWidth: 1502, mockupHeight: 2948)
    static var iphone5_5 = Screen(width: 1242, height: 2208, mockupWidth: 1642, mockupHeight: 3008)
    static var ipad12_9 = Screen(width: 2048, height: 2732, mockupWidth: 2068, mockupHeight: 2788)
    static var macBookPro = Screen(width: 2880, height: 1800, mockupWidth: 3560, mockupHeight: 2200)
}

enum DeviceType {
    case iPhone, iPad, macBookPro
}

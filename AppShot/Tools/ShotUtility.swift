//
//  ShotUtility.swift
//  Swiftui-mac-test
//
//  Created by Licardo on 2020/7/17.
//  Copyright © 2020 Licardo. All rights reserved.
//

import SwiftUI

extension NSView {
    func snapshot(format: NSBitmapImageRep.FileType) -> NSImage {
        guard let bitmapRepresentation = bitmapImageRepForCachingDisplay(in: bounds) else {
            return NSImage()
        }
        bitmapRepresentation.size = bounds.size.doubleScale
        cacheDisplay(in: NSRect(x: bounds.size.width / 4, y: -bounds.size.height / 4, width: bounds.size.width, height: bounds.size.height), to: bitmapRepresentation)
        let data = bitmapRepresentation.representation(using: format, properties: [:])
        return NSImage(data: data!)!
    }
}

extension View {
    func asImage(width: CGFloat, height: CGFloat, format: NSBitmapImageRep.FileType) -> NSImage {
        let wrapper = NSHostingView(rootView: self)
        wrapper.frame = CGRect(x: 0, y: 0, width: width / 2, height: height / 2)
        return wrapper.snapshot(format: format)
    }
}

extension CGSize {
    var doubleScale: CGSize {
        CGSize(width: width / 2, height: height / 2)
    }
}

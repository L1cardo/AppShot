//
//  InputImageView.swift
//  AppShot
//
//  Created by Licardo on 2020/7/19.
//  Copyright © 2020 Licardo. All rights reserved.
//

import SwiftUI

struct InputImageView: View {
    @Binding var image: NSImage?
    @Binding var screenSizeIndex: Int
    @Binding var deviceIndex: Int
    @Binding var deviceOffsetX: CGFloat
    @Binding var deviceOffsetY: CGFloat
    @Binding var mainTitle: String
    @Binding var mainTitleFont: CGFloat
    @Binding var mainTitleColor: Color
    @Binding var mainTitleOffsetX: CGFloat
    @Binding var mainTitleOffsetY: CGFloat
    @Binding var subTitle: String
    @Binding var subTitleFont: CGFloat
    @Binding var subTitleColor: Color
    @Binding var subTitleOffsetX: CGFloat
    @Binding var subTitleOffsetY: CGFloat
    @Binding var bgColor: Color
    @Binding var bgImage: NSImage?
    @Binding var needBgImage: Bool
    
    let devices = ["iPhone 11 Pro Max Gold", "iPhone 11 Pro Max Midnight Green", "iPhone 11 Pro Max Silver", "iPhone 11 Pro Max Space Grey", "iPhone 11 Black", "iPhone 11 Green", "iPhone 11 Purple", "iPhone 11 Red", "iPhone 11 White", "iPhone 11 Yellow"]
    
    var width: CGFloat {
        screenSizeIndex == 0 ? Size.iphone6_5.width : Size.iphone5_5.width
    }
    var height: CGFloat {
        screenSizeIndex == 0 ? Size.iphone6_5.height : Size.iphone5_5.height
    }
    var mockupWidth: CGFloat {
        screenSizeIndex == 0 ? Size.iphone6_5.mockupWidth : Size.iphone5_5.mockupWidth
    }
    var mockupHeight: CGFloat {
        screenSizeIndex == 0 ? Size.iphone6_5.mockupHeight: Size.iphone5_5.mockupHeight
    }
    
    var body: some View {
        VStack {
            Text(mainTitle)
                .foregroundColor(mainTitleColor)
                .font(.system(size: mainTitleFont))
                .fontWeight(.bold)
                .offset(y: screenSizeIndex == 0 ? 0 : 40)
                .offset(x: mainTitleOffsetX, y: mainTitleOffsetY)
            
            Text(subTitle)
                .foregroundColor(subTitleColor)
                .font(.system(size: subTitleFont))
                .offset(y: screenSizeIndex == 0 ? 10 : 50)
                .offset(x: subTitleOffsetX, y: subTitleOffsetY)
            
            ZStack {
                if image != nil {
                    Image(nsImage: image!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: mockupWidth / 6 - 42, height: mockupHeight / 6 - 42)
                } else {
                    Text("Drag and drop image file")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: width / 6 - 30)
                }
                
                Image(devices[deviceIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: mockupWidth / 6, height: mockupHeight / 6)
            }
            .offset(y: screenSizeIndex == 0 ? 20 : 60)
            .offset(x: deviceOffsetX, y: deviceOffsetY)
        }
        .frame(width: width / 4, height: height / 4)
        .background(
            ZStack {
                bgColor
                if bgImage != nil && self.needBgImage {
                    Image(nsImage: bgImage!)
                        .resizable()
                        .scaledToFill()
                }
            }
        )
        .onDrop(of: ["public.file-url"], isTargeted: nil, perform: handleOnDrop(providers:))
    }
    
    private func handleOnDrop(providers: [NSItemProvider]) -> Bool {
        if let item = providers.first {
            item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { urlData, _ in
                DispatchQueue.main.async {
                    if let urlData = urlData as? Data {
                        let url = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
                        guard let image = NSImage(contentsOf: url) else {
                            return
                        }
                        self.image = image
                    }
                }
            }
            return true
        }
        return false
    }
}

struct IphoneInputImageView_Previews: PreviewProvider {
    static var previews: some View {
        InputImageView(image: .constant(NSImage()), screenSizeIndex: .constant(0), deviceIndex: .constant(0), deviceOffsetX: .constant(0), deviceOffsetY: .constant(0), mainTitle: .constant(""), mainTitleFont: .constant(16), mainTitleColor: .constant(.white), mainTitleOffsetX: .constant(0), mainTitleOffsetY:  .constant(0), subTitle: .constant(""), subTitleFont: .constant(12), subTitleColor: .constant(.white), subTitleOffsetX:  .constant(0), subTitleOffsetY:  .constant(0), bgColor: .constant(.blue), bgImage: .constant(NSImage()), needBgImage: .constant(false))
    }
}

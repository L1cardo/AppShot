//
//  ScreenSizePickerView.swift
//  AppShot
//
//  Created by Licardo on 2020/7/20.
//  Copyright © 2020 Licardo. All rights reserved.
//

import SwiftUI

struct ScreenSizePickerView: View {
    var deviceType: DeviceType
    @Binding var screenSizeIndex: Int
    
    var screenSizes: [String] {
        switch deviceType {
        case .iPhone:
            return ["6.5 inch" , "5.5 inch"]
        case .iPad:
            return ["Landscape", "Portrait"]
        default:
            return ["MacBookPro"]
        }
    }
    
    var body: some View {
        Picker("Screen Size", selection: $screenSizeIndex) {
            ForEach(screenSizes.indices, id: \.self) { index in
                Text(self.screenSizes[index])
            }
        }
        .labelsHidden()
    }
}

struct DevicePickerView: View {
    var deviceType: DeviceType
    @Binding var deviceIndex: Int
    
    var devices: [String] {
        switch deviceType {
        case .iPhone:
            return ["iPhone 11 Pro Max Gold", "iPhone 11 Pro Max Midnight Green", "iPhone 11 Pro Max Silver", "iPhone 11 Pro Max Space Grey", "iPhone 11 Black", "iPhone 11 Green", "iPhone 11 Purple", "iPhone 11 Red", "iPhone 11 White", "iPhone 11 Yellow"]
        case .iPad:
            return ["iPad Pro 11 Space Gray", "iPad Pro 11 Silver"]
        default:
            return ["Macbook Pro 16 Space Grey", "Macbook Pro 16 Silver", "Macbook Pro 13 Space Grey", "Macbook Pro 13 Silver"]
        }
    }
    
    var body: some View {
        Picker("Screen Size", selection: $deviceIndex) {
            ForEach(devices.indices, id: \.self) { index in
                Text(self.devices[index])
            }
        }
        .labelsHidden()
    }
}

struct ScreenSizePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenSizePickerView(deviceType: .iPhone, screenSizeIndex: .constant(0))
    }
}

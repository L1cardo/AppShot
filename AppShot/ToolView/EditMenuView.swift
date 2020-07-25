//
//  EditMenuView.swift
//  AppShot
//
//  Created by Licardo on 2020/7/20.
//  Copyright © 2020 Licardo. All rights reserved.
//

import SwiftUI

struct EditMenuView: View {
    var deviceType: DeviceType
    @Binding var screenSizeIndex: Int
    @Binding var deviceIndex: Int
    @Binding var deviceOffsetX: CGFloat
    @Binding var deviceOffsetY: CGFloat
    @Binding var deviceRotate: Double
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
        
    var width: CGFloat {
        switch deviceType {
        case .iPhone:
            return screenSizeIndex == 0 ? Size.iphone6_5.width : Size.iphone5_5.width
        case .iPad:
            return Size.ipad12_9.height
        default:
            return Size.macBookPro.width
        }
        
    }
    var height: CGFloat {
        switch deviceType {
        case .iPhone:
            return screenSizeIndex == 0 ? Size.iphone6_5.height : Size.iphone5_5.height
        case .iPad:
            return Size.ipad12_9.width
        default:
            return Size.macBookPro.height
        }
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Device")
                    Spacer()
                    Button {
                        withAnimation {
                            self.deviceOffsetX = 0
                            self.deviceOffsetY = 0
                            self.deviceRotate = 0
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                    }.buttonStyle(PlainButtonStyle())
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Screen Size")
                        ScreenSizePickerView(deviceType: deviceType, screenSizeIndex: $screenSizeIndex)
                    }
                    HStack {
                        Text("Device")
                        DevicePickerView(deviceType: deviceType, deviceIndex: $deviceIndex)
                    }
                    HStack {
                        Text("Offset X")
                        Slider(value: $deviceOffsetX, in: -100...100)
                        Button {
                            withAnimation {
                                self.deviceOffsetX = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Offset Y")
                        Slider(value: $deviceOffsetY, in: -150...150)
                        Button {
                            withAnimation {
                                self.deviceOffsetY = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Rotate")
                        Slider(value: $deviceRotate, in: -80...80)
                        Button {
                            withAnimation {
                                self.deviceRotate = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.leading)
                Divider()
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text("Main Title")
                    Spacer()
                    Button {
                        withAnimation {
                            self.mainTitle = "Main Title"
                            self.mainTitleFont = 40
                            self.mainTitleColor = Color.white
                            self.mainTitleOffsetX = 0
                            self.mainTitleOffsetY = 0
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                    }.buttonStyle(PlainButtonStyle())
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Title")
                        TextField("Main Title", text: $mainTitle)
                    }
                    HStack {
                        Text("Font")
                        Slider(value: $mainTitleFont, in: 20...50)
                        Button {
                            withAnimation {
                                self.mainTitleFont = 30
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Color")
                        ColorPicker("", selection: $mainTitleColor, supportsOpacity: true)
                            .labelsHidden()
                            .frame(height: 25)
                        Button {
                            withAnimation {
                                self.mainTitleColor = Color.white
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Offset X")
                        Slider(value: $mainTitleOffsetX, in: -100...100)
                        Button {
                            withAnimation {
                                self.mainTitleOffsetX = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Offset Y")
                        Slider(value: $mainTitleOffsetY, in: -150...150)
                        Button {
                            withAnimation {
                                self.mainTitleOffsetY = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.leading)
                Divider()
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text("Sub Title")
                    Spacer()
                    Button {
                        withAnimation {
                            self.subTitle = "Sub Title"
                            self.subTitleFont = 20
                            self.subTitleColor = Color.white
                            self.subTitleOffsetX = 0
                            self.subTitleOffsetY = 0
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                    }.buttonStyle(PlainButtonStyle())
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Title")
                        TextField("Sub Title", text: $subTitle)
                    }
                    HStack {
                        Text("Font")
                        Slider(value: $subTitleFont, in: 15...40)
                        Button {
                            withAnimation {
                                self.subTitleFont = 20
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Color")
                        ColorPicker("", selection: $subTitleColor, supportsOpacity: true)
                            .labelsHidden()
                            .frame(height: 25)
                        Button {
                            withAnimation {
                                self.mainTitleColor = Color.white
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Offset X")
                        Slider(value: $subTitleOffsetX, in: -100...100)
                        Button {
                            withAnimation {
                                self.subTitleOffsetX = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Offset Y")
                        Slider(value: $subTitleOffsetY, in: -150...150)
                        Button {
                            withAnimation {
                                self.subTitleOffsetY = 0
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.leading)
                Divider()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Background")
                    Spacer()
                    Button {
                        withAnimation {
                            self.bgColor = Color(.systemTeal)
                            self.bgImage = nil
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                    }.buttonStyle(PlainButtonStyle())
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Color")
                        ColorPicker("", selection: $bgColor, supportsOpacity: true)
                            .labelsHidden()
                            .frame(height: 25)
                        Button {
                            withAnimation {
                                self.bgColor = Color(.systemTeal)
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    HStack {
                        Text("Image")
                        Button {
                            self.selectFile()
                        } label: {
                            Text("Select")
                        }
                        Spacer()
                        Button {
                            withAnimation {
                                self.bgImage = nil
                            }
                        } label: {
                            Image(systemName: "arrow.counterclockwise")
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.leading)
                Divider()
            }
            Spacer()
        }
        .frame(minWidth: 250, maxWidth: 250, maxHeight: .infinity)
        .padding()
    }
    
    private func selectFile() {
        NSOpenPanel.openImage { (result) in
            if case let .success(image) = result {
                self.bgImage = image
            }
        }
    }
}

struct IphoneEditMenuView_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuView(deviceType: .iPhone, screenSizeIndex: .constant(0), deviceIndex: .constant(0), deviceOffsetX: .constant(0), deviceOffsetY: .constant(0), deviceRotate: .constant(0), mainTitle: .constant(""), mainTitleFont: .constant(16), mainTitleColor: .constant(.white), mainTitleOffsetX: .constant(0), mainTitleOffsetY:  .constant(0), subTitle: .constant(""), subTitleFont: .constant(12), subTitleColor: .constant(.white), subTitleOffsetX:  .constant(0), subTitleOffsetY:  .constant(0), bgColor: .constant(.blue), bgImage: .constant(NSImage()))
    }
}

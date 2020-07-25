//
//  SidebarView.swift
//  AppShot
//
//  Created by Licardo on 2020/7/19.
//  Copyright © 2020 Licardo. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    @State private var selection: Set<Int> = [0]
    
    var body: some View {
        List(selection: $selection) {
            NavigationLink(destination: IphoneView()) {
                Label("iPhone", systemImage: "iphone")
            }.tag(0)
            
            NavigationLink(destination: IPadView()) {
                Label("iPad", systemImage: "ipad.landscape")
            }.tag(1)
            
            NavigationLink(destination: MacBookView()) {
                Label("MacBook", systemImage: "laptopcomputer")
            }.tag(2)
            
            
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 160, idealWidth: 160, maxWidth: 160, maxHeight: .infinity)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}

//
//  greatTubeApp.swift
//  greatTube
//
//  Created by NewDawn0 on 01.01.2025.
//

import SwiftUI

@main
struct greatTubeApp: App {
    var body: some Scene {
        WindowGroup {
            WebView(url: URL(string: "https://youtube.com/")!)
                .edgesIgnoringSafeArea(.trailing)
        }
    }
}

//
//  ContentView.swift
//  greatTube
//
//  Created by NewDawn0 on 01.01.2025.
//

import SwiftUI
@preconcurrency import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = .all
        return WKWebView(frame: .zero, configuration: config)
    }()
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            WebView(url: URL(string: "https://youtube.com/")!)
                .edgesIgnoringSafeArea(.trailing)
        }
    }
}

#Preview {
    ContentView()
}

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
        config.allowsPictureInPictureMediaPlayback = false
        return WKWebView(frame: .zero, configuration: config)
    }()
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ view: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        view.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WebView
    
    init(_ parent: WebView) {
        self.parent = parent
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

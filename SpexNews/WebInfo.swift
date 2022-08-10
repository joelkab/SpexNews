//
//  WebInfo.swift
//  SpexNews
//
//  Created by Joel Kabura on 8/9/22.
//

import Foundation

import SwiftUI
import WebKit


struct WebInfo : UIViewRepresentable {
    
    
    var url: String
    func makeUIView(context: UIViewRepresentableContext<WebInfo>) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
   
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebInfo>) {
        
    }
    

}

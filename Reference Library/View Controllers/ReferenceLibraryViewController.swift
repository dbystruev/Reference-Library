//
//  ReferenceLibraryViewController.swift
//  Reference Library
//
//  Created by Denis Bystruev on 20.10.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit
import WebKit

class ReferenceLibraryViewController: UIReferenceLibraryViewController {
    // MARK: - Properties
    var delegate: ViewControllerDelegate?
    
    // MARK: - Custom Methods
    func findWKWebView() {
        guard var currentView = view else { return }
        
        while currentView.subviews.count != 0 {
            if let webView = currentView as? WKWebView {
                webView.navigationDelegate = self
            }
            
            if let subview = currentView.subviews.first {
                currentView = subview
            }
        }
    }
    
    // MARK: - UIViewController Methods
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        findWKWebView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.presentAlert()
    }
}

// MARK: - WKNavigationDelegate
extension ReferenceLibraryViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript(
            "document.documentElement.outerHTML.toString()",
            completionHandler: { html, error in
                if let html = html as? String {
                    self.delegate?.updateWebView(with: html)
                } else {
                    print(#line, #function, "ERROR \(error?.localizedDescription ?? "")")
                }
            }
        )
    }
}

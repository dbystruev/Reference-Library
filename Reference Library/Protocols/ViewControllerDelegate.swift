//
//  ViewControllerDelegate.swift
//  Reference Library
//
//  Created by Denis Bystruev on 20.10.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

protocol ViewControllerDelegate {
    func presentAlert()
    func updateWebView(with html: String)
}

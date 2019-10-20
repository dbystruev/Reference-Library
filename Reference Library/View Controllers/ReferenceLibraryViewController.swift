//
//  ReferenceLibraryViewController.swift
//  Reference Library
//
//  Created by Denis Bystruev on 20.10.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ReferenceLibraryViewController: UIReferenceLibraryViewController {
    // MARK: - Properties
    var delegate: ViewControllerDelegate?
    
    // MARK: - UIViewController Methods
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.presentAlert()
    }
}

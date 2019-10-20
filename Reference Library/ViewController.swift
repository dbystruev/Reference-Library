//
//  ViewController.swift
//  Reference Library
//
//  Created by Denis Bystruev on 20.10.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var button: UIButton!
    
    // MARK: - Properties
    let terms = ["Apple", "Banana", "Pear"]

    // MARK: - UIViewController Methods
    override func viewDidAppear(_ animated: Bool) {
        presentAlert()
    }
    
    // MARK: - Custom Methods
    func presentAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        terms.forEach { term in
            let action = UIAlertAction(title: term, style: .default, handler: { action in
                guard let term = action.title else { return }
                self.button.setTitle(term, for: [])
                self.button.isHidden = false
                self.presentReference(for: term)
            })
            alert.addAction(action)
        }
        
        present(alert, animated: true)
    }
    
    func presentReference(for term: String) {
        if UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: term) {
            let reference = UIReferenceLibraryViewController(term: term)
            present(reference, animated: true)
        }
    }
    
    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        presentAlert()
    }
}


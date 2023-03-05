//
//  ViewController.swift
//  Task2
//
//  Created by Svetun on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstButton = Button(title: "First Button")
    
    var secondButton = Button(title: "Second Button")
    
    lazy var thirdButton: Button = {
        let button = Button(title: "Third Button")
        button.action = { [weak self] in
            self?.present()
        }
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        NSLayoutConstraint.activate(
            [
                firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
                secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 8),
                thirdButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
                thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 8)
                
            ]
        )
    }
    
    func present() {
        let vc = ViewController2()
        vc.modalPresentationStyle = .popover
        
        present(vc, animated: true)
    }
}

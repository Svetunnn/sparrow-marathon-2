//
//  Button.swift
//  Task2
//
//  Created by Svetun on 05.03.2023.
//

import UIKit

class Button: UIButton {
    
    let title: String
    
    var action: (() -> Void)?
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not configured")
    }
    
    var config: UIButton.Configuration {
        var config: Configuration = .filled()
        config.background.cornerRadius = 8
        config.title = title
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.imagePadding = 8
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        
        return config
    }
    
    func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = config
        semanticContentAttribute = .forceRightToLeft
        addTarget(self, action: #selector(pressDown), for: .touchDown)
        addTarget(self, action: #selector(upInside), for: .touchUpInside)
    }
    
    @objc func pressDown() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) })
    }
    
    @objc func upInside() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity
            self.action?()
        })
    }
}

//
//  GRImageView.swift
//  GestureRecognizer
//
//  Created by Brandon Rodriguez on 6/3/22.
//

import UIKit

class GRImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String, color: UIColor) {
        
        self.init(frame: .zero)
        
        image = UIImage(systemName: name)
        layer.shadowColor = color.cgColor
        
    }
    
    private func configure() {
        
        contentMode = .scaleAspectFit

        layer.cornerRadius = 10
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            self.widthAnchor.constraint(equalToConstant: 200),
            self.heightAnchor.constraint(equalToConstant: 200)
        
        ])
        
    }

}

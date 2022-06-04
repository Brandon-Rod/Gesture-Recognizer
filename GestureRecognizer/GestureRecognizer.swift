//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Brandon Rodriguez on 6/3/22.
//

import UIKit

class GestureRecognizer: UIViewController {
    
    let docImageView = GRImageView(name: "doc.fill", color: .systemGreen)
    let trashImageView = GRImageView(name: "trash.fill", color: .systemRed)
    
    var docViewOrigin: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureUI()
        addPanGesture(view: docImageView)
        docViewOrigin = docImageView.frame.origin
        view.bringSubviewToFront(docImageView)
        
    }

    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        
        docImageView.tintColor = .systemGreen
        trashImageView.tintColor = .systemRed
                
    }
    
    private func configureUI() {
        
        view.addSubview(docImageView)
        view.addSubview(trashImageView)
        
        NSLayoutConstraint.activate([
        
            docImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            docImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            
            trashImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            trashImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        
        ])
        
    }
    
    private func addPanGesture(view: UIView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(pan)
        
    }
    
    @objc private func handlePan(sender: UIPanGestureRecognizer) {
        
        let docView = sender.view!
        
        switch sender.state {
            
        case .began, .changed:
            moveView(view: docView, sender: sender)
            
        case .ended:
            if docView.frame.intersects(trashImageView.frame) {
                
                deleteView(view: docView)
                
            } else {
                
                returnViewToOrigin(view: docView)
                
            }
            
        default:
            break
            
        }
        
    }
    
    private func moveView(view: UIView, sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y +  translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
        
    }
    
    private func returnViewToOrigin(view: UIView) {
        
        UIView.animate(withDuration: 0.3) {
            
            view.frame.origin = self.docViewOrigin
            
        }
        
    }
    
    private func deleteView(view: UIView) {
        
        UIView.animate(withDuration: 0.3) {
            
            view.alpha = 0.0
            
        }
        
    }

}


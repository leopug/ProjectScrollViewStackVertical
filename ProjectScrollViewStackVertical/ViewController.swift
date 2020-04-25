//
//  ViewController.swift
//  ProjectScrollViewStackVertical
//
//  Created by Ana Caroline de Souza on 16/04/20.
//  Copyright © 2020 Leo Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView : UIScrollView!
    var stackView : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        view.addSubview(scrollView)
        navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat(5)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            //This is the tricky part, you must set the width of your stack view to be equals the width of scroll view, setting trailling and leading anchor don't do what we expect
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        
        ])
        
        for _ in 1...30 {
            
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Name:"
            label.textAlignment = .center
            let textField = UITextField()
            textField.backgroundColor = .systemGray4
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Enter text here"
            textField.font = UIFont.systemFont(ofSize: 15)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            
            container.addSubview(label)
            container.addSubview(textField)
            stackView.addArrangedSubview(container)
            
            NSLayoutConstraint.activate([
            
                container.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                container.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                container.heightAnchor.constraint(equalToConstant: 50),

                label.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                label.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.25),
                label.heightAnchor.constraint(equalTo: container.heightAnchor),

                textField.leadingAnchor.constraint(equalTo: label.trailingAnchor),
                textField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
                textField.heightAnchor.constraint(equalTo: container.heightAnchor)
                
            ])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        var offset = scrollView.contentOffset.y / 150
        
        if offset > 1 {
            offset = 1
            self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
        } else {
            self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
        }
        
        
    }

}


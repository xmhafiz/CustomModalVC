//
//  ViewController.swift
//  HalfScreenPresentation
//
//  Created by Hafiz on 06/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // Defined UI views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa. Pulvinar etiam non quam lacus suspendisse faucibus interdum posuere. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Eget nullam non nisi est sit amet. Odio pellentesque diam volutpat commodo. Id eu nisl nunc mi ipsum faucibus vitae. "
        return textView
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = view.tintColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textView, spacer, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        // Add action
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    
    func setupView() {
        // cosmetics
        view.backgroundColor = .systemBackground
    }
    
    // Add subviews and set constraints
    func setupConstraints() {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        // Call .activate method to enable the defined constraints
        NSLayoutConstraint.activate([
            // 6. Set containerStackView edges to superview with 24 spacing
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            // 7. Set button height
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // To be updated
    @objc func presentModalController() {
        let vc = CustomModalViewController()
        vc.modalPresentationStyle = .overCurrentContext
        // keep false
        // modal animation will be handled in VC itself
        self.present(vc, animated: false)
    }
}

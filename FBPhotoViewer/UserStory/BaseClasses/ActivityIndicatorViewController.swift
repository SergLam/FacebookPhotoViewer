//
//  ActivityIndicatorViewController.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/5/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class ActivityIndicatorViewController: UIViewController {
    
    private let animationDuration: TimeInterval = 0.3
    
    private let contentView: UIView = UIView()
    private let contentViewBackgroundColor: UIColor = UIColor(white: 0, alpha: 0.7)
    
    private let activityIndicatorContainerView: UIView = UIView()
    private let activityIndicatorContainerBgColor: UIColor = UIColor.systemGray.withAlphaComponent(0.5)
    
    private let activityIndicatorContainerViewSize: CGFloat = 150.0
    
    private let activityIndicatorColor: UIColor = UIColor.systemBackground
    
    private let activityIndicatorStackView: UIStackView = UIStackView()
    private let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    private(set) var activityIndicatorTitleLabel: UILabel = UILabel()
    private let activityIndicatorTitleLabelFont = UIFont.systemFont(ofSize: 18, weight: .medium)
    
    // MARK: - Life cycle
    override func loadView() {
        contentView.frame = UIScreen.main.bounds
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Private functions
    private func setupLayout() {
        contentView.backgroundColor = contentViewBackgroundColor

        view.addSubview(activityIndicatorContainerView)
        activityIndicatorContainerView.center = view.center
        activityIndicatorContainerView.alpha = 0.0
        activityIndicatorContainerView.backgroundColor = activityIndicatorContainerBgColor
        activityIndicatorContainerView.layer.cornerRadius = 16.0
        
        activityIndicatorContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicatorContainerView.widthAnchor.constraint(greaterThanOrEqualToConstant: activityIndicatorContainerViewSize),
            activityIndicatorContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: activityIndicatorContainerViewSize)
        ])
        
        activityIndicatorContainerView.addSubview(activityIndicatorStackView)
        activityIndicatorStackView.axis = .vertical
        activityIndicatorStackView.distribution = .equalCentering
        activityIndicatorStackView.alignment = .center
        activityIndicatorStackView.spacing = 10.0
        
        activityIndicatorStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorStackView.leadingAnchor.constraint(equalTo: activityIndicatorContainerView.leadingAnchor),
            activityIndicatorStackView.trailingAnchor.constraint(equalTo: activityIndicatorContainerView.trailingAnchor),
            activityIndicatorStackView.centerXAnchor.constraint(equalTo: activityIndicatorContainerView.centerXAnchor),
            activityIndicatorStackView.centerYAnchor.constraint(equalTo: activityIndicatorContainerView.centerYAnchor)
        ])
        
        activityIndicatorStackView.addArrangedSubview(activityIndicatorView)
        activityIndicatorView.color = activityIndicatorColor
        
        activityIndicatorStackView.addArrangedSubview(activityIndicatorTitleLabel)
        activityIndicatorTitleLabel.numberOfLines = 0
        activityIndicatorTitleLabel.font = activityIndicatorTitleLabelFont
        activityIndicatorTitleLabel.textAlignment = .center
        activityIndicatorTitleLabel.textColor = activityIndicatorColor
    }
    
}

// MARK: - ProgressShowable
extension ActivityIndicatorViewController: ProgressShowable {
    
    // MARK: - Public functions
    func showProgress(_ title: String?) {
        
        let isTitleLabelHidden: Bool = title == nil || (title?.isEmpty ?? true)
        activityIndicatorTitleLabel.isHidden = isTitleLabelHidden
        activityIndicatorTitleLabel.text = title
        
        UIView.animate(withDuration: animationDuration, animations: { [weak self] in
            
            self?.activityIndicatorContainerView.alpha = 1.0
            self?.activityIndicatorView.startAnimating()
            
        }, completion: { _ in
            
        })
        
    }
    
    func hideProgress(completion: VoidClosure?) {
        
        UIView.animate(withDuration: animationDuration, animations: {  [weak self] in
            
            self?.activityIndicatorContainerView.alpha = 0.0
            
        }, completion: { [weak self] _ in
            
            self?.activityIndicatorView.stopAnimating()
            self?.activityIndicatorTitleLabel.text = nil
            completion?()
        })
    }
    
}

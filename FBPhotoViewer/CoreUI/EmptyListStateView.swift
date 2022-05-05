//
//  EmptyListStateView.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/5/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class EmptyListStateView: UIView {
    
    private lazy var contentContainer: UIStackView = UIStackView()
    private lazy var contentContainerSpacing: CGFloat = LayoutConstants.contentInset
    
    private lazy var titleLabel: UILabel = UILabel()
    
    private lazy var descriptionLabel: UILabel = UILabel()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Public functions
    func update(title: NSAttributedString?, description: NSAttributedString?) {
        
        titleLabel.isHidden = title == nil
        titleLabel.attributedText = title
        
        descriptionLabel.isHidden = description == nil
        descriptionLabel.attributedText = description
    }
    
    // MARK: - Private functions
    private func setup() {
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        addSubview(contentContainer)
        contentContainer.axis = .vertical
        contentContainer.spacing = contentContainerSpacing
        contentContainer.alignment = .center
        
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentContainer.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: LayoutConstants.contentInset),
            contentContainer.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: LayoutConstants.contentInset)
        ])
        
        contentContainer.addArrangedSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        contentContainer.addArrangedSubview(descriptionLabel)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
    
}

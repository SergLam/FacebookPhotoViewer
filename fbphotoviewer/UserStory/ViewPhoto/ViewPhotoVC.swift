//
//  ViewPhotoVC.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ViewPhotoVC: UIViewController {
    
    let contentView = ViewPhotoView()
    let viewModel: ViewPhotoViewModel
    
    init(url: String) {
        viewModel = ViewPhotoViewModel(url: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Localizable.viewPhotoTitle()
        loadPhoto()
    }
    
    private func loadPhoto() {
        contentView.loadPhoto(withURL: viewModel.photoURL)
    }
    
}

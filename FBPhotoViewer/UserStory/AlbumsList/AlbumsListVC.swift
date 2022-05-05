//
//  AlbumsVC.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import AlisterSwift
import PKHUD
import UIKit

final class AlbumsListVC: BaseViewController {
    
    private let contentView = AlbumsView()
    private let viewModel = AlbumsListViewModel()
    private let controller: TableController
    
    // MARK: - Life cycle
    init() {
        controller = TableController(tableView: contentView.tableView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        navigationItem.title = Localizable.albumsListScreenTitle()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Localizable.back(), style: .plain, target: nil, action: nil)
        super.viewDidLoad()
        configureAlister()
        viewModel.delegate = self
        
        showProgress()
        viewModel.loadUserAlbums()
    }
    
    private func configureAlister() {
        controller.configureCells {
            $0.register(cell: AlbumsListCell.self, for: AlbumsListCellViewModel.self)
        }
        controller.selection = { [unowned self] model, _ in
            guard let model = model as? AlbumsListCellViewModel else { return }
            let vc = AlbumPhotosVC(album: model.album)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func displayAlbums() {
        controller.storage.update { [unowned self] updater in
            var models: [AlbumsListCellViewModel] = []
            for album in self.viewModel.albums {
                models.append(AlbumsListCellViewModel(album: album))
            }
            contentView.setEmptyListViewVisibility(isHidden: !self.viewModel.albums.isEmpty)
            updater.add(models)
        }
    }
    
}

// MARK: - AlbumsListViewModelDelegate
extension AlbumsListVC: AlbumsListViewModelDelegate {
    
    func didReceiveError(_ error: Error) {
        executeOnMain { [weak self] in
            guard let `self` = self else { return }
            self.hideProgress()
            self.contentView.setEmptyListViewVisibility(isHidden: !self.viewModel.albums.isEmpty)
            AlertPresenter.showErrorAlert(on: self, error: error.localizedDescription)
        }
    }
    
    func onLoadAlbumsSuccess() {
        executeOnMain { [weak self] in
            guard let `self` = self else { return }
            self.hideProgress()
            self.displayAlbums()
        }
    }
    
}

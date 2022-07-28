//
//  AlbumsVC.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

final class AlbumsListVC: BaseViewController {
    
    private let contentView: AlbumsView = AlbumsView()
    private let viewModel: AlbumsListViewModelProtocol = AlbumsListViewModel()
    private let tableController: AlbumsListTableController
    
    // MARK: - Life cycle
    init() {
        tableController = AlbumsListTableController(tableView: contentView.tableView)
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
        configureNavBar()
        viewModel.delegate = self
        tableController.delegate = self
        showProgress()
        viewModel.loadUserAlbums()
    }
    
    private func configureNavBar() {
        navigationItem.title = Localizable.albumsListScreenTitle()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Localizable.back(), style: .plain, target: nil, action: nil)
    }
    
    private func displayAlbums() {
        var models: [AlbumsListCellViewModel] = []
        for album in self.viewModel.albums {
            models.append(AlbumsListCellViewModel(album: album))
        }
        contentView.setEmptyListViewVisibility(isHidden: !self.viewModel.albums.isEmpty)
        tableController.update(with: models)
    }
}

// MARK: - AlbumsListTableControllerDelegate
extension AlbumsListVC: AlbumsListTableControllerDelegate {
    
    func didSelectCell(_ model: AlbumsListCellViewModel) {
        let vc = AlbumPhotosVC(album: model.album)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didFinishDataSourceUpdates() {
        executeOnMain{ [weak self] in
            self?.contentView.tableView.reloadData()
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

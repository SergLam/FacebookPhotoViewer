//
//  AlbumsVC.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import AlisterSwift
import DZNEmptyDataSet
import PKHUD
import UIKit

final class AlbumsListVC: UIViewController {
    
    let contentView = AlbumsView()
    let viewModel = AlbumsListViewModel()
    let controller: TableController
    
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
        contentView.tableView.emptyDataSetSource = self
        viewModel.delegate = self
        
        HUD.show(.progress)
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
            updater.add(models)
        }
    }
    
}

// MARK: - AlbumsListViewModelDelegate
extension AlbumsListVC: AlbumsListViewModelDelegate {
    
    func didFailToLoadData(_ error: String) {
        HUD.hide { [unowned self] _ in
            AlertPresenter.showErrorAlert(on: self, error: error)
        }
    }
    
    func onLoadAlbumsSuccess() {
        HUD.hide { [unowned self] _ in
            self.displayAlbums()
        }
    }
    
}

// MARK: - DZNEmptyDataSetSource
extension AlbumsListVC: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = Localizable.albumsListEmptyStateTitle()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor.darkGray]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        return attributedString
    }
    
}

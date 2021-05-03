//
//  ReusableView.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

// MARK: - Reusable View
protocol ReusableView: AnyObject {}
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String { return String(describing: self) }
}

// MARK: - Table View
extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}

extension UITableView {

    // MARK: Register table view cell
    func registerCellClass<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func registerCellNib<T: UITableViewCell>(_: T.Type) where T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    // MARK: - Register header footer view
    func registerHeaderFooterClass<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func registerHeaderFooterNib<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) where T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusable<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with idenHeaderFooterViewtifier: \(T.reuseIdentifier)")
        }
        return view
    }

}

// MARK: - Collection view
extension UICollectionViewCell: ReusableView { }
extension UICollectionView {
    
    func registerCellClass<T: UICollectionViewCell>(_: T.Type)  {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func registerCellNib<T: UICollectionViewCell>(_: T.Type) where T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionReusableView: ReusableView { }
extension UICollectionView {
    
    func registerViewClass<T: UICollectionReusableView>(_: T.Type, ofKind: String)  {
        register(T.self, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: T.reuseIdentifier)
    }

    func registerViewNib<T: UICollectionReusableView>(_: T.Type, ofKind: String) where T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueSupplementaryView<T: UICollectionReusableView>(_: T.Type, ofKind: String, for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

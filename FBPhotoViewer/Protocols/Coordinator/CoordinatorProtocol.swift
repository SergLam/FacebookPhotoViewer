//
//  CoordinatorProtocol.swift
//  Facebook-iOS
//
// Created by Serg Liamtsev on 07.28.2022.
// Copyright © 2022 Serg Liamtsev. All rights reserved.

import UIKit

protocol Coordinator: AnyObject {
    
    var id: UUID { get set }
    var type: CoordinatorType { get }
    
    var navigationController: UINavigationController { get set }
    
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    
    func start()
    
    func childDidFinish(_ child: Coordinator)
    
    func finish()
    
    func isEqual(to coordinator: Coordinator) -> Bool
}

// MARK: - Equatable
extension Coordinator {
    
    func isEqual(to coordinator: Coordinator) -> Bool {
        return self.id == coordinator.id && self.type == coordinator.type
    }
}

extension Coordinator where Self: Equatable {
    
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs.id == rhs.id && lhs.type == rhs.type
    }
}

// MARK: - Hashable
extension Coordinator where Self: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(type)
    }
    
}

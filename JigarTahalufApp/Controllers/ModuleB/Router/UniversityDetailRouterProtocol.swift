//
//  UniversityDetailRouterProtocol.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit

/// Universit yDetail Router Protocol
protocol UniversityDetailRouterProtocol {
    
    /// Create University Detail module
    /// - Returns UIViewController: University Detail screen.
    static func createUniversityDetailModule(with university: University) -> UIViewController
    
    /// Dismiss controller
    func dismiss(from view: UniversityDetailViewProtocol)
}

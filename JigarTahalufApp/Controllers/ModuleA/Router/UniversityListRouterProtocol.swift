//
//  UniversityListRouterProtocol.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit

/// University List Router protocol
protocol UniversityListRouterProtocol {
    
    /// Create University List model
    /// - Returns: - View controller of University List
    static func createUniversityListModule() -> UIViewController
    
    /// Route to university Detail
    /// - Parameter view: View
    /// - Parameter university: University
    func routeToUniversityDetail(from view: UniversityListViewProtocol, with university: University)
}

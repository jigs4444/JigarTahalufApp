//
//  UniversityDetailView.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University Detail View Protocol
protocol UniversityDetailViewProtocol: AnyObject {
    
    /// Show University Detail
    /// - Parameter university: University.
    func showUniversityDetail(for university: University)
}

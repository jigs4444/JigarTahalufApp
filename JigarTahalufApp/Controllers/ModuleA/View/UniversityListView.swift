//
//  UniversityListView.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University List View Protocol.
protocol UniversityListViewProtocol: AnyObject {
    
    /// Show University List after getting data from API.
    /// - Parameter universities: Universities.
    func showUnivesitiesList(_ universities: [University])
    
    /// Show Error from API call.
    /// - Parameter error: Error
    func showError(_ error: String)
    
    /// Show Loader
    func showLoader()
    
    /// Hide loader
    func hideLoader()
}

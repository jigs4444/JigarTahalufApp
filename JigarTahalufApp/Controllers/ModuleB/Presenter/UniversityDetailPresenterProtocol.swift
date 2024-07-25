//
//  UniversityDetailPresenterProtocol.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University Detail Presenter Protocol
protocol UniversityDetailPresenterProtocol {
    
    /// View
    var view: UniversityDetailViewProtocol? { get set }
    
    /// Interactor
    var interactor: UniversityDetailInteractorProtocol? { get set }
    
    /// Router
    var router: UniversityDetailRouterProtocol? { get set }
    
    /// University
    var university: University? { get set }
    
    /// Did load
    func didLoad()
    
    /// Dismiss
    func dismissController()
}

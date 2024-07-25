//
//  UniversityDetailPresenter.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// Univesity Detail Presenter
final class UniversityDetailPresenter: UniversityDetailPresenterProtocol {
    
    //MARK: Protocol data
    weak var view: UniversityDetailViewProtocol?
    var interactor: UniversityDetailInteractorProtocol?
    var router: UniversityDetailRouterProtocol?
    var university: University?
    
    //MARK: Protocol implementation.
    func didLoad() {
        if let university = university {
            view?.showUniversityDetail(for: university)
        }
    }
    
    func dismissController() {
        router?.dismiss(from: view!)
    }
}

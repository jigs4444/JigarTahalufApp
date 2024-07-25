//
//  UniversityListPresenter.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University List Presenter
final class UniversityListPresenter: UniversityListPresenterProtocol {
    
    //MARK: Public variables.
    weak var view: UniversityListViewProtocol?
    var interactor: UniversityListInteractorProtocol?
    var router: UniversityListRouterProtocol?
    
    //MARK: Protocol methods.
    
    func didLoad(country: String) {
        view?.showLoader()
        interactor?.fetchUniversities(country: country)
    }
    
    func didSelectUniversity(_ university: University) {
        router?.routeToUniversityDetail(from: view!, with: university)
    }
}

//MARK: UniversityListInteractorOutputProtocol Implementation.
extension UniversityListPresenter: UniversityListInteractorOutputProtocol {
    func didGetUniversitiesData(_ universities: [University]) {
        view?.showUnivesitiesList(universities)
    }
    
    func didFailToGetUniversitiesData(error: String) {
        view?.showError(error)
    }
}

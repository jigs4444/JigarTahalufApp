//
//  UniversityListRouter.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit

/// University List Router
final class UniversityListRouter: UniversityListRouterProtocol {
    
    //MARK: Protocol Implementation
    
    static func createUniversityListModule() -> UIViewController {
        let viewController = UniversityListViewController(nibName: "UniversityListViewController", bundle: nil)
        let presenter: UniversityListPresenter = UniversityListPresenter()
        let interactor: UniversityListInteractor = UniversityListInteractor()
        let router: UniversityListRouterProtocol = UniversityListRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
    
    func routeToUniversityDetail(from view: UniversityListViewProtocol, with university: University) {
        let detailViewController = UniversityDetailRouter.createUniversityDetailModule(with: university) as! UniversityDetailViewController
        if let sourceView = view as? UniversityListViewController {
            detailViewController.delegate = sourceView
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}

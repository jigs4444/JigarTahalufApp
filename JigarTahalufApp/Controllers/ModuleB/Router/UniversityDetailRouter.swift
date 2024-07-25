//
//  UniversityDetailRouter.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit

/// University Detail Router
final class UniversityDetailRouter: UniversityDetailRouterProtocol {
    
    //MARK: Protocol Implementation
    static func createUniversityDetailModule(with university: University) -> UIViewController {
        let viewController = UniversityDetailViewController(nibName: "UniversityDetailViewController", bundle: nil)
        let presenter: UniversityDetailPresenter = UniversityDetailPresenter()
        let interactor: UniversityDetailInteractor = UniversityDetailInteractor()
        let router: UniversityDetailRouter = UniversityDetailRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.university = university
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
    
    func dismiss(from view: UniversityDetailViewProtocol) {
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.popViewController(animated: true)
        }
    }
}

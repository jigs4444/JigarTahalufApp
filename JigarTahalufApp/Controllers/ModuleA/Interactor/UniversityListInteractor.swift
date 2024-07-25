//
//  UniversityListInteractor.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation
import RealmSwift

/// University List Interactor.
final class UniversityListInteractor: UniversityListInteractorProtocol {
    
    //MARK: Variables
    weak var presenter: UniversityListInteractorOutputProtocol?
    var service: UniversityListService = UniversityListService()
    private let realm = try! Realm()
    
    //MARK: Protocol methods.
    
    func fetchUniversities(country: String) {
        service.getUniversitiesList(country: country) { [weak self] result in
            switch result {
            case .success(let universities):
                DispatchQueue.main.async {
                    self?.saveUniversitiesToRealm(universities)
                }
                self?.presenter?.didGetUniversitiesData(universities)
            case .failure(let error):
                DispatchQueue.main.async {
                    if let cachedUniversities = self?.loadUniversitiesFromRealm() {
                        self?.presenter?.didGetUniversitiesData(cachedUniversities)
                    } else {
                        self?.presenter?.didFailToGetUniversitiesData(error: error.localizedDescription)
                    }
                }
            }
        }
    }
    
    //MARK: Private methods
    
    /// Save universities data to realm
    /// - Parameters universities: Universities
    private func saveUniversitiesToRealm(_ universities: [University]) {
         try! realm.write {
             realm.delete(realm.objects(UniversityRealmModel.self))
             for university in universities {
                 let realmModel = UniversityRealmModel(university: university)
                 realm.add(realmModel)
             }
         }
     }

    /// Load universities data from Realm
    /// Returns:- Universities array.
     private func loadUniversitiesFromRealm() -> [University]? {
         let realmModels = realm.objects(UniversityRealmModel.self)
         return realmModels.isEmpty ? nil : realmModels.map { University(realmModel: $0) }
     }
}

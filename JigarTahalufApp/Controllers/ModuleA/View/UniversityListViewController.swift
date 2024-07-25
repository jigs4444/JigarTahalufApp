//
//  UniversityListViewController.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit

/// University List View controller.
final class UniversityListViewController: UIViewController {
    
    // MARK: - Private variables
    
    private struct LayoutConstants {
        static let country = "United Arab Emirates"
        static let title = "Universities"
        static let cellID = "UniversityListCell"
        static let errorTitle = "Error"
        static let errorOKTitle = "OK"
    }
    
    private var universities: [University] = []
    
    // MARK: - Public variables
    var presenter: UniversityListPresenterProtocol?
    
    // MARK: - Private outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNavigation()
    }
    
    // MARK: - Private methods
    
    /// Setup Navigation
    private func setupNavigation() {
        self.title = LayoutConstants.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    /// Setup UI for Controller
    private func setupUI() {
        tableView.register(UINib(nibName:LayoutConstants.cellID, bundle: nil), 
                           forCellReuseIdentifier: LayoutConstants.cellID)
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.didLoad(country: LayoutConstants.country)
    }
}

// MARK: - UniversityListViewProtocol implementation
extension UniversityListViewController: UniversityListViewProtocol {
    func showUnivesitiesList(_ universities: [University]) {
        self.universities = universities
        DispatchQueue.main.async {
            self.hideLoader()
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: String) {
        DispatchQueue.main.async {
            self.hideLoader()
            let alert = UIAlertController(title: LayoutConstants.errorTitle, message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: LayoutConstants.errorOKTitle, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
}

// MARK: - UITableViewDataSource implementation
extension UniversityListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UniversityListCell = tableView.dequeueReusableCell(withIdentifier: LayoutConstants.cellID, for: indexPath) as? UniversityListCell else {
            return UITableViewCell()
        }
        cell.setup(university: universities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
}

// MARK: - UITableViewDelegate implementation
extension UniversityListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUniversity = universities[indexPath.row]
        presenter?.didSelectUniversity(selectedUniversity)
    }
}

extension UniversityListViewController: UniversityDetailDelegate {
    func didRefresh() {
        
        presenter?.didLoad(country: LayoutConstants.country)
    }
}

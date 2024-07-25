//
//  UniversityDetailViewController.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit


protocol UniversityDetailDelegate: AnyObject {
    func didRefresh()
}
/// University Detail View Controller
final class UniversityDetailViewController: UIViewController {

    //MARK: Private outlets
    @IBOutlet private weak var universityNameLabel: UILabel!
    @IBOutlet private weak var universityStateLabel: UILabel!
    @IBOutlet private weak var universityCountryLabel: UILabel!
    @IBOutlet private weak var universityCountryCodeLabel: UILabel!
    @IBOutlet private weak var universityWebURLLabel: UILabel!
    
    //MARK: Public variables
    var presenter: UniversityDetailPresenterProtocol?
    weak var delegate: UniversityDetailDelegate?
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
        self.addRefreshButton()
    }
    
    private func addRefreshButton() {
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonTapped))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    @objc private func refreshButtonTapped() {
        delegate?.didRefresh()
        presenter?.dismissController()
    }
}

//MARK: UniversityDetailViewProtocol Implementation
extension UniversityDetailViewController: UniversityDetailViewProtocol {
    func showUniversityDetail(for university: University) {
        self.universityNameLabel.text = university.name ?? " - "
        self.universityStateLabel.text = university.state ?? " - "
        self.universityCountryLabel.text = university.country ?? " - "
        self.universityWebURLLabel.text = university.webPages?.first ?? " - "
        self.universityCountryCodeLabel.text = university.alphaCode ?? " - "
    }
}

//
//  UniversityListCell.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import UIKit

/// University List Cell
final class UniversityListCell: UITableViewCell {
    
    // MARK: - Private outlets
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Cell Lifecycle methods.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public methods.
    
    /// Setup University cell
    /// - Parameter university: University
    func setup(university: University) {
        self.universityNameLabel.text = university.name
        self.universityStateLabel.text = university.state
    }
    
    // MARK: Action methods.

    @IBAction func didTapNextButton(_ sender: UIButton) {
      // Route if required from button only.
    }
}

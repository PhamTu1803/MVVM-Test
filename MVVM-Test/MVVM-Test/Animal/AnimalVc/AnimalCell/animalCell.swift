//
//  animalCell.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

class animalCell: UITableViewCell {

    @IBOutlet weak var nameanimals: UILabel!
    @IBOutlet weak var imganimals: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(animal: animal) {
        nameanimals.text = animal.name
        if let image = UIImage(named: animal.image) {
            imganimals.image = image
            imganimals.setImageColor(color: UIColor.random())
        }
}
}

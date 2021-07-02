//
//  githubTableViewCell.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

class githubTableViewCell: UITableViewCell {

    @IBOutlet weak var respoLinkLb: UILabel!
    @IBOutlet weak var respoNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(data: GithubSearchItem) {
        respoNameLb.text = data.name
        respoLinkLb.text = data.htmlURL
    }
}

//
//  ItemTableViewCell.swift
//  Qreader
//
//  Copyright (c) 2015 gomi. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    var item: Item?

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemCreatedDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setItem(item: Item) {
        self.item = item
        itemTitleLabel.text = item.title
        itemCreatedDateLabel.text = item.updatedAt
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

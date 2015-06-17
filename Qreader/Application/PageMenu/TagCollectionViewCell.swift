//
//  TagCollectionViewCell.swift
//  Qreader
//
//  Copyright (c) 2015 gomi. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    var tagItem: Tag?
    @IBOutlet weak var titleLabel: UILabel!
    
    func setTag(tag: Tag) {
        self.tagItem = tag
        titleLabel.text = tag.id
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  CBPlaylistCollectionViewCell.swift
//  Collab
//
//  Created by Casey Feldman on 9/3/16.
//  Copyright © 2016 Exception Mark Inc. All rights reserved.
//

import UIKit

class CBPlaylistCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var playlistCoverArtwork: UIImageView!
    @IBOutlet weak var collaborator: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        titleLabel.textColor = UIColor.white
        descriptionLabel.textColor = UIColor.white
    }
}

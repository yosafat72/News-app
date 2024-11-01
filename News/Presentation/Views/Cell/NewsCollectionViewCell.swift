//
//  NewsCollectionViewCell.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCardView(cardView)
    }
    
    func setupCardView(_ view: UIView) {
        // Rounded corners
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false

        // Shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4

        // Optional: Border
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
    }

}

//
//  InstrumentKindsCollectionViewCell.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/23.
//

import UIKit

class InstrumentKindsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "InstrumentKindsCell"
    
    @IBOutlet var instrument: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

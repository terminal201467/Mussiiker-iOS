//
//  TeachersCollectionViewCell.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/15.
//

import UIKit

class TeachersCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TeachersCell"
    
    @IBOutlet var teacherPhoto: UIImageView!
    
    @IBOutlet var teacherName: UILabel!
    
    @IBOutlet var professionInstrument: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

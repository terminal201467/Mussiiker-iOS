//
//  MoreTeacherTableViewCell.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/21.
//

import UIKit

class MoreTeacherTableViewCell: UITableViewCell {
    
    @IBOutlet var teacherPhoto: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var professional: UILabel!
    
    @IBOutlet var gender: UILabel!
    
    @IBOutlet var location: UILabel!
    
    @IBOutlet var teachExperience: UILabel!
    
    @IBOutlet var moreDetail: UIButton!
    
    @IBOutlet var collect: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setCollect() {
        
    }
    
    private func setTeacherPhoto() {
        
    }
    
}

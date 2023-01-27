//
//  TeacherCollectionViewCell.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/23.
//

import UIKit

class TeacherCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TeacherCollectionViewCell"
    
    @IBOutlet var teacherName: UILabel!
    
    @IBOutlet var teacherPhoto: UIImageView!
    
    @IBOutlet var professionalInstrument: UILabel!
    
    @IBOutlet var location: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(by teacher: Teacher) {
        teacherName.text = teacher.basicData.name
        teacherPhoto.image = UIImage(named: teacher.basicData.photo[0])
        professionalInstrument.text = teacher.basicData.professional.first
        location.text = teacher.teachingStyle.hopeTeachingArea.map{$0.areaString}.joined(separator: ",")
    }

}

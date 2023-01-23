//
//  MoreTeacherTableViewCell.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/21.
//

import UIKit

class MoreTeacherTableViewCell: UITableViewCell {
    
    static let identifier: String = "MoreTeacherCell"
    
    var toMoreDetail: (() -> (Void))?
    
    var collectTeacher: (() -> (Void))?
    
    @IBOutlet private var teacherPhoto: UIImageView!
    
    @IBOutlet private var name: UILabel!
    
    @IBOutlet private var professional: UILabel!
    
    @IBOutlet private var gender: UILabel!
    
    @IBOutlet private var location: UILabel!
    
    @IBOutlet private var teachExperience: UILabel!
    
    @IBOutlet private var moreDetail: UIButton!
    
    @IBOutlet private var collect: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCollect()
        setTeacherPhoto()
        setMoreDetailButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setCollect() {
        let collectGesture = UIGestureRecognizer(target: self, action: #selector(toCollect))
        collect.addGestureRecognizer(collectGesture)
    }
    
    private func setTeacherPhoto() {
        let toMoreTeacherDetailGesture = UIGestureRecognizer(target: self, action: #selector(toMoreTeacherDetail))
        teacherPhoto.addGestureRecognizer(toMoreTeacherDetailGesture)
    }
    
    private func setMoreDetailButton() {
        moreDetail.setTitle("moreDetailInfo".localized, for: .normal)
        moreDetail.addTarget(self, action: #selector(toMoreTeacherDetail), for: .touchDown)
    }
    
    public func configure(_ teacher: Teacher) {
        teacherPhoto.image = UIImage(named: teacher.basicData.photo ?? "")
        name.text = teacher.basicData.name
        professional.text = teacher.basicData.profession
        gender.text = teacher.basicData.gender.text
        location.text = teacher.teachingStyle.hopeTeachingLocation.joined(separator: ",")
        teachExperience.text = "\(teacher.teachingHistory.teachingAge)"
    }
    
    @objc func toMoreTeacherDetail() {
        toMoreDetail?()
    }
    
    @objc func toCollect() {
        collectTeacher?()
    }
}

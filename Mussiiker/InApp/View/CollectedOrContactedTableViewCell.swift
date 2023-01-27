//
//  CollectedOrContactedTableViewCell.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/27.
//

import UIKit

class CollectedOrContactedTableViewCell: UITableViewCell {
    
    static let identifier: String = "CollectedOrContacted"
    
    @IBOutlet var teacherPhoto: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var contactedMessage: UILabel!
    
    var theLastContactMessage: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTeacherPhoto() {
        //CornorRadius
    }
    
    func setName() {
        //
    }
    
    func setContactedMessage() {
        
    }
    
    public func configure(info teacher: Teacher) {
        teacherPhoto.image = UIImage(named: teacher.basicData.photo[0])
        name.text = teacher.basicData.name
        contactedMessage.text = theLastContactMessage ?? "已傳送訊息"
    }
    
}

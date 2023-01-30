//
//  TeacherDetailViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/22.
//

import UIKit

class TeacherDetailViewController: UIViewController {
    
    public var teacher: Teacher
    
    var isCollected: Bool = false
    
    var toCollect: (()-> (Void))?
    
    var toContact: (()-> (Void))?
    
    var toEmail: (()-> (Void))?
    
    @IBOutlet private var teacherDetail: UILabel!
    @IBOutlet private var name: UILabel!
    @IBOutlet private var gender: UILabel!
    @IBOutlet private var teacherExperienceAge: UILabel!
    @IBOutlet private var acceptRemoteTeaching: UILabel!
    @IBOutlet private var acceptFreeTeaching: UILabel!
    @IBOutlet private var acceptLearnerGender: UILabel!
    @IBOutlet private var hopeTeachingArea: UILabel!
    
    @IBOutlet private var teachingReason: UILabel!
    @IBOutlet private var teachingType: UILabel!
    
    @IBOutlet private var toTeachSkillVideo: UIButton!
    
    @IBOutlet private var professional: UILabel!
    @IBOutlet private var professionItems: UICollectionView!
    
    @IBOutlet private var collectTeacher: UIButton!
    @IBOutlet private var contactTeacher: UIButton!
    @IBOutlet private var emailTeacher: UIButton!
    
    //MARK: -CollecionViews
    @IBOutlet private var teacherPhotoPageContainerView: TeacherPhotoPageContainerView!
    
    init(by teacher: Teacher) {
        self.teacher = teacher
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfessionItems()
        setTeachDetail()
        configure(by: self.teacher)

        // Do any additional setup after loading the view.
    }
    
    private func setTeachDetail() {
        teacherDetail.text = "teacherInfo".localized
    }
    
    private func setProfessionItems() {
        professionItems.delegate = self
        professionItems.dataSource = self
    }
    
    private func setCollectedButtonTitle() -> String {
        return isCollected ? "collected".localized : "uncollected".localized
    }
    
    private func setButtons() {
        collectTeacher.setTitle(setCollectedButtonTitle(), for: .normal)
        collectTeacher.addTarget(self, action: #selector(toCollectAction), for: .touchDown)
        contactTeacher.addTarget(self, action: #selector(toContactAction), for: .touchDown)
        emailTeacher.addTarget(self, action: #selector(toEmailAction), for: .touchDown)
    }
    
    private func setTeachingAge(with isHadExperience: Bool)-> String {
        return isHadExperience ? "\(teacher.teachingHistory.isHadTeachingExperience)" + "，" + "\(teacher.teachingHistory.teachingAge)年教學經驗" : "無經驗"
    }
    
    private func configure(by teacher:Teacher) {
        name.text = teacher.basicData.name
        gender.text = teacher.basicData.gender.text
        teacherExperienceAge.text = setTeachingAge(with: teacher.teachingHistory.isHadTeachingExperience)
        acceptRemoteTeaching.text = teacher.teachingStyle.acceptRemoteTeachingString
        acceptFreeTeaching.text = teacher.teachingStyle.acceptFreeTeachingString
        acceptLearnerGender.text = teacher.teachingStyle.hopeLearnGender.map{$0.text}.joined(separator: ",")
        hopeTeachingArea.text = teacher.teachingStyle.hopeTeachingArea.map({ area in area.areaString }).joined(separator: ",")
        teachingReason.text = teacher.teachingStyle.teachingReason.reasonText
        teachingType.text = teacher.teachingStyle.teachingType.map{$0.type}.joined(separator: ",")
        professional.text = "professionalInstruments".localized
    }
    
    @objc private func toCollectAction() {
        isCollected.toggle()
        toCollect?()
    }
    
    @objc private func toContactAction() {
        toContact?()
    }
    
    @objc private func toEmailAction() {
        toEmail?()
    }
}

extension TeacherDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teacher.basicData.professional.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstrumentKindsCollectionViewCell.identifier, for: indexPath) as! InstrumentKindsCollectionViewCell
        cell.instrument.text = teacher.basicData.professional[indexPath.row]
        return cell
    }
    
}

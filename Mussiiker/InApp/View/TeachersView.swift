//
//  TeachersView.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/15.
//

import UIKit
import SnapKit

class TeachersView: UIView {
    
    private var viewModel: TeacherDataModel!
    
    private let teachersView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 160, height: 160)
        flowLayout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.register(TeachersCollectionViewCell.self, forCellWithReuseIdentifier: TeachersCollectionViewCell.identifier)
        return view
    }()
    
    init(dataType: DataType) {
        self.viewModel = TeacherDataModel(by: dataType)
        super.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViewModel()
        setCollectionView()
        autoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        teachersView.dataSource = self
        teachersView.delegate = self
    }
    
    private func setViewModel() {
        viewModel.loadData()
        viewModel.click = { row in
            print("row:\(row)")
        }
    }
    
    private func autoLayout() {
        teachersView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension TeachersView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeachersCollectionViewCell.identifier, for: indexPath) as! TeachersCollectionViewCell
        cell.teacherPhoto.image = UIImage(named: "")
        cell.teacherName.text = viewModel.cellForItemsAtSection(indexPath).basicData.name
        cell.professionInstruments.text = viewModel.cellForItemsAtSection(indexPath).basicData.profession
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.click?(indexPath.row)
    }
}

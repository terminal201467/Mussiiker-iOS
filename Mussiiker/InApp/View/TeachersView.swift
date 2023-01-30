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
    
    private var dataType: TeacherDataType!
    
    private let teachersView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 300, height: 160)
        flowLayout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.register(TeacherCollectionViewCell.self, forCellWithReuseIdentifier: TeacherCollectionViewCell.identifier)
        view.isPagingEnabled = true
        return view
    }()
    
    init(dataType: TeacherDataType) {
        self.dataType = dataType
        self.viewModel = TeacherDataModel(by: dataType)
        super.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        autoLayout()
//        setViewModel()
        setCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
        autoLayout()
//        setViewModel()
        setCollectionView()
    }
    
    private func setCollectionView() {
        teachersView.dataSource = self
        teachersView.delegate = self
    }
    
    private func setViewModel() {
        viewModel.loadData()
        viewModel.click = { indexPath in
            print("indexPath:\(indexPath)")
        }
    }
    
    private func autoLayout() {
        addSubview(teachersView)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherCollectionViewCell.identifier, for: indexPath) as! TeacherCollectionViewCell
        cell.configure(by: viewModel.cellForItemsAtSection(indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.click?(indexPath)
    }
}

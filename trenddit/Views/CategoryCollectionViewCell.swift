//
//  CategoryCollectionViewCell.swift
//  trenddit
//
//  Created by Clint M on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Category"
        label.numberOfLines = 1
        return label
    }()
    
    let categoryImageView: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .orange
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addSubViews()
        backgroundColor = .cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        setupCollectionImage()
        setupCollectionLabel()
    }
    
    private func addSubViews() {
        addSubview(categoryImageView)
        addSubview(categoryLabel)
    }
    
    private func setupCollectionImage(){
        categoryImageView.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(snp.centerX)
            constraint.top.equalTo(snp.top).offset(5)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
            constraint.height.equalTo(snp.height).multipliedBy(0.65)
        }
    }
    
    private func setupCollectionLabel() {
        categoryLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.centerY.equalTo(categoryImageView)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
        }
    }
    
    // configure cell from viewController
        public func configureCategoryCell(with category: String, and postImage: UIImage) {
            categoryImageView.image = postImage
            categoryLabel.text = category
        }
    
}

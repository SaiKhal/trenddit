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
        label.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6).cgColor
        label.backgroundColor = Stylesheet.Colors.White
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupViews()
        backgroundColor = Stylesheet.Colors.White
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews(){
        setupCollectionLabel()
    }
    
    private func addSubViews() {
        addSubview(categoryLabel)
    }
    
    private func setupCollectionLabel(){
        categoryLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(self)
            constraint.centerY.equalTo(self)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
            constraint.height.equalTo(snp.height)
        }
    }
    
    
    // configure cell from viewController
    public func configureCategoryCell(with postInfo: Post) {
        categoryLabel.text = postInfo.category
        }
    
}

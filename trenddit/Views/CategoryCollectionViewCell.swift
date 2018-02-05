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
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let categoryImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "feedPlaceHolder")
        imageView.backgroundColor = Stylesheet.Colors.UltraLightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2.0
        imageView.layer.cornerRadius = imageView.bounds.width/2.0
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupViews()
        backgroundColor = Stylesheet.Colors.UltraLightGray
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
        
        self.categoryImageView.layer.masksToBounds = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.setCircularImageView()
    }
    
    private func setCircularImageView() {
        self.categoryImageView.layer.cornerRadius = CGFloat(roundf(Float(self.categoryImageView.frame.size.width / 2)))
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
            constraint.centerX.equalTo(self)
            constraint.centerY.equalTo(self)
            constraint.width.equalTo(snp.width)
            constraint.height.equalTo(snp.height)
        }
    }
    
    private func setupCollectionLabel() {
        categoryLabel.snp.makeConstraints { (constraint) in
            constraint.centerX.equalTo(categoryImageView.snp.centerX)
            constraint.centerY.equalTo(categoryImageView.snp.centerY)
            constraint.width.equalTo(snp.width).multipliedBy(0.85)
        }
    }
    
    // configure cell from viewController
        public func configureCategoryCell(with category: String, and postImage: UIImage) {
            categoryImageView.image = postImage
            categoryLabel.text = category
        }
    
}

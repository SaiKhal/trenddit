//
//  LogoView.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class LogoView: UIView {
    lazy var logoImage: UIImageView = {
        let iv = UIImageView()
        //iv.backgroundColor = .orange
        iv.image = UIImage(named: "horn")
        return iv
    }()

    lazy var logoNameLabel: UILabel = {
        let label = UILabel()
        label.text = "TRENDDIT"
        label.font = UIFont(name: Stylesheet.Fonts.Light, size: 35)//28
        return label
    }()

    lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Have an opinion? Share it, on Trenddit!"
        label.font = UIFont(name: Stylesheet.Fonts.Thin, size: 18)
        return label
    }()

    // Init
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func commonInit() {
        self.backgroundColor = Stylesheet.Colors.Blue
        setupLogoNameLabel()
        setupLogoImage()
        setupCaptionLabel()
    }

    private func setupLogoNameLabel() {
        self.addSubview(logoNameLabel)
        logoNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(50)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

    private func setupLogoImage() {
        self.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(logoNameLabel.snp.bottom).offset(30)
            make.size.equalTo(self.snp.width).multipliedBy(0.4)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

    private func setupCaptionLabel() {
        self.addSubview(captionLabel)
        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(30)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
}

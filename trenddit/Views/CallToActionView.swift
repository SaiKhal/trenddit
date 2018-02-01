//
//  CallToActionView.swift
//  trenddit
//
//  Created by Masai Young on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CallToActionView: UIView {
    // Init
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init(coder: NSCoder) {
        fatalError()
    }

    init(labelText: String, buttonText: String) {
        super.init(frame: UIScreen.main.bounds)
        callToActionLabel.text = labelText
        callToActionButton.setTitle(buttonText, for: .normal)
    }

    private func commonInit() {
        self.addSubview(callToActionStack)
    }

    lazy var callToActionLabel: UILabel = {
        let label = UILabel()
//        label.text = "DON'T HAVE AN ACCOUNT?"
        return label
    }()

    lazy var callToActionButton: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = .white
//        bttn.setTitle("SIGN UP", for: .normal)
        bttn.setTitleColor(.orange, for: .normal)
        return bttn
    }()

    lazy var callToActionStack: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [callToActionLabel, callToActionButton])
        stackview.alignment = .center
        stackview.axis = .horizontal
        stackview.spacing = 5
        return stackview
    }()
}

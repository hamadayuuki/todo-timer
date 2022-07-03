//
//  TimerLabel.swift
//  TodoTimer
//
//  Created by 濵田　悠樹 on 2022/07/03.
//

import UIKit
import SnapKit

class TimerLabel: UILabel {
    init(text: String = "", textColor: UIColor, size: CGFloat, frameSize: CGSize, backgroundColor: CGColor) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = UIFont(name: "DINAlternate-Bold", size: size)
        self.textColor = textColor
        
        self.textAlignment = .center
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.backgroundColor = backgroundColor
        
        self.snp.makeConstraints { make -> Void in
            make.width.equalTo(frameSize.width)
            make.height.equalTo(frameSize.height)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

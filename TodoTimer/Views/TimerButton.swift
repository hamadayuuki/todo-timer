//
//  TimerButton.swift
//  TodoTimer
//
//  Created by 濵田　悠樹 on 2022/07/03.
//

import UIKit
import SnapKit

class TimerButton: UIButton {
    init(text: String, textSize: CGFloat, frameSize: CGSize, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.white.cgColor
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont(name: "DINAlternate-Bold", size: textSize)
        self.setTitleColor(.white, for: .normal)
        
        self.snp.makeConstraints { make -> Void in
            make.width.equalTo(frameSize.width)
            make.height.equalTo(frameSize.height)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                // ボタンのアニメーション
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                    self.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
                }) { (_) in
                    //             ↓ アニメーション時間  ↓ 待機時間  ↓ バネのような動き 振幅の大きさ(0~1)   ↓ 初速                 ↓ 追加機能
                    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                        self.transform = .identity
                        
                    }, completion: nil)
                }
            }
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


//
//  TodoLabel.swift
//  TodoTimer
//
//  Created by 濵田　悠樹 on 2022/07/03.
//

import UIKit

class TodoLabel: UILabel {
    init(text: String = "", textColor: UIColor = UIColor.white, size: CGFloat) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = UIFont(name: "DINAlternate-Bold", size: size)
        self.textColor = textColor
        
        self.textAlignment = .center
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

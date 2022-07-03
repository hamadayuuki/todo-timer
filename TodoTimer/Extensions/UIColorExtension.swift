//
//  UIColorExtension.swift
//  TodoTimer
//
//  Created by 濵田　悠樹 on 2022/07/03.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hex = hex   // 引数をvar型変換するため
        if let index = hex.range(of: "#") { hex.removeSubrange(index) }
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}

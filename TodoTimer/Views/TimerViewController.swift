//
//  TimerViewController.swift
//  TodoTimer
//
//  Created by 濵田　悠樹 on 2022/07/03.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class TimerViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var todoLabel: TodoLabel!
    var hourLabel: TimerLabel!
    var minuteLabel: TimerLabel!
    var secondLabel: TimerLabel!
    var startButton: TimerButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(hex: "#060523")
        setupLayout()
        setupBinding()
    }
    
    func setupLayout() {
        var screenSize = self.view.bounds
        
        let textColor = UIColor.init(hex: "#FF9700")
        let textBackgroundColor = UIColor.init(hex: "#171F1A")
        //let textBackgroundColor = UIColor.init(hex: "#060523")
        
        todoLabel = TodoLabel(text: "TIMELAB DB設計", size: 40)
        
        // 時刻表示
        hourLabel = TimerLabel(textColor: textColor,size: 90, frameSize: CGSize(width: screenSize.width * 0.3, height: screenSize.height * 0.15), backgroundColor: textBackgroundColor.cgColor)
        minuteLabel = TimerLabel(textColor: textColor,size: 90, frameSize: CGSize(width: screenSize.width * 0.3, height: screenSize.height * 0.2), backgroundColor: textBackgroundColor.cgColor)
        secondLabel = TimerLabel(textColor: textColor,size: 90, frameSize: CGSize(width: screenSize.width * 0.3, height: screenSize.height * 0.2), backgroundColor: textBackgroundColor.cgColor)
        
        let timerHorizontalView = UIStackView(arrangedSubviews: [hourLabel, minuteLabel, secondLabel])
        timerHorizontalView.axis = .horizontal
        timerHorizontalView.spacing = 10
        
        hourLabel.text   = "00"
        minuteLabel.text = "00"
        secondLabel.text = "00"
        
        // スタートボタン
        startButton = TimerButton(textSize: 30, frameSize: CGSize(width: screenSize.width * 0.5, height: screenSize.height * 0.1), backgroundColor: textBackgroundColor)
        
        view.addSubview(timerHorizontalView)
        timerHorizontalView.snp.makeConstraints { make -> Void in
            make.centerX.equalTo(view.bounds.width * 0.5)
            make.centerY.equalTo(view.bounds.height * 0.5)
        }
        
        view.addSubview(todoLabel)
        todoLabel.snp.makeConstraints { make -> Void in
            make.centerX.equalTo(view.bounds.width * 0.5)
            make.bottom.equalTo(timerHorizontalView.snp.top).offset(-100)
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make -> Void in
            make.centerX.equalTo(view.bounds.width * 0.5)
            make.top.equalTo(timerHorizontalView.snp.bottom).offset(100)
        }
    }
    
    func setupBinding() {
        startButton.rx.tap
            .subscribe { _ in
                self.startButton.isSelected = !self.startButton.isSelected
            }
            .disposed(by: disposeBag)
    }


}

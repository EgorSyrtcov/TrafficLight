//
//  LightView.swift
//  TrafficLight
//
//  Created by Egor Syrtcov on 9/23/19.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit
import SnapKit

enum ColorState {
    case active
    case deactive
}


class LightView: UIView {
    
    
    //new Task
    
    
    
    // new Task2
    
    
    
    // new Task3
    
    var colorState = ColorState.deactive {
        didSet {
            backgroundColor = color.withAlphaComponent(colorState == .active ? 1 : 0.3)
        }
    }
    
    let color: UIColor
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        backgroundColor = color.withAlphaComponent(0.3)
        layer.cornerRadius = 60
        layer.borderWidth = 3
    }
}

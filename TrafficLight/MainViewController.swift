//
//  ViewController.swift
//  TrafficLight
//
//  Created by Egor Syrtcov on 9/23/19.
//  Copyright © 2019 Egor Syrtcov. All rights reserved.
//

import UIKit

enum CurrentLight {
    case none
    case red
    case yellow
    case green

    func nextState() -> CurrentLight {
        switch self {
        case .none:
            return .red
        case .red:
            return .yellow
        case .yellow:
            return .green
        case .green:
            return .red
        }
    }

}


final class MainViewController: UIViewController {
    
    
    var currentLight = CurrentLight.none {
        didSet {
            changeLight()
        }
    }

    private let redView = LightView(color: .red)
    private let yellowView = LightView(color: .yellow)
    private let greenView = LightView(color: .green)

    private let mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.setTitle("GO", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Светофор"
        assembel()
    }
    
    @objc func buttonAction() {
        currentLight = currentLight.nextState()
    }
    
    private func changeLight() {
        redView.colorState = currentLight == .red ? .active : .deactive
        yellowView.colorState = currentLight == .yellow ? .active : .deactive
        greenView.colorState = currentLight == .green ? .active : .deactive
    }
    
    private func assembel() {
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(mainButton)
        
        setupLayout()
    }
    
    private func setupLayout() {
        redView.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        yellowView.snp.makeConstraints { (make) in
            make.top.equalTo(redView.snp.bottom)
            make.left.equalTo(redView)
        }
        greenView.snp.makeConstraints { (make) in
            make.top.equalTo(yellowView.snp.bottom)
            make.left.equalTo(yellowView)
        }
        mainButton.snp.makeConstraints { (make) in
            make.top.equalTo(greenView.snp.bottom).offset(30)
            make.size.equalTo(CGSize(width: 200, height: 50))
            make.centerX.equalToSuperview()
        }
    }
}



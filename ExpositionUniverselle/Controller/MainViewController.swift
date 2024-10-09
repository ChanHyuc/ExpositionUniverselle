//
//  ViewController.swift
//  ExpositionUniverselle
//
//  Created by ChanHyuc on 10/1/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel = {
        let label = UILabel()
        return label
    }()
    
    private let visitorsLabel = {
        let label = UILabel()
        label.text = "방문객: "
        return label
    }()
    
    private let locationLabel = {
        let label = UILabel()
        label.text = "개최지: "
        return label
    }()
    
    private let durationLabel = {
        let label = UILabel()
        label.text = "개최기간: "
        return label
    }()
    
    private let descriptionLabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
        
    }

}

//
//  ViewController.swift
//  ExpositionUniverselle
//
//  Created by ChanHyuc on 10/1/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private func dataSet() {
        let decoder = JSONDecoder()
        if let dataAsset = NSDataAsset(name: "exposition_universelle_1900") {
            do {
                let myData = try decoder.decode(ExpoInfo.self, from: dataAsset.data)
                print("디코딩 성공: \(myData)")
            } catch {
                print("디코딩 실패: \(error)")
            }
        } else {
            print("Data Asset을 찾을 수 없음")
        }
    }
    
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
    
    private let entryDetailViewControllerButton = {
        let button = UIButton(type: .system)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dataSet()
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
        
    }

}

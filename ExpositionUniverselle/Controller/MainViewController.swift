import UIKit

class MainViewController: UIViewController {
    private var expoInfo: ExpoInfo? {
        didSet {
            titleLabel.text = expoInfo?.title
            visitorsLabel.text = String(expoInfo?.visitors ?? 0)
            locationLabel.text = expoInfo?.location
            durationLabel.text = expoInfo?.duration
            descriptionLabel.text = expoInfo?.description
        }
    }
    
    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let visitorsLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
    
    private func dataSet() {
        let decoder = JSONDecoder()
        if let dataAsset = NSDataAsset(name: "exposition_universelle_1900") {
            do {
                expoInfo = try decoder.decode(ExpoInfo.self, from: dataAsset.data)
            } catch {

            }
        }
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(visitorsLabel)
        scrollView.addSubview(locationLabel)
        scrollView.addSubview(durationLabel)
        scrollView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            visitorsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            visitorsLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 10),
            locationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            durationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

}

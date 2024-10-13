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
    
    private lazy var titleLabel = makeLabel()
    private lazy var visitorsLabel = makeLabel()
    private lazy var locationLabel = makeLabel()
    private lazy var durationLabel = makeLabel()
    private lazy var descriptionLabel = makeLabel()
    
    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let entryDetailViewControllerButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.addTarget(self, action: #selector(didTapEntryDetailViewControllerButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapEntryDetailViewControllerButton() {
        navigationController?.pushViewController(EntryDetailViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dataSet()
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
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
        scrollView.addSubview(entryDetailViewControllerButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
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
            descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            entryDetailViewControllerButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            entryDetailViewControllerButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            entryDetailViewControllerButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
    }

}

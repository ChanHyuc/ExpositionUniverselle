import UIKit

class EntryDetailViewController: UIViewController {
    private var entryInfo: EntryInfo? {
        didSet {
            title = entryInfo?.name
            entryImageView.image = UIImage(named: entryInfo?.image_name ?? "")
            decsLabel.text = entryInfo?.desc
        }
    }
    
    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let entryImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let decsLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureCell(name: String, decs: String, image: String) {
        navigationItem.title = name
        decsLabel.text = decs
        entryImageView.image = UIImage(named: image)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(entryImageView)
        scrollView.addSubview(decsLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            entryImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            entryImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entryImageView.widthAnchor.constraint(equalToConstant: 150),
            entryImageView.heightAnchor.constraint(equalToConstant: 150),
            
            decsLabel.topAnchor.constraint(equalTo: entryImageView.bottomAnchor, constant: 30),
            decsLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            decsLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            decsLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

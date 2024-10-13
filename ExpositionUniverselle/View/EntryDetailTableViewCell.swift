import UIKit

class EntryDetailTableViewCell: UITableViewCell {
    private lazy var nameLabel = makeLabel(fontSize: 20)
    private lazy var shortDescLabel = makeLabel(fontSize: 10)
    
    private let entryimageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let stackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(shortDescLabel)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(name: String, shortDesc: String, image: String) {
        nameLabel.text = name
        shortDescLabel.text = shortDesc
        entryimageView.image = UIImage(named: image)
    }
    
    private func makeLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        return label
    }
    
    private func configureUI() {
        addSubview(stackView)
        addSubview(entryimageView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: entryimageView.trailingAnchor),
            entryimageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            entryimageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            entryimageView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
}

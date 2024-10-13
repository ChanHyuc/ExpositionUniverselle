import UIKit

class EntryDetailViewController: UIViewController {
    private let entryDetailTableViewCell = "cell"
    private let tableViewCell = EntryDetailTableViewCell()
    private var entryInfo: [EntryInfo] = []
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dataSet()
        tableView.dataSource = self
        tableView.register(EntryDetailTableViewCell.self, forCellReuseIdentifier: entryDetailTableViewCell)
    }
    
    private func dataSet() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else{
            print("Error")
            return
        }

        do {
            entryInfo = try decoder.decode([EntryInfo].self, from: dataAsset.data)
        } catch {
            
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension EntryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: entryDetailTableViewCell, for: indexPath) as? EntryDetailTableViewCell else {
            return UITableViewCell()
        }
        let entry = entryInfo[indexPath.row]
        cell.configureCell(name: entry.name, shortDesc: entry.short_desc, image: entry.image_name)
        return cell
    }
    
    
}

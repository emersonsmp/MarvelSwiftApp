import UIKit

class HomeScreenView: UIView, ViewCodeProtocol {
    
    let cellReuseIdentifier = "customCell"
    
    let marvelLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "marvel-logo2")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Pesquisar"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MyCustonTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = .red
        return tableView
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let spin = UIActivityIndicatorView(style: .large)
        spin.translatesAutoresizingMaskIntoConstraints = false
        spin.color = .white
        spin.startAnimating()
        return spin
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.addSubview(marvelLogoImageView)
        self.addSubview(self.searchBar)
        self.addSubview(self.tableView)
        tableView.addSubview(UIView())
        self.tableView.addSubview(self.loadingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.marvelLogoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.marvelLogoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.marvelLogoImageView.widthAnchor.constraint(equalToConstant: 150),
            self.marvelLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            self.searchBar.topAnchor.constraint(equalTo: self.marvelLogoImageView.bottomAnchor, constant: 2),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 10),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            loadingView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 200),
            loadingView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func applyAdditionalChanges() {
        
    }
    
    public func showLoadingView() {
        self.loadingView.alpha = 0
        self.loadingView.isHidden = false
        UIView.animate(withDuration: 0.25) {
            self.loadingView.alpha = 1
        }
    }
    
    public func hideLoadingView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingView.alpha = 0
        }, completion: { _ in
            self.loadingView.isHidden = true
        })
    }
    
    public func setupTableViewProtocol(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

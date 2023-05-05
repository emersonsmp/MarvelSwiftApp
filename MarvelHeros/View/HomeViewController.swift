import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    private let cellIdentifier = "customCell"
    private let backButtonTitle = "Voltar"
    
    var screen: HomeScreenView?
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        self.screen = HomeScreenView()
        screen?.searchBar.delegate = self
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.backgroundColor = .red
        self.homeViewModel.delegate(delegate: self)
        self.homeViewModel.fetchAllHeros()
        
        let backButton = UIBarButtonItem(title: backButtonTitle, style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func didSelectHero(_ hero: Character) {
        let detailVC = HeroDetailViewController(character: hero)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyCustonTableViewCell
        cell.setupCell(setup: homeViewModel.loadCurrentHero(indexPath: indexPath))
        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = homeViewModel.loadCurrentHero(indexPath: indexPath)
        didSelectHero(hero)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            self.homeViewModel.fetchAllHeros()
            screen?.tableView.reloadData()
            return
        }
        
        guard let text = searchBar.text else { return }
                
        if text.count > 2 {
            homeViewModel.listaHerois = homeViewModel.listaHerois.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
            screen?.tableView.reloadData()
        }
    }
}

extension HomeViewController: ViewModelDelegate {

    func sucessRequest() {
        self.screen?.setupTableViewProtocol(delegate: self, dataSource: self)
        screen?.tableView.reloadData()
        screen?.hideLoadingView()
    }
    
    func errorRequest() {
        print("Error")
    }
}


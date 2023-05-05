import UIKit

protocol ViewModelDelegate: AnyObject{
    func sucessRequest()
    func errorRequest()
}

class HomeViewModel{
    
    private lazy var marvelservice = MarvelService()
    public var listaHerois: [Character] = []
    
    private weak var delegate: ViewModelDelegate?
    
    public func delegate(delegate:ViewModelDelegate){
        self.delegate = delegate
    }
    
    public func fetchAllHeros(){
        marvelservice.get(endpoint: "/characters") { result in
            switch result {
                case .success(let character):
                    self.listaHerois = character
                    self.delegate?.sucessRequest()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.delegate?.errorRequest()
            }
        }
    }
    
    public var numberOfRows: Int {
        return self.listaHerois.count
    }
    
    public func loadCurrentHero(indexPath:IndexPath) -> Character{
        return listaHerois[indexPath.row]
    }
}

import UIKit

class HeroDetailViewController: UIViewController {
    
    var character: Character
    var screen: HeroDetailScreenView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func loadView() {
        self.screen = HeroDetailScreenView()
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let imageUrl = "\(character.thumbnail.path).\(character.thumbnail.extension)"
        if let url = URL(string: imageUrl) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.screen?.imageView.image = image
                    }
                }
            })
            task.resume()
        }

        self.screen?.nameLabel.text = character.name
        self.screen?.descriptionLabel.text = character.description.isEmpty ?
        "Os heróis da Marvel são personagens com habilidades especiais que lutam contra ameaças que vão desde vilões humanos até seres intergaláticos poderosos." : character.description
    }
}

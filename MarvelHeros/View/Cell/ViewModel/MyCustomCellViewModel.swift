import Foundation
import UIKit

class MyCustomCellViewModel{
    
    private var hero: Character
    private var image: UIImage?
    
    init(hero: Character) {
        self.hero = hero
    }
    
    public func getImage(completion: @escaping (UIImage?) -> Void) {
        let urlComplete = "\(hero.thumbnail.path).\(hero.thumbnail.extension)"
        if let url = URL(string: urlComplete) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = image
                        completion(image)
                    }
                } else {
                    completion(nil)
                }
            })
            task.resume()
        } else {
            completion(nil)
        }
    }
    
    public var getTitle:String {
        return hero.name
    }

    public var getDescription:String {
        
        let description = hero.description.isEmpty ?
        "Os heróis da Marvel são personagens com habilidades especiais que lutam contra ameaças que vão desde vilões humanos até seres intergaláticos poderosos."
        : hero.description
        
        return description
    }
}

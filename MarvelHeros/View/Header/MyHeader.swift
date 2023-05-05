import Foundation
import UIKit

class MyHeader: UITableViewHeaderFooterView, ViewCodeProtocol {
    
    let marvelLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "marvel-logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let redBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildHierarchy()
        setupConstraints()
    }
    
    func buildHierarchy() {
        contentView.addSubview(redBackgroundView)
        contentView.addSubview(marvelLogoImageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            redBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            redBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
            marvelLogoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            marvelLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            marvelLogoImageView.widthAnchor.constraint(equalToConstant: 150),
            marvelLogoImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

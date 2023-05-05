import UIKit

class HeroDetailScreenView: UIView, ViewCodeProtocol {
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.numberOfLines = 0
        name.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        name.textColor = .white
        name.heightAnchor.constraint(equalToConstant: 20).isActive = true
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        description.textColor = .white
        description.textAlignment = .left
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.addSubview(view)
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        configConstraints()
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 200),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),

            descriptionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}

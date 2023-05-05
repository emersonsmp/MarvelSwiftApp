import UIKit

class MyCustonTableViewCell: UITableViewCell, ViewCodeProtocol {
    
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(setup: Character){        
        let viewModel = MyCustomCellViewModel(hero: setup)
        viewModel.getImage(completion: { image in
            if let image = image {
                self.cellImageView.image = image
            } else {
                print("Erro")
            }
        })
        self.titleLabel.text = viewModel.getTitle
        self.descriptionLabel.text = viewModel.getDescription
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildHierarchy()
        setupConstraints()
    }
    
    func buildHierarchy() {
        self.contentView.addSubview(self.cellImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.cellImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.cellImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            self.cellImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.cellImageView.widthAnchor.constraint(equalToConstant: 160),
            self.cellImageView.heightAnchor.constraint(equalToConstant: 160),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.cellImageView.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.cellImageView.trailingAnchor, constant: 8),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            self.descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.cellImageView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

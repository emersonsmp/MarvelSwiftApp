import Foundation

protocol ViewCodeProtocol {

    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewCodeProtocol {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {}
    func setupConstraints() {}
    func applyAdditionalChanges() {}
}

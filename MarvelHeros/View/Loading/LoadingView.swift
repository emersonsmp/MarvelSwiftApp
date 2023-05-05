//
//  LoadingView.swift
//  MarvelHeros
//
//  Created by Emerson Sampaio on 01/03/23.
//

import UIKit

class LoadingView: UIView {

    let activityIndicatorView = UIActivityIndicatorView(style: .large)
        let label = UILabel()
        
        init() {
            super.init(frame: .zero)
            
            backgroundColor = .white
            
            activityIndicatorView.startAnimating()
            addSubview(activityIndicatorView)
            
            label.text = "Carregando..."
            label.textAlignment = .center
            addSubview(label)
            
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
                activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
                label.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 16),
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

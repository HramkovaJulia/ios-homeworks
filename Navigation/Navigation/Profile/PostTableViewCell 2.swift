//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Artyom Prima on 16.09.2022.
//

import UIKit


class PostTableViewCell: UITableViewCell {

    static let identifier = "PostTableViewCell"
    private lazy var labelAuthor: UILabel = {
        let labelAuthor = UILabel()
        labelAuthor.numberOfLines = 2
        labelAuthor.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        labelAuthor.textColor = .black
        labelAuthor.translatesAutoresizingMaskIntoConstraints = false
        return labelAuthor
    }()
    
    private lazy var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        postImage.translatesAutoresizingMaskIntoConstraints = false
        return postImage
    }()
    
    private lazy var postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        return postDescription
    }()
    
    private lazy var numberOfLikes: UILabel = {
        let numberOfLikes = UILabel()
        numberOfLikes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        numberOfLikes.textColor = .black
        numberOfLikes.translatesAutoresizingMaskIntoConstraints = false
        return numberOfLikes
    }()
    
    private lazy var numberOfShows: UILabel = {
        let numberOfShows = UILabel()
        numberOfShows.translatesAutoresizingMaskIntoConstraints = false
        numberOfShows.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        numberOfShows.textColor = .black
        return numberOfShows
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
    
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.clipsToBounds = true

        stackView.addArrangedSubview(numberOfShows)
        stackView.addArrangedSubview(numberOfLikes)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    // MARK: - Private
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    private func setupSubViews() {
        contentView.addSubview(labelAuthor)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            labelAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            labelAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            labelAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            labelAuthor.bottomAnchor.constraint(equalTo: postImage.topAnchor, constant: -12),
          
            postImage.topAnchor.constraint(equalTo: labelAuthor.bottomAnchor, constant: 12),
            postImage.bottomAnchor.constraint(equalTo: postDescription.topAnchor, constant: -12),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 12),
            postDescription.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -12),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
    
    // MARK: - Public
    
    func update(_ model: Post) {
        labelAuthor.text = model.author
        postImage.image = UIImage(named: model.image)
        postDescription.text = model.description
        numberOfLikes.text = String("Likes: \(model.likes)")
        numberOfShows.text = String("View: \(model.views)")
        
    }
}

    
    
    
    


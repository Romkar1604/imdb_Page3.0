//
//  MovieTableViewCell.swift
//  imdb_Page
//
//  Created by Omkar Ranawade on 1/29/26.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    var titleLabel : UILabel?
    var yearLabel : UILabel?
    var popularityScoreLabel : UILabel?
    var posterImageView : UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        ///title label
        titleLabel = UILabel()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel?.textColor = .black
        titleLabel?.textAlignment = .right
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false

        
        /// year label
        yearLabel = UILabel()
        yearLabel?.font = UIFont.systemFont(ofSize: 14)
        yearLabel?.textColor = .black
        yearLabel?.textAlignment = .left
        yearLabel?.translatesAutoresizingMaskIntoConstraints = false

        
        ///popularity score
        popularityScoreLabel = UILabel()
        popularityScoreLabel?.font = UIFont.systemFont(ofSize: 14)
        popularityScoreLabel?.textColor = .black
        popularityScoreLabel?.textAlignment = .left
        popularityScoreLabel?.translatesAutoresizingMaskIntoConstraints = false

        
        /// poster image
        posterImageView = UIImageView()
        posterImageView?.contentMode = .scaleAspectFill
        posterImageView?.clipsToBounds = true
        posterImageView?.translatesAutoresizingMaskIntoConstraints = false
        
        

        
        if let titleLabel = titleLabel, let yearLabel = yearLabel, let popularityScoreLabel = popularityScoreLabel, let posterImageView = posterImageView {
            
            contentView.addSubview(posterImageView)
            contentView.addSubview(popularityScoreLabel)
            contentView.addSubview(yearLabel)
            contentView.addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                
                // Poster
                posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                posterImageView.widthAnchor.constraint(equalToConstant: 80),
                posterImageView.heightAnchor.constraint(equalToConstant: 120),

                // Title
                titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
                titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

                // Year
                yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),

                // Popularity
                popularityScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                popularityScoreLabel.centerYAnchor.constraint(equalTo: yearLabel.centerYAnchor)
            ])
        }
    }
    func configure(movie: Movie) {
        titleLabel?.text = movie.title
        yearLabel?.text = "Release Year: \(movie.releaseYear)"
        popularityScoreLabel?.text = "\(movie.popularityScore)"
        posterImageView?.image = UIImage(named: movie.imageName)
        contentView.backgroundColor = .systemTeal
    }
}

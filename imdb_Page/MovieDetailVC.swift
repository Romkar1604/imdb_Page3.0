//
//  MovieDetailVC.swift
//  imdb_Page
//
//  Created by Omkar Ranawade on 1/29/26.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var titleLabel: UILabel?
    var yearLabel: UILabel?
    var popularityScoreLabel: UILabel?
    var posterImageView: UIImageView?
    var overviewLabel: UILabel?

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        setupUI()
        configureUI()
    }

    func setupUI() {

        // Poster Image
        posterImageView = UIImageView()
        posterImageView?.contentMode = .scaleAspectFill
        posterImageView?.clipsToBounds = true
        posterImageView?.translatesAutoresizingMaskIntoConstraints = false


        // Title
        titleLabel = UILabel()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel?.numberOfLines = 0
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false


        // Year
        yearLabel = UILabel()
        yearLabel?.font = UIFont.systemFont(ofSize: 16)
        yearLabel?.textColor = .darkGray
        yearLabel?.translatesAutoresizingMaskIntoConstraints = false


        // Popularity
        popularityScoreLabel = UILabel()
        popularityScoreLabel?.font = UIFont.systemFont(ofSize: 16)
        popularityScoreLabel?.textColor = .systemBlue
        popularityScoreLabel?.translatesAutoresizingMaskIntoConstraints = false


        // Overview
        overviewLabel = UILabel()
        overviewLabel?.font = UIFont.systemFont(ofSize: 16)
        overviewLabel?.numberOfLines = 0
        overviewLabel?.translatesAutoresizingMaskIntoConstraints = false


        guard let posterImageView = posterImageView, let titleLabel = titleLabel, let yearLabel = yearLabel, let popularityScoreLabel = popularityScoreLabel, let overviewLabel = overviewLabel else { return }
        
        view.addSubview(posterImageView)
        view.addSubview(overviewLabel)
        view.addSubview(popularityScoreLabel)
        view.addSubview(yearLabel)
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([

            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 200),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            popularityScoreLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 8),
            popularityScoreLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            overviewLabel.topAnchor.constraint(equalTo: popularityScoreLabel.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    func configureUI() {
        guard let movie = movie else { return }

        title = movie.title
        posterImageView?.image = UIImage(named: movie.imageName)
        titleLabel?.text = movie.title
        titleLabel?.numberOfLines = 2
        yearLabel?.text = "Release Year: \(movie.releaseYear)"
        popularityScoreLabel?.text = "Popularity: \(movie.popularityScore)"
        overviewLabel?.text = movie.overview
    }
}

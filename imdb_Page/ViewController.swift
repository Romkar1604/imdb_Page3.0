//
//  ViewController.swift
//  imdb_Page
//
//  Created by Omkar Ranawade on 1/26/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    //MARK: Property
    var movieTableView: UITableView?
    
    var movies: [Movie] = [
        Movie(
            title: "Avengers: Endgame",
            overview: "After Thanos recycles all six Infinity Stones, the Mad Titan is decimated and the universe is left in ruins. The Avengers must work together to stop the powerful sorcerer Snap from obtaining the Stone of Eternity, the only way to undo Thanos's actions.",
            popularityScore: 9.9,
            releaseYear: "2019",
            imageName: "avengers-endgame"
        ),
        Movie(
            title: "Spider-Man: No Way Home",
            overview: "After being bitten by a genetically modified spider, Peter Parker must embrace his newfound identity as Spider-Man and stop the villainous Miles Morales from capturing MJ, a young girl with the powers of telekinesis and agility.",
            popularityScore: 8.4,
            releaseYear: "2021",
            imageName: "spider-man-no-way-home"
        ),
        Movie(
            title: "Black Widow",
            overview: "After the death of her father, Tony Stark sends Natasha Romanoff to Wakanda to take her place as the Black Widow, a former spy turned Avenger with a mysterious past.",
            popularityScore: 8.1,
            releaseYear: "2018",
            imageName: "black-widow"
        ),
        Movie(
            title: "Guardians of the Galaxy Vol. 3",
            overview: "The eight Guardians must unite once more to stop the powerful and ruthless Thanos from collecting all six Infinity Stones, the only way to defeat him.",
            popularityScore: 8.0,
            releaseYear: "2017",
            imageName: "guardians-of-the-galaxy-vol-3"
        ),
        Movie(
            title: "Avengers: Infinity War",
            overview: "The Infinity Stones have awakened, and six powerful Thanos have harnessed their power. The Avengers must stop them before they can destroy half of all life in the universe.",
            popularityScore: 7.9,
            releaseYear: "2018",
            imageName: "avengers-infinity-war"
        ),
        Movie(
            title: "Black Panther",
            overview: "T'Challa, the king of Wakanda, embarks on a perilous journey to find the mythical Lost City of Atlantis, rumored to contain the key to restoring balance to the universe.",
            popularityScore: 8.0,
            releaseYear: "2018",
            imageName: "black-panther"
        ),
        Movie(
            title: "The Incredible Hulk",
            overview: "Bitten by a gamma ray, Dr. Bruce Banner gains the extraordinary ability to transform into the fearsome Hulk. Now hunted by the villainous Norman Osborn, the daring scientist must race against time to find a cure before the world is obliterated.",
            popularityScore: 7.8,
            releaseYear: "2008",
            imageName: "the-incredible-hulk"
        ),
        Movie(
            title: "Ant-Man and the Wasp: Quantumania",
            overview: "Peter Quill and Hope van Dyne join forces with the enigmatic and powerful Scott Lang to stop the villainous Ronan the Accuser from acquiring the Quantum Realm, a place that could erase half of all life in the universe.",
            popularityScore: 7.6,
            releaseYear: "2023",
            imageName: "ant-man-and-the-wasp-quantumania"
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemTeal
        
        movieTableView = UITableView()
        movieTableView?.dataSource = self
        movieTableView?.delegate = self
        movieTableView?.translatesAutoresizingMaskIntoConstraints = false
        movieTableView?.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        movieTableView?.rowHeight = 140
        movieTableView?.separatorStyle = .singleLine
        movieTableView?.backgroundColor = .systemTeal
        
        if let mTableView = movieTableView {
            
            view.addSubview(mTableView)
            NSLayoutConstraint.activate([
                mTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                mTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                mTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }


        let movie = movies[indexPath.row]
        cell.configure(movie: movie)
        return cell
    }
    
    //MARK: UITableViewDataDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = MovieDetailViewController()
        detailVC.movie = movies[indexPath.row]

        navigationController?.pushViewController(detailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}



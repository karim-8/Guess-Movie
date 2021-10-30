//
//  ViewController.swift
//  CompleteTheMovieTitle
//
//  Created by Osama Gamal on 25/05/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    let viewModel = MoviesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMoviesData()
        
        movieTitleLabel.text = "The Wolf Of ...."
        movieImageView.image = UIImage(named: "the-wolf-of-wallstreet.jpg")
    }
    
}

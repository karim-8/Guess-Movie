//
//  MoviesViewModel.swift
//  GuessTheMovie
//
//  Created by KarimAhmed on 12/10/2021.
//

import Foundation

struct Request: RequestProtocol {
    let moviesUrl = "https://gist.githubusercontent.com/i0sa/f5b878c5a35386fda952c350fc53fce9/raw/186811752752d29fbf5ee5418065daa689593ff5/complete-movie-title.json"
    var url: URL {
        return URL(string: moviesUrl)!
    }
}

class MoviesViewModel {
    var namesArray: [String] = []
   // var lastWord:
    
    
    func getMoviesData() {
        let url = Request()
        NetworkClient().get(request: url) { result in
            switch result {
            case .success(let movies):
                self.decodeResult(jsonData: movies)
            case .failure(let error):
                print("Error in VM... \(error)")
            }
        }
    }
    
    func decodeResult(jsonData: Data) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let moviesData = try? decoder.decode([Movie].self, from: jsonData)
        if let movie = moviesData {
            getNamesArray(movies: movie)
        }
    }
    
    func getNamesArray(movies: [Movie]) {
        for movieItem in movies {
            namesArray.append(movieItem.name)
        }
    }
    
    //MARK:- Manipulation on movie name
    func hideLastWordName () -> String {
        // ["ka k2 k3"]
        
        return ""
    }
    
    
}

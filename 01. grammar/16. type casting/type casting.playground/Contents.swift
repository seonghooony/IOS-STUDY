import UIKit
import Foundation
import Darwin


//is, as

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name:  name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

//타입추론에 의해 MediaItem 클래스라는걸 예측함
let library = [
    Movie(name: "기생충", director: "봉준호"),
    Song(name: "Butter", artist: "BTS"),
    Movie(name: "올드보이", director: "박찬욱"),
    Song(name: "wonderwall", artist: "Oasis"),
    Song(name: "Rain", artist: "이적")
]


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
        //타입이 MediaItem형태이므로 down casting이 필요함
        //print(item.director)
        //MediaItem 안에 name 프로퍼티가 있기에 출력 가능
        print(item.name)
    }else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

for item in library {
    //item은 MediaItem형태이므로 down casting을 통해 Movie나 Song형태로 변환시킴
    if let movie = item as? Movie {
        print("movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
    
}

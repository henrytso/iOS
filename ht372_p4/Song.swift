//
//  Song.swift
//  ht372_p4
//
//  Created by Mann Public IMac on 3/22/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import UIKit

class Song {
    
    var title: String
    var artists: [String]
    var album: String?
    var image: UIImage!
    
    init(title: String, artists: [String], album: String?, image: UIImage) {
        self.title = title
        self.artists = artists
        self.album = album
        self.image = image
    }
    
}

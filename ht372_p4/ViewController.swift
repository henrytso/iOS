//
//  ViewController.swift
//  ht372_p4
//
//  Created by Mann Public IMac on 3/22/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    var song0: Song!
    var song1: Song!
    var song2: Song!
    var song3: Song!
    var song4: Song!
    var song5: Song!
    var song6: Song!
    var song7: Song!
    var song8: Song!
    var song9: Song!
    
    var playlist: [Song] = []
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sick Beatz"
        view.backgroundColor = .black
        
        let image0 = UIImage(named: "PPAP")
        let image1 = UIImage(named: "bangarang")
        let image2 = UIImage(named: "inspire")
        let image3 = UIImage(named: "more-monsters-and-sprites")
        let image4 = UIImage(named: "all-amerikkkan-badass")
        let image5 = UIImage(named: "growing-up")
        let image6 = UIImage(named: "against-the-sun")
        let image7 = UIImage(named: "reflections")
        let image8 = UIImage(named: "awake")
        let image9 = UIImage(named: "in-return")
        
        song0 = Song(title: "PPAP", artists: ["Pikotaro"], album: nil, image: image0!)
        song1 = Song(title: "Bangarang", artists: ["Skrillex", "Sirah"], album: "Bangarang EP", image: image1!)
        song2 = Song(title: "Night Sky", artists: ["Rameses B"], album: "Inspire", image: image2!)
        song3 = Song(title: "Ruffneck", artists: ["Skrillex"], album: "More Monsters and Sprites EP", image: image3!)
        song4 = Song(title: "TEMPTATION", artists: ["Joey Bada$$"], album: "ALL-AMERIKKKAN BADA$$", image: image4!)
        song5 = Song(title: "Yours Truly (ft. Danyka Nadeau)", artists: ["Mr Fijiwiji", "Danyka Nadeau"], album: "Growing Up EP", image: image5!)
        song6 = Song(title: "Against the Sun (ft. Anna Yvette)", artists: ["Rootkit", "Anna Yvette"], album: nil, image: image6!)
        song7 = Song(title: "Reflections", artists: ["Misterwives"], album: "Reflections", image: image7!)
        song8 = Song(title: "Fractures (ft. Nevve)", artists: ["Illenium", "Nevve"], album: "Awake", image: image8!)
        song9 = Song(title: "Always This Late", artists: ["ODESZA"], album: "In Return", image: image9!)
        
        playlist.append(song0)
        playlist.append(song1)
        playlist.append(song2)
        playlist.append(song3)
        playlist.append(song4)
        playlist.append(song5)
        playlist.append(song6)
        playlist.append(song7)
        playlist.append(song8)
        playlist.append(song9)
        
        tableView = UITableView()
        tableView.bounces = true
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongCell.self, forCellReuseIdentifier: "songCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func updateModel(indexPath: IndexPath, title: String, artists: [String], album: String?, image: UIImage) {
        playlist[indexPath.row].title = title
        playlist[indexPath.row].artists = artists
        playlist[indexPath.row].album = album
        playlist[indexPath.row].image = image
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! SongCell
        cell.titleLabel.text = playlist[indexPath.row].title
        
        let artists = toString(artists: playlist[indexPath.row].artists)
        cell.artistLabel.text = artists
        
        if let album = playlist[indexPath.row].album {
            cell.albumLabel.text = " • \(album)"
        }
        
        cell.albumLabel.text = ""
        
        let img = playlist[indexPath.row].image
        cell.imageBox.image = img
        
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let detailsVC = DetailsViewController()
        detailsVC.indexPath = tableView.indexPathForSelectedRow
        detailsVC.delegate = (tableView.cellForRow(at: indexPath!) as! SaveButtonDelegate)
        detailsVC.modelDelegate = self
        
        // Pass information into details view
        detailsVC.songTitle = playlist[indexPath!.row].title
        detailsVC.artists = playlist[indexPath!.row].artists
        if let album = playlist[indexPath!.row].album {
            detailsVC.album = album
        } else {
            detailsVC.album = ""
        }
        
        detailsVC.image = playlist[tableView.indexPathForSelectedRow!.row].image
        
        navigationController?.pushViewController(detailsVC, animated: true)
        
        tableView.deselectRow(at: indexPath!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            playlist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDetailsSegue" {
//            let indexPath = tableView.indexPathForSelectedRow
//            let detailsVC = segue.destination as! DetailsViewController
//            detailsVC.indexPath = tableView.indexPathForSelectedRow
//            detailsVC.delegate = self
//
//            // Pass information into details view
//            detailsVC.songTitle.text = playlist[indexPath!.row].title
//            detailsVC.artists.text = playlist[indexPath!.row].title
//            if let album = playlist[indexPath!.row].album {
//                detailsVC.album.text = album
//            }
//            detailsVC.album.text = ""
//            detailsVC.imageView.image = playlist[tableView.indexPathForSelectedRow!.row].image
//        }
//    }
    
    func toString(artists: [String]) -> String {
        return artists.joined(separator: ", ")
    }

}


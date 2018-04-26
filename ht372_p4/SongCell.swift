//
//  SongCell.swift
//  ht372_p4
//
//  Created by Mann Public IMac on 3/22/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell, SaveButtonDelegate {

    var titleLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var imageBox: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        
        titleLabel = UILabel()
        artistLabel = UILabel()
        albumLabel = UILabel()
        imageBox = UIImageView()
        
        titleLabel.font = UIFont(name: "Helvetica Neue", size: 24)
        artistLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        albumLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        
        titleLabel.textColor = .lightText
        artistLabel.textColor = .lightText
        albumLabel.textColor = .lightText
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageBox.layer.cornerRadius = 5
        imageBox.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(artistLabel)
        contentView.addSubview(albumLabel)
        contentView.addSubview(imageBox)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            imageBox.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            imageBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            imageBox.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -76),
            imageBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: imageBox.leadingAnchor, constant: -16)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: imageBox.leadingAnchor, constant: -16)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            albumLabel.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 4),
            albumLabel.trailingAnchor.constraint(equalTo: imageBox.leadingAnchor, constant: -16)
            ])
        
        super.updateConstraints()
    }
    
    func saveButtonPressed(indexPath: IndexPath, title: String, artists: String, album: String?, image: UIImage) {
        titleLabel.text = title
        artistLabel.text = artists
        albumLabel.text = album
        imageBox.image = image
    }
    
    func toString(artists: [String]) -> String {
        return artists.joined(separator: ", ")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

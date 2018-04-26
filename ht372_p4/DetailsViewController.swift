//
//  DetailsViewController.swift
//  ht372_p4
//
//  Created by Mann Public IMac on 3/25/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

protocol SaveButtonDelegate {
    func saveButtonPressed(indexPath: IndexPath, title: String, artists: String, album: String?, image: UIImage)
}

protocol ModelDelegate {
    func updateModel(indexPath: IndexPath, title: String, artists: [String], album: String?, image: UIImage)
}

class DetailsViewController: UIViewController {
    
    var indexPath: IndexPath!
    
    var songTitle: String?
    var artists: [String]?
    var album: String?
    var image: UIImage?
    
    var titleField: UITextField!
    var artistsField: UITextField!
    var albumField: UITextField!
    var imageView: UIImageView!
    
    var delegate: SaveButtonDelegate?
    var modelDelegate: ModelDelegate?
    var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField = UITextField()
        titleField.textColor = UIColor.lightGray
        titleField.font = UIFont(name: "Helvetica Neue", size: 24)
        titleField.text = songTitle
        titleField.delegate = self
        titleField.allowsEditingTextAttributes = true
        titleField.translatesAutoresizingMaskIntoConstraints = false
        
        artistsField = UITextField()
        artistsField.textColor = UIColor.lightGray
        artistsField.font = UIFont(name: "Helvetica Neue", size: 18)
        artistsField.text = toString(artists: artists!)
        artistsField.delegate = self
        artistsField.allowsEditingTextAttributes = true
        artistsField.translatesAutoresizingMaskIntoConstraints = false
        
        albumField = UITextField()
        albumField.textColor = UIColor.lightGray
        albumField.font = UIFont(name: "Helvetica Neue", size: 16)
        albumField.text = album
        albumField.delegate = self
        albumField.allowsEditingTextAttributes = true
        albumField.translatesAutoresizingMaskIntoConstraints = false
        
        imageView = UIImageView()
        imageView.image = image
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton = UIButton()
        saveButton.backgroundColor = UIColor(red: 145/255, green: 187/255, blue: 255/255, alpha: 1.0)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 24)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleField)
        view.addSubview(artistsField)
        view.addSubview(albumField)
        view.addSubview(imageView)
        view.addSubview(saveButton)
        
        setupConstraints()
        
    }
    
    @objc func saveButtonPressed(sender: UIButton) {
        delegate?.saveButtonPressed(indexPath: indexPath, title: titleField.text!, artists: artistsField.text!, album: albumField.text!, image: image!)
        modelDelegate?.updateModel(indexPath: indexPath, title: titleField.text!, artists: toArtistsArray(artists: artistsField.text!), album: albumField.text!, image: image!)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 320)
            ])
        
        NSLayoutConstraint.activate([
            titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 48),
            ])
        
        NSLayoutConstraint.activate([
            artistsField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            artistsField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 16),
            artistsField.widthAnchor.constraint(equalToConstant: artistsField.intrinsicContentSize.width)
            ])
        
        NSLayoutConstraint.activate([
            albumField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumField.topAnchor.constraint(equalTo: artistsField.bottomAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            saveButton.widthAnchor.constraint(equalToConstant: saveButton.intrinsicContentSize.width + 36),
            saveButton.heightAnchor.constraint(equalToConstant: saveButton.intrinsicContentSize.height + 16)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toString(artists: [String]) -> String {
        return artists.joined(separator: ", ")
    }
    
    // Pre-condition: Artists should be delimited by commas
    // Currently does not strip extra spaces
    func toArtistsArray(artists: String) -> [String] {
        return artists.components(separatedBy: ",")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleField.endEditing(true)
        artistsField.endEditing(true)
        albumField.endEditing(true)
        return true
    }
}

//
//  ViewController.swift
//  ht372_p5
//
//  Created by Mann Public IMac on 3/29/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var filterBar: UICollectionView!
    var filters: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewLayout()
        
        filterBar = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        filterBar.dataSource = self
        filterBar.delegate = self
        
        filterBar.register(FilterBarCell.self, forCellWithReuseIdentifier: "filterBarCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filterBar.dequeueReusableCell(withReuseIdentifier: "filterBarCell", for: indexPath) as! FilterBarCell
        cell.filterLabel.text = filters[indexPath.item]
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


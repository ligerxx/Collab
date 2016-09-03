//
//  ViewController.swift
//  Collab
//
//  Created by Casey Feldman on 8/29/16.
//  Copyright © 2016 Exception Mark Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var recentlyUpdatedCollectionView: UICollectionView!
    var collectionViewColumns: CGFloat = 2.0
    
    var timer = Timer()
    var imageNumber = 1
    var background = UIImageView(image: UIImage(named:"background1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.backgroundColor = UIColor.clear
        //self.tableView.backgroundColor = UIColor(colorLiteralRed: 247/255, green: 92/255, blue: 99/255, alpha: 1.0)

        self.tableView.backgroundView = background
        self.tableView.separatorColor = UIColor.white
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        
        recentlyUpdatedCollectionView.dataSource = self
        recentlyUpdatedCollectionView.delegate = self
        recentlyUpdatedCollectionView.backgroundColor = UIColor.clear
        
        scheduledTimer(timeInterval: 8)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.tintColor = UIColor.white
        cell.prepareDisclosureIndicator()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        
        header.contentView.backgroundColor = UIColor.clear
        header.backgroundColor = UIColor.clear
        header.tintColor = UIColor.clear
        if section == 0{
            header.textLabel?.text = "Collaborate"
            header.textLabel?.font = UIFont.systemFontOfSize(size: 40, weight: .Heavy)
        }
        else {
            header.textLabel?.text = "Recently Updated"
            header.textLabel?.font = UIFont.systemFontOfSize(size: 32, weight: .Heavy)
        }
        header.textLabel?.textColor = UIColor.white //make the text white
    }
    
    //MARK: Collection View Data
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let screenSizeRect = UIScreen.main.bounds
//        let screenWidth = screenSizeRect.size.width
//        
//        let cellWidth = screenWidth / collectionViewColumns
//        let size = CGSize(width: cellWidth, height: 200.0)
//        
//        return size
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistCollectionViewCell", for: indexPath) as! CBPlaylistCollectionViewCell
        cell.descriptionLabel.text = "2 Songs Added"
        cell.titleLabel.text = "Playlist Title"
        return cell
    }
    
    //MARK: iTunes API Search
    func searchItunesFor(searchTerm: String) {
        
        // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
        let itunesSearchItem = searchTerm.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.caseInsensitive, range: nil)
        
        // Now escape anything else that isn't URL-friendly
//        var escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        let escapedSearchTerm = itunesSearchItem.addingPercentEscapes(using: .utf8)
        let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music"
        let url: URL = URL(string: urlPath)!
        let request: URLRequest = URLRequest(url: url)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        
        print("Search iTunes API at URL \(url)")
        
        connection.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func switchBackground(){
        if imageNumber == 1 {
            imageNumber = 2
        }else{
            imageNumber = 1
        }
        let toImage = UIImage(named:"background\(imageNumber)")
        UIView.transition(with: background,
                                  duration:8,
                                  options: UIViewAnimationOptions.transitionCrossDissolve,
                                  animations: { self.background.image = toImage },
                                  completion: nil)
    }

    func scheduledTimer(timeInterval: Double){
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.switchBackground), userInfo: nil, repeats: true)
    }

}


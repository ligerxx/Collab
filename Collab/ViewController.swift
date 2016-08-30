//
//  ViewController.swift
//  Collab
//
//  Created by Casey Feldman on 8/29/16.
//  Copyright © 2016 Exception Mark Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var timer = Timer()
    var imageNumber = 1
    var background = UIImageView(image: UIImage(named:"background1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.backgroundColor = UIColor.clear
        //self.tableView.backgroundColor = UIColor(colorLiteralRed: 247/255, green: 92/255, blue: 99/255, alpha: 1.0)

        self.tableView.backgroundView = background
        self.tableView.separatorColor = UIColor.white
        self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
        scheduledTimer(timeInterval: 8)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
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


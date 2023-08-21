//
//  ViewController.swift
//  Project1
//
//  Created by Kiran on 18/08/23.
//

import UIKit

class ViewController: UITableViewController {
    var picturesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        for item in items {
            if item.hasPrefix("nssl") {
                picturesArray.append(item)
            }
        }
        picturesArray.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = picturesArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = picturesArray[indexPath.row]
            let count = indexPath.row + 1
            vc.barTitle = "\(count) of \(picturesArray.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


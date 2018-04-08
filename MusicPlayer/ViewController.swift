//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Peter Kim on 4/7/18.
//  Copyright © 2018 Peter Kim. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var player:AVAudioPlayer = AVAudioPlayer()
    var myIndex = 0;
    
    let list = ["보고싶다", "겁쟁이", "안녕 나의 사랑", "너의 모든 순간", "거리에서"]
    let otherList = ["보고싶다", "겁쟁이", "안녕나의사랑", "너의모든순간", "거리에서"]
    

    @IBAction func playButtonTapped(_ sender: UIButton) {
        player.play()
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        player.pause()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        var song = otherList[myIndex]
        do {
            let audioPath = Bundle.main.path(forResource: song, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            player.play()
        } catch {
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


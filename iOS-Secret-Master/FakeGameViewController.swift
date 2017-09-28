//
//  FakeGameViewController.swift
//  iOS-Secret-Master
//
//  Created by Wura Alese on 9/27/17.
//  Copyright © 2017 Olivier Butler. All rights reserved.
//

import UIKit
import SocketIO

class FakeGameViewController: UIViewController{
    let socket = SocketIOClient(socketURL: URL(string: "http://localhost:8000")!, config: [.log(false), .forcePolling(true)])
    
    var currentPlayerName:String?
    var allPlayers:[String]?
    var count:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("We're in the fake game")
        if let curr = currentPlayerName {
            currentPlayerName = curr
            print(curr)
        }
        eventListner()
        socket.connect()
    }
    
    func eventListner()  {
        

    }
    
    @IBAction func shootPressed(_ sender: UIButton) {
        var data = [String:String]()
        data["shooter"] = currentPlayerName
        data["target"] = allPlayers?[count]
        count += 1
        socket.emit("shotsFired", data)
    }

    
    
}

//
//  StatusData.swift
//  Colon
//
//  Created by Jonathan Ming on 11/22/19.
//  Copyright © 2019 PKC Security. All rights reserved.
//

import SwiftUI
import Combine

final class StatusData: ObservableObject  {
    @Published var topOpen = true
    @Published var bottomOpen = true
    
    var updateTimer: Timer? = nil

    func scheduleUpdate() -> Void {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://colon-server.herokuapp.com/api/colon")!).receive(on: RunLoop.main).sink(receiveCompletion: {print($0)}, receiveValue: { (data, response) -> Void in
                        print("receiveCompletion called")
                        if let res = response as? HTTPURLResponse {
                            if res.statusCode == 200 {
                                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                                    if let topStatus = (json["top"] as? [String: String])?["status"] {
                                        print("got top status from response:")
                                        print(topStatus)
                                        self.topOpen = topStatus == "closed" ? false : true
                                    } else {
                                        self.topOpen = true
                                    }
                                    if let bottomStatus = (json["bottom"] as? [String: String])?["status"] {
                                        print("got bottom status from response")
                                        print(bottomStatus)
                                        self.bottomOpen = bottomStatus == "closed" ? false : true
                                    } else {
                                        self.bottomOpen = true
                                    }
                                } else {
                                    print("ERROR: parsing JSON response failed")
                                }
                            } else {
                                print("ERROR: Non-200 response from server")
                            }
                        }
        })
    }
    
    func start() -> Void {
        if let oldTimer = self.updateTimer {
            oldTimer.invalidate()
        }
        self.updateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(t) in
            self.scheduleUpdate()
        })
    }
    
    func stop() -> Void {
        self.updateTimer?.invalidate()
    }
}

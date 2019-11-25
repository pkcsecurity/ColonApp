//
//  HostingController.swift
//  Colon WatchKit Extension
//
//  Created by Jonathan Ming on 11/22/19.
//  Copyright © 2019 PKC Security. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import Combine

class HostingController: WKHostingController<ContentView> {
    var statusData = StatusData()
    
    override var body: ContentView {
        return ContentView(statusData: self.statusData)
    }
}

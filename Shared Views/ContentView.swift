//
//  ContentView.swift
//  Colon WatchKit Extension
//
//  Created by Jonathan Ming on 11/22/19.
//  Copyright © 2019 PKC Security. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var statusData: StatusData
    
    var body: some View {
        return ColonDetail().environmentObject(self.statusData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColonDetail().environmentObject(StatusData())
    }
}

//
//  ColonDetail.swift
//  Colon
//
//  Created by Jonathan Ming on 11/22/19.
//  Copyright © 2019 PKC Security. All rights reserved.
//

import SwiftUI

struct ColonDetail: View {
    @EnvironmentObject var statuses: StatusData
    
    var body: some View {
        VStack {
            Circle().padding(20).scaledToFit().scaleEffect(0.5).foregroundColor(self.statuses.topOpen ? Color.green : Color.red)
            Circle().padding(20).scaledToFit().scaleEffect(0.5).foregroundColor(self.statuses.bottomOpen ? Color.green : Color.red)
        }
    }
}

struct ColonDetail_Previews: PreviewProvider {
    static var previews: some View {
        let statuses = StatusData();
        return ColonDetail().environmentObject(statuses)
    }
}

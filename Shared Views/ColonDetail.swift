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
        GeometryReader { geometry in
            VStack(spacing: geometry.size.height / 10) {
                Circle().frame(width: geometry.size.width / 4, height: geometry.size.width / 4).foregroundColor(self.statuses.topOpen ? Color.green : Color.red)
                Circle().frame(width: geometry.size.width / 4, height: geometry.size.width / 4).foregroundColor(self.statuses.bottomOpen ? Color.green : Color.red)
            }
        }
    }
}

struct ColonDetail_Previews: PreviewProvider {
    static var previews: some View {
        let statuses = StatusData();
        return ColonDetail().environmentObject(statuses)
    }
}

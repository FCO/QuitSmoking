//
//  Details.swift
//  QuitSmoking
//
//  Created by Fernando Oliveira on 08/06/19.
//  Copyright © 2019 Fernando Oliveira. All rights reserved.
//

import SwiftUI

struct Details : View {
    var data : Data

    var body: some View {
        VStack {
            DetailRow(title: "Smoked cigarrets today",  value: "\(data.smokedToday)")
            DetailRow(title: "Smoked cigarrets total",  value: "\(data.smokedTotal)")
            DetailRow(title: "Money spent",             value: "£\(data.spent)")
            DetailRow(title: "Extra cigarretes",        value: "\(data.extra)")
        }
    }
}

#if DEBUG
struct Details_Previews : PreviewProvider {
    static var previews: some View {
        Details(data: Data())
    }
}
#endif

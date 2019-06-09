//
//  DetailRow.swift
//  QuitSmoking
//
//  Created by Fernando Oliveira on 08/06/19.
//  Copyright © 2019 Fernando Oliveira. All rights reserved.
//

import SwiftUI

struct DetailRow : View {
    var title : String
    var value : String
    var body : some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
    }
}

#if DEBUG
struct DetailRow_Previews : PreviewProvider {
    static var previews: some View {
        DetailRow(title: "bla", value: "ble")
    }
}
#endif

//
//  ContentView.swift
//  QuitSmoking
//
//  Created by Fernando Oliveira on 07/06/19.
//  Copyright © 2019 Fernando Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var data            : Data = Data()
    @State var showingExtra    : Bool = false
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Can I smoke now?")
            }
                .padding(.vertical, 80)
            Spacer()
            Details(data: data)
            Spacer()
            Button(action: {
                self.showingExtra = true
            }) {
                Text("I need to smoke now! Gimme an extra cigarrete!")
            }
                .presentation($showingExtra) {
                    Alert(
                        title:              Text("Are you sure?"),
                        message:            Text("Can't you wait just a little more? Just 5 more minutes! Can you wait?"),
                        primaryButton:      Alert.Button.default(Text("I can wait!")),
                        secondaryButton:    Alert.Button.destructive(Text("No... I'm too weak to wait just 5 more minutes")) {
                            self.data.extra = self.data.extra - 1
                        }
                    )
                }
                .padding(.vertical, 80)
                .disabled(data.extra == 0)
        }
            .padding(.horizontal)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

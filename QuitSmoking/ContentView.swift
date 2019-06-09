//
//  ContentView.swift
//  QuitSmoking
//
//  Created by Fernando Oliveira on 07/06/19.
//  Copyright © 2019 Fernando Oliveira. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var data             : Data = Data()
    @State var showingCanISmoke : Bool = false
    @State var showingExtra     : Bool = false
    var body: some View {
        VStack {
            Button(action: { self.showingCanISmoke = true }) {
                Text("Can I smoke now?")
            }
                .presentation($showingCanISmoke) {
                    if data.canSmoke() {
                        return Alert(
                            title:              Text("Ok... You can do that..."),
                            message:            Text("But are you sure you need to do that now? Let's wait just a little bit more..."),
                            primaryButton:      .default(Text("Ok, I'll wait a bit")),
                            secondaryButton:    .destructive(Text("No, I can't wait... I'll kill my self a little bit")) {
                                self.data.smoke()
                            }
                        )
                    } else {
                        return Alert(
                            title:              Text("You have smoked just now!!!"),
                            message:            Text("No!!! You cannot smoke just yet! Wait a little bit!"),
                            dismissButton:      .default(Text("I'll wait"))
                        )
                    }
                }
                .padding(.vertical, 80)
            Spacer()
            Details(data: data)
            Spacer()
            Button(action: { self.showingExtra = true }) {
                Text("I need to smoke now! Gimme an extra cigarrete!")
            }
                .presentation($showingExtra) {
                    Alert(
                        title:              Text("Are you sure?"),
                        message:            Text("Can't you wait just a little more? Just 5 more minutes! Can you wait?"),
                        primaryButton:      .default(Text("I can wait!")),
                        secondaryButton:    .destructive(Text("No... I'm too weak to wait just 5 more minutes")) {
                            self.data.smokeExtra()
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

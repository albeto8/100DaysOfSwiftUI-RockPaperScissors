//
//  MoveButton.swift
//  RockPaperScissors
//
//  Created by Mario Alberto Barragán Espinosa on 20/10/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct MoveButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        //TODO: Improve styling
        Button(action: {
            self.action()
        }) {
            Text(text)
        }
    }
}

struct MoveButton_Previews: PreviewProvider {
    static var previews: some View {
        MoveButton(text: "Button text") {
            print("Button tapped")
        }
    }
}

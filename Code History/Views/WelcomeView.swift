//
//  WelcomeView.swift
//  Code History
//
//  Created by Christophe Thomassin on 1/17/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                GameColor.mainColor.ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Select the correct answers to the following questions.")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    Spacer()
                    NavigationLink(
                        destination: GameView(),
                        label: {
                                BottomTextView(str: "Okay, let's go!")
                        }
                    )
                }
                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    WelcomeView()
}

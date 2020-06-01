//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pawan Kumar on 08/04/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct FlagImage: ViewModifier {
    var imageName: String
    func body(content: Content) -> some View {
        VStack {
            content
                   Image(imageName)
                       .renderingMode(.original)
                       .clipShape(Capsule())
                       .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                       .shadow(color: .black, radius: 2)
        }
    }
}

extension View {
    func flagImage(with imageName: String) -> some View {
        self.modifier(FlagImage(imageName: imageName))
    }
}
struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
           LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                VStack {
                    Text("Tap the flag of")
                     .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                     .foregroundColor(.white)
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        VStack {
                            Color.clear
                            .flagImage(with: self.countries[number])
                        }
                    }

                }
                Spacer()

            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct"
            } else {
                scoreTitle = "Wrong"
            }

            showingScore = true
        }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

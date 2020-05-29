//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pawan Kumar on 08/04/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State var currentScore: Int = 0
    @State var currentAnswer: String = ""

    var body: some View {
        ZStack {
           LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
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
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)

                    }

                }
                
                Text("Your  score is \(currentScore)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer()

            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text(" Total score \(currentScore)"), dismissButton: .default(Text("Continue")
                ) {
                    self.askQuestion()
                })
            }
        }
    }
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct"
                currentScore += 1
            } else {
                scoreTitle = "Wrong,This is the Flag of  \(self.countries[number])"

            }
            self.currentAnswer = self.countries[number]
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

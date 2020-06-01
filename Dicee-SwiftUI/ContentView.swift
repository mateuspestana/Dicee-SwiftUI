//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Mateus Pestana on 01/06/20.
//  Copyright © 2020 Mateus Pestana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var dadoEsqTop = 1
	@State var dadoDirTop = 1
	@State var dadoEsqBot = 1
	@State var dadoDirBot = 1
	
	var body: some View {
		ZStack {
			Image("background")
				.resizable()
				.edgesIgnoringSafeArea(.all)
			VStack {
			
				Image("diceeLogo")	.overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.red, lineWidth: 0))
					
				Spacer()
				HStack {
					DiceView(n: dadoEsqTop)
					DiceView(n: dadoDirTop)
				}.padding(.horizontal)
				HStack {
					DiceView(n: dadoEsqBot)
					DiceView(n: dadoDirBot)
				}
				.padding(.horizontal)
				Spacer()
				Button(action: {
					self.dadoEsqTop = Int.random(in: 1...6)
					self.dadoDirTop = Int.random(in: 1...6)
					self.dadoEsqBot = Int.random(in: 1...6)
					self.dadoDirBot = Int.random(in: 1...6)
				}) {
					Text("Jogar!")
						.font(.system(size: 48))
						.fontWeight(.bold)
						.foregroundColor(.white)
						.padding(.horizontal)
					
					
					
				}
				.background(Color.red)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				.overlay(RoundedRectangle(cornerRadius: 10)
				.stroke(Color.white, lineWidth: 2))
			}
		}
	}
}

struct DiceView: View {
	
	let n: Int
	var body: some View {
		Image("dice\(n)")
			.resizable()
			.aspectRatio(1, contentMode: .fit)
			.clipShape(RoundedRectangle(cornerRadius: 10))
			.overlay(RoundedRectangle(cornerRadius: 10)
				.stroke(Color.white, lineWidth: 2))
			.padding()
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}



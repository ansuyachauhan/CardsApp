//
//  ContentView.swift
//  CardsApp
//
//  Created by Ansuya Chauhan on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    let stringArr: [String]  = ["hi", "hello", "ola", "ola", "kem", "adaf","ola", "kem", "adaf","ola", "kem", "adaf","ola", "kem", "adaf"]
    @State var cardCount: Int = 9
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                Cardview(content: stringArr[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
    }
    var cardCountAdjusters: some View{
        HStack{
            CardRemover
            Spacer()
            CardAdder
        }.imageScale(.large)
            .font(.largeTitle)
    }
    func cardCountAdjuster(by offset: Int, symbol: String)-> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > stringArr.count)
        
    }
   
    var CardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
        
    }
    
    var CardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
        
    }
}
struct Cardview: View {
   let content: String
   @State var isFaceUp = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0: 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
    }
       
    }
}


#Preview {
    ContentView()
}

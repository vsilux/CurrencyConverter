//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Illia Suvorov on 10.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                HStack {
                    TextField("From amount", text: .constant(""))
                        .font(.system(size: 24))
                    Spacer()
                    Picker("Select currency", selection: .constant("USD")) {
                        ForEach(Currencies.list, id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                }
                HStack {
                    Text("1000")
                        .font(.system(size: 24))
                    Spacer()
                    Picker("Select currency", selection: .constant("USD")) {
                        ForEach(Currencies.list, id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                }.padding(.top, 28)
            }
            .padding()
            
            Button {
                
            } label: {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 44, height: 44)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    Image(systemName: "arrow.left.arrow.right")
//                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

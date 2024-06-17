//
//  ADVView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 18/06/24.
//

import SwiftUI

struct ADVView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.colorPaletteThree
                HStack {
                    
                    VStack {
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.4)
                            .offset(x: -25, y: -25)
                            .opacity(0.8)
                            .overlay {
                                VStack(alignment: .leading) {
                                    Text("Hello")
                                        .foregroundStyle(.white)
                                        .font(.custom(Constants.vtFont, size: geo.size.width * Constants.smallTextSize))
                                }
                            }
                    }
                }
            }
            .ignoresSafeArea()
            .frame(width: geo.size.width, height: geo.size.height)

        }
    }
}

#Preview {
    ADVView()
}

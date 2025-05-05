//
//  AnimatedView.swift
//  Matchedgeometry1-SwiftUI
//
//  Created by Nimish Mothghare on 05/05/25.
//

import SwiftUI

struct AnimatedView: View {
    
    @State var isExpanded: Bool = true
      
      // Identifier for the rectangle view
      private var rectangleId = "Rectangle"
      
      // Namespace for the expansion effect
      @Namespace var expansionAnimation
    
    var body: some View {
        VStack {
                   if isExpanded {
                       smallSizeView()
                   } else {
                       largeSizeView()
                   }
               }
               .padding()
               .onTapGesture {
                   withAnimation {
                       isExpanded.toggle()
                   }
               }    }
    
    @ViewBuilder
      func smallSizeView() -> some View {
          RoundedRectangle(cornerRadius: 25)
              .fill(.black)
              .frame(width: 300,height: 300)
              // Added the matched geometry modifier to the view
              .matchedGeometryEffect(id: rectangleId, in: expansionAnimation)
              .overlay {
                  Text("Hello Developer")
                      .font(.headline)
                      .foregroundStyle(.white)
              }
      }
      
      @ViewBuilder
      func largeSizeView() -> some View {
          RoundedRectangle(cornerRadius: 25)
              .fill(.black)
              // Added the matched geometry modifier to the view
              .matchedGeometryEffect(id: rectangleId, in: expansionAnimation)
              .overlay {
                  Text("Hello Developer")
                      .font(.headline)
                      .foregroundStyle(.white)
              }
      }
}

#Preview {
    AnimatedView()
}

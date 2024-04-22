//
//  HStackWithPadding.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/22/24.
//

import SwiftUI

struct HStackWithPadding<Content>: View where Content: View  {

    var leadingPadding: CGFloat?
    var trailingPadding: CGFloat?

    @ViewBuilder var content: Content
    
    var body: some View {
        HStack(
            alignment: .center
        ) {
            Spacer()
                .frame(width: leadingPadding ?? 0, height: 10, alignment: .center)
//                .background(Color.black)
            
            content
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()
                .frame(width: trailingPadding ?? 0, height: 10, alignment: .center)
//                .background(Color.black)

        }
    }
}

//#Preview {
//    HStackWithPadding(leadingPadding: 10,
//                      trailingPadding: 10){
//        
//    }
//}




//
//  CookDetailView.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import SwiftUI

struct CookDetailView: View {
    let cook: Cook
    var body: some View {
        Text(cook.title)
            .font(Font.title)
    }
    
    
}

#Preview {
    CookDetailView(cook: Cook(isNew: true, title: "alio olio", desc: "공쉪 초단간", category: 0))
}

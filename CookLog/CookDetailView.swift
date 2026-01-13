//
//  CookDetailView.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import SwiftUI

struct CookDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    var cook: Cook
    
    var body: some View {
        ScrollView {
            Text("\(cook.count) 해먹")
                .font(Font.footnote)
            if let desc = cook.desc {
                Text(desc)
            }
            if let reference = cook.reference {
                Text(reference.absoluteString)
            }
        }
        .navigationTitle(cook.title)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("편집") {
                    CreateCookView(cook: cook)
                    
                }
            }
        })
        .onAppear {
            cook.isNew = false
            do {
                try modelContext.save()
            } catch {
                print("Create save failed:", error)
            }
        }
    }
}

//#Preview {
//    CookDetailView(cook: Cook(isNew: true, title: "alio olio", desc: "공쉪 초단간", category: 0))
//}

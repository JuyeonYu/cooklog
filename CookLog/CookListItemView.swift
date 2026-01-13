//
//  CookListItemView.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import SwiftUI

struct CookListItemView: View {
    let cook: Cook
    var body: some View {
        GroupBox {
//            VStack(alignment: .leading, spacing: 0) {
//                Text("폰트테스트 largeTitle")
//                    .font(Font.largeTitle)
//                Text("폰트테스트 title")
//                    .font(Font.title)
//                Text("폰트테스트 title2")
//                    .font(Font.title2)
//                Text("폰트테스트 title3")
//                    .font(Font.title3)
//                Text("폰트테스트 headline")
//                    .font(Font.headline)
//                Text("폰트테스트 body")
//                    .font(Font.body)
//                Text("폰트테스트 callout")
//                    .font(Font.callout)
//                Text("폰트테스트 subheadline")
//                    .font(Font.subheadline)
//                Text("폰트테스트 footnote")
//                    .font(Font.footnote)
//                Text("폰트테스트 caption")
//                    .font(Font.caption)
//                Text("폰트테스트 caption2")
//                    .font(Font.caption2)
//            }
            
            
            
            VStack(alignment: .leading, spacing: 8) {
                
                if let desc  = cook.desc {
                    Text(desc)
                        .font(.footnote)
                        .background(.red)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(.red)
                
        } label: {
            HStack {
                if cook.isNew {
                    Text("NEW")
                        .font(Font.caption)
                        .padding(8)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.red)
                        }
                }
                Text("\(cook.count) 해먹")
                    .font(Font.caption)
                    .padding(8)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.yellow)
                    }
            }
            VStack {
                Text(cook.title)
                    .font(Font.headline)
            }
        }

//        VStack(alignment: .leading, spacing: 2) {
//            Rectangle()
//                .fill(Color(red: 00, green: 00, blue: 00))
//                .frame(width: 120, height: 120)
//                .clipShape(RoundedRectangle(cornerRadius: 16))
//                .shadow(radius: 2)
//                .overlay(alignment: .topLeading) {
//                    Text("\(cook.count)회")
//                        .padding(4)
//                        .background(.red)
//                        .clipShape(RoundedRectangle(cornerRadius: 8))
//                        .padding(4)
//                        
//                        
//                        
//                }
//            Text(cook.title)
//        }
//        .padding()
//        .background {
//            RoundedRectangle(cornerRadius: 16)
//                .foregroundStyle(.clear)
//        }
        
    }
}

#Preview {
    CookListItemView(cook: Cook(isNew: true, title: "alio olio", desc: "원팬용", category: 0, count: 5, reference: nil, photoFilename: nil, colorHex: "123123"))
}

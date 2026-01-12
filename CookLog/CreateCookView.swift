//
//  CreateCookView.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import SwiftUI

struct CreateCookView: View {
//    @Binding var didSave: Bool
    @Binding var newCook: Cook?

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var reference: String = ""
    @State private var desc: String = ""
    @FocusState private var isDescFocused: Bool
    
    @State private var selectedCategory: Int = 0
    
    let images: [String] = ["circle"]
    
    
    var body: some View {
        ScrollViewReader { proxy in
            Form {
                Section {
                    HStack {
                        ForEach(CookCatregory.allCases, id: \.self) { item in
                            Image(systemName: item.imageKey)
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(item.rawValue == selectedCategory ? .red : .gray)
                                }
                                .onTapGesture {
                                    selectedCategory = item.rawValue
                                }
                            
                        }
                    }
                } header: {
                    Text(LocalizedStringKey.init("category"))
                }
                Section {
                    TextField(LocalizedStringKey.init("title"), text: $title, prompt: Text(LocalizedStringKey("input_title_placeholder")))
                }
                header: {
                    Text(LocalizedStringKey.init("title"))
                }
                
                Section {
                    TextField(LocalizedStringKey.init("reference"), text: $reference, prompt: Text(LocalizedStringKey("input_reference_placeholder")))
                }
                header: {
                    Text(LocalizedStringKey.init("reference"))
                }
                
                
                
                Section {
                    ZStack(alignment: .topLeading) {
                        Text("내용을 자유롭게 입력하세요.")
                            .padding(.top, 8)
                            .padding(.leading, 4)
                            .foregroundStyle(Color(uiColor: .placeholderText))
                        TextEditor(text: $desc)
                            .focused($isDescFocused)
                            .frame(minHeight: 120)
                            .id("descEditor")
                    }
                } header: {
                    Text("메모")
                }
            }
            .onChange(of: desc) { _ in
                if isDescFocused {
                    withAnimation {
                        proxy.scrollTo("descEditor", anchor: .bottom)
                    }
                }
            }
            .onChange(of: isDescFocused) { focused in
                if focused {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            proxy.scrollTo("descEditor", anchor: .bottom)
                        }
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            
            Button {
                newCook = Cook(isNew: true, title: title, desc: desc, category: selectedCategory, reference: URL(string: reference))
                guard let newCook else { return }
                modelContext.insert(newCook)
//                didSave = true
                dismiss()
            } label: {
                Text("저장하기")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    CreateCookView(newCook: .constant(nil))
}

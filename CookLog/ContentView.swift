//
//  ContentView.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cookList: [Cook]
    
    @State private var showNew: Bool = false
    @State private var didSaveCook: Bool = false
    @State private var showSavedToast: Bool = false
    
    @State private var newCook: Cook? = nil

    var body: some View {
        ZStack(alignment: .bottom) {
            
            if cookList.isEmpty {
                ContentUnavailableView {
                    Label("No Mail", systemImage: "tray.fill")
                } description: {
                    Text("New mails you receive will appear here.")
                } actions: {
                    Button {
                        showNew = true
                    } label: {
                        Text("새로 만들기")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    
                }
                
                
            } else {
                List {
                    Section {
                        ForEach(cookList.filter { $0.category == 0}) { item in
                            CookListItemView(cook: item)
//                                .background {
//                                    item == newCook ? .red : .clear
//                                }
                        }
                    } header: {
                        Text("fork & knife")
                    }
                    
                    Section {
                        ForEach(cookList.filter { $0.category == 1}) { item in
                            CookListItemView(cook: item)
                        }
                    } header: {
                        Text("spoon")
                    }
                    
                    Section {
                        ForEach(cookList.filter { $0.category == 2}) { item in
                            CookListItemView(cook: item)
                        }
                    } header: {
                        Text("chopstics")
                    }
                    
                    Section {
                        ForEach(cookList.filter { $0.category == 3}) { item in
                            CookListItemView(cook: item)
                        }
                    } header: {
                        Text("hand food")
                    }
                    
                    Section {
                        
                    } header: {
                        Image(systemName: "hand.raised.fill")
                    }
                    
                    
                }
            }
            
            Button {
                showNew = true
            } label: {
                
                Text("새로 만들기")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)

            if showSavedToast {
                Text("저장됨")
                    .font(.subheadline)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .shadow(radius: 8)
                    .padding(.bottom, 72)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .sheet(isPresented: $showNew, onDismiss: {
            if let newCook {
                showSavedToast = true
                didSaveCook = false

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        showSavedToast = false
                    }
                }
            }
        }) {
            CreateCookView(newCook: $newCook)
        }

    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
//                modelCeontext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

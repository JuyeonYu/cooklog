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
    
//    @State private var newCook: Cook? = nil
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack {
            List {
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
                    Section {
                        ForEach(cookList) { item in
                            NavigationLink(value: item) {
                                CookListItemView(cook: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("해먹기록")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNew = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Cook.self) { cook in
                CookDetailView(cook: cook)
                
            }
            
            
            .sheet(isPresented: $showNew) {
                CreateCookView()
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
            do {
                try modelContext.save()
            } catch {
                print("Create save failed:", error)
            }

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

//extension Cook: Hashable {
//    static func == (lhs: Cook, rhs: Cook) -> Bool {
//        lhs.persistentModelID == rhs.persistentModelID
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(persistentModelID)
//    }
//}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

//
//  ContentView.swift
//  TodoList
//
//  Created by Jungman Bae on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Task]
    
    var body: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    Text("Item at \(item.text)")
                } label: {
                    Text(item.text)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Task(text: "Task", priority: .medium)
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}

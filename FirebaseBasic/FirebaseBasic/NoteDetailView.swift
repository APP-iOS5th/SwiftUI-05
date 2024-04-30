//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/30/24.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    var body: some View {
        VStack(spacing: 12) {
            Text(note.docId ?? "N/A")
                .font(.headline)
                .foregroundStyle(.red)
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
        }
        .padding(24)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: {
                    AddCommentView(note: note)
                }, label: {
                    HStack {
                        Image(systemName: "text.bubble.fill")
                        Text("Add Comment")
                    }
                })
                .padding()
                .border(.gray)
            }
        }
        .navigationTitle("Note Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note: Note.sampleWithLongBody)
    }
}

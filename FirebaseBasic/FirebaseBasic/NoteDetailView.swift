//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/30/24.
//

import SwiftUI
import FirebaseFirestore

struct NoteDetailView: View {
    @StateObject var service: CommentService
    
    var note: Note
    
    init(note: Note) {
        self.note = note
        _service = StateObject(wrappedValue: CommentService(noteId: note.docId!))
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
                .padding(24)
            Divider()
            ScrollView {
                ForEach(service.comments) { comment in
                    HStack {
                        AsyncImage(url: comment.photoURL) { image in
                            image
                                .resizable()
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                        }
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                        VStack {
                            Text(comment.body)
                                .font(.caption)
                        }
                        Spacer()
                    }
                    .frame(width: 300, height: 60)
                    Divider()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: {
                    AddCommentView(note: note)
                }, label: {
                    HStack {
                        Image(systemName: "text.bubble.fill")
                        Text("Add Comment (\(service.comments.count))")
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

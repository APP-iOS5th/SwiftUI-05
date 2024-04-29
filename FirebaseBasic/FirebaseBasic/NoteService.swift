//
//  NoteService.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/29/24.
//

import Firebase
import FirebaseFirestore

class NotesService: ObservableObject {
    @Published var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func fetch() {}
    
    func addNote(title: String, date: Date, body: String) {}
    
    private func startRealtimeUpdates() {}
    
    private func updateNotes(snapshot: QuerySnapshot) {}
    
}

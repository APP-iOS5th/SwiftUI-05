//
//  CommentService.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/30/24.
//

import Firebase
import FirebaseFirestore

@MainActor
class CommentService: ObservableObject {
    @Published var comments: [Comment]
    
    private let dbCollection: CollectionReference
    private var listener: ListenerRegistration?
    
    init(noteId: String) {
        self.comments = []
        self.dbCollection = Firestore.firestore().collection("notes/\(noteId)/comments")
        startRealtimeUpdates()
    }
    
    
    func fetch() {
        guard listener == nil else { return }
        dbCollection.getDocuments { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            updateComments(snapshot: snapshot)
        }
    }
    
    private func startRealtimeUpdates() {
        listener = dbCollection.addSnapshotListener { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print("New comment: \(diff.document.data())")
                }
                if (diff.type == .modified) {
                    print("Modified comment: \(diff.document.data())")
                }
                if (diff.type == .removed) {
                    print("Removed comment: \(diff.document.data())")
                }
            }
            updateComments(snapshot: snapshot)
        }
    }
    
    private func updateComments(snapshot: QuerySnapshot) {
        let comments: [Comment] = snapshot.documents.compactMap { document in
            do {
                var comment = try document.data(as: Comment.self)
                comment.docId = document.documentID
                return comment
            } catch {
                print(error)
            }
            return nil
        }
        self.comments = comments.sorted {
            $0.date > $1.date
        }
    }
}

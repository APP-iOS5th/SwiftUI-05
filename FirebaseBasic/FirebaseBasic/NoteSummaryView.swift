//
//  NoteSummaryView.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/30/24.
//

import SwiftUI

struct NoteSummaryView: View {
    var note: Note
    private let format: Date.FormatStyle = .dateTime.month(.wide).day().year()
    var body: some View {
        HStack {
            AsyncImage(url: note.photoURL) { image in
                image
                    .resizable()
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                
            }
            .frame(width: 60, height: 60)
            .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text("\(note.date, format: format)")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    List(0..<5) { _ in
        NoteSummaryView(note: Note.sample)
    }
}

import SwiftUI

struct ItemCard: View {
    let index: Int
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .font(.system(size: 40))
                .frame(width: 100, height: 100)
                .background(Color.blue.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text("Item \(index)")
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

struct DetailCard: View {
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "music.note.house.fill")
                    .font(.system(size: 100))
                    .frame(width: 300, height: 300)
                    .background(Color(hue: Double(index) / 20, saturation: 0.7, brightness: 0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(spacing: 8) {
                    Text("Album \(index)")
                        .font(.title)
                        .bold()
                    
                    Text("Artist Name")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text("Album • 2024")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                ForEach(1...12, id: \.self) { track in
                    HStack {
                        Text("\(track)")
                            .foregroundColor(.secondary)
                            .frame(width: 30)
                        
                        Text("Track \(track)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("3:30")
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color(.systemBackground))
    }
}


struct LibraryView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                ForEach(0..<20) { index in
                    NavigationLink(destination: DetailCard(index: index)) {
                        AlbumCard(index: index)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationTitle("Library")
        .background(Color(.systemGroupedBackground))
    }
}

struct AlbumCard: View {
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "music.note.house.fill")
                .font(.system(size: 50))
                .frame(width: 160, height: 160)
                .background(Color(hue: Double(index) / 20, saturation: 0.7, brightness: 0.8))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text("Album \(index)")
                    .font(.headline)
                    .lineLimit(1)

                Text("Artist Name")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 160)
    }
}

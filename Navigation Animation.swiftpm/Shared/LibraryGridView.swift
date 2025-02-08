import SwiftUI

struct LibraryGridView<Content: View>: View {
    let content: (Int) -> Content
    
    init(@ViewBuilder content: @escaping (Int) -> Content) {
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                ForEach(0..<20) { index in
                    content(index)
                }
            }
            .padding()
        }
        .navigationTitle("Library")
        .background(Color(.systemGroupedBackground))
    }
}
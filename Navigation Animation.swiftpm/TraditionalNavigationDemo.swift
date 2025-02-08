import SwiftUI

struct TraditionalNavigationDemo: View {
    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            NavigationStack {
                LibraryGridView { index in
                    NavigationLink {
                        DetailCard(index: index)
                    } label: {
                        AlbumCard(index: index)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}
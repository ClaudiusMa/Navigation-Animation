import SwiftUI

struct NavigationTransitionDemo: View {
    // MARK: - Properties
    @Namespace private var namespace
    
    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            NavigationStack {
                LibraryGridView { index in
                    NavigationLink {
                        if #available(iOS 18.0, *) {
                            DetailCard(index: index)
                                .navigationTransition(.zoom(sourceID: "album\(index)", in: namespace))
                        } else {
                            DetailCard(index: index)
                        }
                    } label: {
                        if #available(iOS 18.0, *) {
                            AlbumCard(index: index)
                                .matchedTransitionSource(id: "album\(index)", in: namespace)
                        } else {
                            AlbumCard(index: index)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

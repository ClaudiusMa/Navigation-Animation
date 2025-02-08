import SwiftUI

struct MatchedGeometryDemo: View {
    // MARK: - Properties
    @Namespace private var animation
    @State private var selectedItem: Int?
    
    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            ZStack {
                if selectedItem == nil {
                    LibraryGridView { index in
                        AlbumCard(index: index)
                            .matchedGeometryEffect(id: "album\(index)", in: animation)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedItem = index
                                }
                            }
                    }
                } else {
                    DetailCard(index: selectedItem!)
                        .matchedGeometryEffect(id: "album\(selectedItem!)", in: animation)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedItem = nil
                            }
                        }
                }
            }
        }
    }
}

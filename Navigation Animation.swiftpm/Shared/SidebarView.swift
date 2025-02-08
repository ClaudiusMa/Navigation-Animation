import SwiftUI

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink("Library", destination: EmptyView())
                .listRowBackground(Color.clear)
            NavigationLink("Browse", destination: Text("Browse"))
                .listRowBackground(Color.clear)
            NavigationLink("Radio", destination: Text("Radio"))
                .listRowBackground(Color.clear)
        }
        .navigationTitle("Music")
    }
}
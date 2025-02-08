import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TraditionalNavigationDemo()
              .tabItem {
                  Label("Old Nav", systemImage: "square.stack.3d.up")
              }
            NavigationTransitionDemo()
                .tabItem {
                    Label("New Nav", systemImage: "arrow.left.and.right")
                }
            
            MatchedGeometryDemo()
                .tabItem {
                    Label("MatchedGeometry", systemImage: "square.stack.3d.up")
                }

        }
    }
}

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var app: AppController
    var body: some View {
        Group {
            if app.isLoggedIn { MainTabView() } else { NavigationStack { LoginView() } }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack { HomeView() }.tabItem { Label("Home", systemImage: "house.fill") }
            NavigationStack { AboutView() }.tabItem { Label("About", systemImage: "person.fill") }
            NavigationStack { BlogView() }.tabItem { Label("Blog", systemImage: "doc.text.image") }
            NavigationStack { PortfolioView() }.tabItem { Label("Portfolio", systemImage: "square.grid.2x2.fill") }
            NavigationStack { ContactView() }.tabItem { Label("Contact", systemImage: "envelope.fill") }
            NavigationStack { MoreView() }.tabItem { Label("More", systemImage: "ellipsis.circle.fill") }
        }.tint(Color.themeOrange)
    }
}

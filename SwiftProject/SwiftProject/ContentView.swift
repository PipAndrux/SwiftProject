import SwiftUI



struct ContentView: View {
    
    var body: some View {
        
        
        
        
        TabView{
            Tab("Home",systemImage: "house"){
                HomeView()
            }
            
            Tab("Map",systemImage: "map"){
                MapView()
            }
            
            Tab("Explore",systemImage: "globe"){
                ExploreView()
            }
            Tab("Profile",systemImage: "person"){
                ProfileView()
            }
        }
    }
}
    
    


#Preview {
    ContentView()
}

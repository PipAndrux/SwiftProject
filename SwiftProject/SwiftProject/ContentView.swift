import SwiftUI



struct ContentView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Lissone, MB")
            Text("Where do")
                .font(.system(size: 48, weight: .bold))
            Text("we go today?")
                .font(.system(size: 48, weight: .bold))

            Image(systemName: "")
            Spacer()
            }.padding(.top, 20)
        
        TabView{
            Tab("Map",systemImage: "map"){
                MapView()
            }
            Tab("Profile",systemImage: "person"){
                ProfileView()
            }
            Tab("Settings",systemImage: "gearshape"){
                SettingsView()
            }
        }
    }
    
    struct MapView: View {
        var body: some View {
            Text("Contenuto della mappa")
                .font(.largeTitle)
        }
    }
      
    struct ProfileView: View {
        var body: some View {
            Text("Contenuto del Profilo")
                .font(.largeTitle)
        }
    }
    
    struct SettingsView: View {
        var body: some View {
            Text("Contenuto delle impostazioni")
                .font(.largeTitle)
        }
    }
    


  
}

#Preview {
    ContentView()
}

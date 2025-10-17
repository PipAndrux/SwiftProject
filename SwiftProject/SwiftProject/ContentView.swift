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
    
    struct HomeView: View {
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
            
            
            
        }
    }
    
    struct MapView: View {
        var body: some View {
            Text("Contenuto della mappa")
                .font(.largeTitle)
        }
    }
    
    
    
    struct ExploreView: View {
        var body: some View {
            Text("Contenuto delle impostazioni")
                .font(.largeTitle)
        }
    }
    
    struct UserInfo: Identifiable{
        let id = UUID()
        let title: String
        let imageName: String
        let isNew: Bool
    }
    
    
    struct ProfileHeaderView: View{
        let mariaProfile = UserInfo(title: "Maria", imageName: "person.crop.circle", isNew: false)
        var body: some View {
            //GeometryReader{geometry in
            VStack{
                    HStack{
                        Image(systemName: mariaProfile.imageName)
                        Text(mariaProfile.title)
                    }
                    .padding(20)
                    //.frame(width: geometry.size.width * 0.8)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                    
                }
            .frame(alignment: .leading)
                
            //}

            
        }
    }
    
    
    struct ProfileView: View {
        var body: some View {
            ProfileHeaderView()

                }
            }
        }

#Preview {
    ContentView()
}

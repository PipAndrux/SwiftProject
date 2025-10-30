import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var searchText = ""
    
    var body: some View {
        
        Map(position: $position) {
            UserAnnotation()
        }
        .safeAreaInset(edge: .top) {
            searchBarView
        }
        .mapControls {
            MapUserLocationButton()
            MapScaleView()
        }
    }
    
    private var searchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Cerca su Apple Maps...", text: $searchText)
                .foregroundColor(.primary)
                .textFieldStyle(.plain)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(12)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .shadow(radius: 5)
        .padding() 
    }
}


#Preview {
    MapView()
}

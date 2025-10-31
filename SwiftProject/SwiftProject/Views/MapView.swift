import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var searchText = ""
    @State private var searchResults: [MKMapItem] = []
    @State private var selectedItem: MKMapItem?
    @State private var showDetailSheet = false
    @State private var nearbyPOIs: [MKMapItem] = []
    
    @StateObject private var completerManager = SearchCompleterManager()
    
    let myLocations: [Location] = [
        Location(name: "Dolomiti Trek",
                 coordinate: CLLocationCoordinate2D(latitude: 46.5000, longitude: 12.1347)),
        Location(name: "Costa Smeralda",
                 coordinate: CLLocationCoordinate2D(latitude: 41.0833, longitude: 9.5333)),
        Location(name: "Sentiero degli Dei",
                 coordinate: CLLocationCoordinate2D(latitude: 40.6260, longitude: 14.4942))
    ]
    
    var body: some View {
        
        Map(position: $position, selection: $selectedItem) {
            
            UserAnnotation()
            
            ForEach(myLocations) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.blue)
                    .tag(locationToMapItem(location))
            }
            
            ForEach(nearbyPOIs, id: \.self) { item in
                Marker(item.name ?? "POI", coordinate: item.placemark.coordinate)
                    .tint(.green)
                    .tag(item)
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .mapStyle(.standard(pointsOfInterest: .all))
        .mapControls {
            MapUserLocationButton()
            MapScaleView()
        }
        
        .safeAreaInset(edge: .top) {
            VStack(spacing: 0) {
                searchBarView
                suggestionListView
            }
            .background(.clear)
        }
        
        .onChange(of: searchText) {
            completerManager.updateQuery(searchText)
            if searchText.isEmpty {
                searchResults = []
                nearbyPOIs = []
            }
        }
        
        .onChange(of: selectedItem) {
            if selectedItem != nil {
                self.showDetailSheet = true
            }
        }
        
        .sheet(isPresented: $showDetailSheet) {
            detailSheetView
                .presentationDetents([.height(200), .medium])
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .presentationCornerRadius(25)
        }
    }
    
    private var searchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Where do we go today...", text: $searchText)
                .foregroundColor(.primary)
                .textFieldStyle(.plain)
                .onSubmit {
                    completerManager.suggestions = []
                    Task {
                        await searchAndZoom()
                    }
                }
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                    searchResults = []
                    nearbyPOIs = []
                    completerManager.suggestions = []
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

    @ViewBuilder
    private var suggestionListView: some View {
        if !searchText.isEmpty && !completerManager.suggestions.isEmpty {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(completerManager.suggestions, id: \.self) { suggestion in
                        VStack(alignment: .leading) {
                            Text(suggestion.title).font(.headline)
                            Text(suggestion.subtitle).font(.subheadline).foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.searchText = suggestion.title
                            completerManager.suggestions = []
                            Task {
                                await searchAndZoom()
                            }
                        }
                        Divider()
                    }
                }
            }
            .frame(maxHeight: 300)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .padding(.horizontal)
            .padding(.top, -8)
        }
    }
    
    private var detailSheetView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(selectedItem?.name ?? "Location selected")
                .font(.title2).fontWeight(.semibold)
            Text(selectedItem?.placemark.title ?? "No address")
                .font(.subheadline).foregroundColor(.secondary)
            Spacer()
            Button("Close") {
                self.showDetailSheet = false
                self.selectedItem = nil
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
        .padding()
    }

    private func locationToMapItem(_ location: Location) -> MKMapItem {
        let placemark = MKPlacemark(coordinate: location.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = location.name
        return mapItem
    }
    
    @MainActor
    private func searchAndZoom() async {
        await searchPlaces()
        zoomToFirstResult()
        if let firstResult = searchResults.first {
            await findNearbyPOIs(around: firstResult)
        }
        self.searchResults = []
    }

    @MainActor
    private func searchPlaces() async {
        guard !searchText.isEmpty else { return }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        let search = MKLocalSearch(request: request)
        
        do {
            let response = try await search.start()
            self.searchResults = response.mapItems
        } catch {
            print("Error in the main research: \(error.localizedDescription)")
            self.searchResults = []
        }
    }
    
    @MainActor
    private func zoomToFirstResult() {
        guard let firstResult = searchResults.first else {
            return
        }
        let zoomDistance: CLLocationDistance = 1300
        let region = MKCoordinateRegion(
            center: firstResult.placemark.coordinate,
            latitudinalMeters: zoomDistance,
            longitudinalMeters: zoomDistance
        )
        withAnimation(.smooth) {
            self.position = .region(region)
        }
    }
    
    @MainActor
    private func findNearbyPOIs(around mapItem: MKMapItem) async {
        let searchQuery = "Restaurant"

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery
        
        let region = MKCoordinateRegion(
            center: mapItem.placemark.coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        request.region = region
        
        let search = MKLocalSearch(request: request)
        do {
            let response = try await search.start()
            self.nearbyPOIs = response.mapItems
        } catch {
            print("Error research POI: \(error.localizedDescription)")
            self.nearbyPOIs = []
        }
    }
}

#Preview {
    MapView()
}   

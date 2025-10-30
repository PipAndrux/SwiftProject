import Foundation
import MapKit

class SearchCompleterManager: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    
    @Published var suggestions: [MKLocalSearchCompletion] = []
    
    private var completer: MKLocalSearchCompleter
    
    override init() {
        self.completer = MKLocalSearchCompleter()
        super.init()
        self.completer.delegate = self
    }
    
    func updateQuery(_ query: String) {
        completer.queryFragment = query
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.suggestions = completer.results
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Suggestions error: \(error.localizedDescription)")
    }
}

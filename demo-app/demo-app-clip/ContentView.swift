//
//  ContentView.swift
//  demo-app-clip
//
//  Created by Jess Ryan on 7/28/20.
//

import SwiftUI

struct CheckPoint: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var time: Double
}

struct CheckPointRow: View {
    var checkPoint: CheckPoint
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(checkPoint.name)
                Text(checkPoint.location).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            Text(String(checkPoint.time))
        }
    }
}

struct DetailView: View {
    var checkPoint: CheckPoint
    
    var body: some View {
        VStack {
            Text(checkPoint.name).font(.title)
            
            HStack {
                Text("\(checkPoint.location) - \(String(checkPoint.time))")
            }
            
            Spacer()
        }
    }
}

struct ContentView: View {
    let points = [
        CheckPoint(name: "Chapman Summit", location: "GPS location", time: 0.0),
        CheckPoint(name: "Jamestown Mercantile", location: "GPS location", time: 0.0),
        CheckPoint(name: "Boulder Experience Center", location: "GPS location", time: 0.0),
        CheckPoint(name: "Brainard Lake", location: "GPS location", time: 0.0)
    ]
    
    
    var body: some View {
        NavigationView {
            List(points) { CheckPoint in
                    NavigationLink(destination: DetailView(checkPoint: CheckPoint)) {
                        CheckPointRow(checkPoint: CheckPoint)
                    }
                }
            .navigationBarTitle("CheckPoints")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

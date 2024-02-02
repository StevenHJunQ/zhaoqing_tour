//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by steven on 2024/1/27.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}

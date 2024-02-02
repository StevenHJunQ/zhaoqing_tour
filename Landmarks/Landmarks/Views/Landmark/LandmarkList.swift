//
//  LandmarkList.swift
//  Landmarks
//
//  Created by steven on 2024/1/27.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @Environment(ModelData.self) var modelData
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("我喜欢的")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("地标")
        } detail: {
            Text("选择一个地标")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}

//
//  CategoryRow.swift
//  Landmarks
//
//  Created by steven on 2024/1/31.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            switch categoryName {
            case "Lakes":
                Text("河流")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
            case "Rivers":
                Text("湖泊")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
            case "Mountains":
                Text("山脉")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
            default:
                Text(categoryName)
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(3))
    )
}

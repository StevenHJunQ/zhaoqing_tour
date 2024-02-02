//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by steven on 2024/2/1.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                
                Text("通知: \(profile.prefersNotifications ? "开": "关" )")
                Text("季节照片: \(profile.seasonalPhoto.rawValue)")
                Text("目标日期: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                
                VStack(alignment: .leading) {
                    Text("完成徽章")
                        .font(.headline)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "第一次徒步旅行")
                            HikeBadge(name: "地球日")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "第十次徒步旅行")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                
                VStack(alignment: .leading) {
                    Text("最近的远足")
                        .font(.headline)
                    
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}

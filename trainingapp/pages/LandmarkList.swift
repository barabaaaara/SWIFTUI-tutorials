//
//  LandmarkList.swift
//  trainingapp
//
//  Created by 桑原佑輔 on 2021/07/05.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    //データを更新する場合がある時は”@state”をつける
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

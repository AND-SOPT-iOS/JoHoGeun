//
//  AppListView.swift
//  35-Seminar
//
//  Created by 조호근 on 11/29/24.
//

import SwiftUI

struct AppListView: View {
    
    let essentialApps: [AppItem] = AppItem.sampleEssentialDatas
    
    var body: some View {
        List {
            Section(header: Text("필수 앱").font(.headline)) {
                ForEach(essentialApps, id: \.id) { app in
                    AppRowView(app: app)
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
    
}

#Preview {
    AppListView()
}

//
//  AppRowView.swift
//  35-Seminar
//
//  Created by 조호근 on 11/29/24.
//

import SwiftUI

struct AppRowView: View {
    let app: AppItem
    
    var body: some View {
        HStack {
            Image(app.appImage)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(app.title)
                    .font(.system(size: 16, weight: .medium))
                Text(app.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            DownloadButtonView(downloadState: app.downloadState)
        }
        .padding(.vertical, 4)
    }
}

struct DownloadButtonView: View {
    let downloadState: DownloadState
    
    var body: some View {
        Group {
            switch downloadState {
            case .download:
                Text("받기")
                    .foregroundColor(.blue)
            case .update:
                Text("업데이트")
                    .foregroundColor(.blue)
            case .installed:
                Text("설치됨")
                    .foregroundColor(.gray)
            case .paid(let price):
                Text("₩\(price)")
                    .foregroundColor(.blue)
            }
        }
        .frame(width: 70, height: 30)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

#Preview {
    AppRowView(app: AppItem(
            id: "com.sample.app",
            rank: 1,
            title: "샘플 앱",
            subtitle: "미리보기용 샘플 앱입니다",
            appImage: "blind",
            downloadState: .download
        ))
}

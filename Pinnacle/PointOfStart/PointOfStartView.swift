//
//  PointOfStartView.swift
//  Pinnacle
//
//  Created by D K on 11.03.2025.
//

import SwiftUI

struct PointOfStartView: View {
    @StateObject private var viewModel = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NewTabView()
                    .environmentObject(viewModel)
            } else {
                AuthView(viewModel: viewModel)
            }
        }
        .onAppear {
            AppDelegate.orientationLock = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}

#Preview {
    PointOfStartView()
}

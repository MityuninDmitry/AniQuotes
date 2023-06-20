import SwiftUI

public struct AppNavigationView<Content>: View where Content: View  {
    
    @StateObject var viewModel: AppNavigationViewModel = .init()
    
    private let content: Content

    public init(@ViewBuilder content: @escaping ()->Content) {
        self.content = content()
    }
    
    public var body: some View {
        let isRoot = viewModel.current == nil
        return ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
            } else {
                viewModel.current!.nextScreen
                    .environmentObject(viewModel)
            }
        }
    }
    
    
}


public struct AppNavigationViewNext<Content, Destination>: View where Content: View, Destination: View {
    @EnvironmentObject var viewModel: AppNavigationViewModel
    private let content: Content
    private let destination: Destination
    
    public init(destination: Destination, @ViewBuilder content: @escaping ()->Content) {
        self.destination = destination
        self.content = content()
    }
    
    public var body: some View {
        content
        .onTapGesture {
            append()
        }
    }
    
    private func append() {
        viewModel.append(destination)
    }
    
}


public struct AppNavigationViewNextBack<Content>: View where Content: View {
    @EnvironmentObject var viewModel: AppNavigationViewModel
    
    private let content: Content
    private let destination: BackDestination
    
    public init(destination: BackDestination, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.destination = destination
    }
    
    public var body: some View {
        content
        .onTapGesture {
            pop()
        }
    }
    
    private func pop() {
        viewModel.go(to: destination)
    }
    
    
}










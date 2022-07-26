//
//  MovieView.swift
//  Mobile2You
//
//  Created by Felipe ALmeida on 24/07/22.
//

import SwiftUI
import SDWebImageSwiftUI
import RxSwift

struct MovieView: View {
    
    var presenter: MoviePresenter;
    @ObservedObject var store: MovieStore;
    //    @ObservedObject var state: MovieViewModel;
    
    @State var showGoBack: Bool = true;
    
    init(store: MovieStore){
        self.presenter = MoviePresenter(delegate: store)
        self.store = store
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.edgesIgnoringSafeArea(.all)
            HStack(alignment: .center) {
                VStack(alignment:.center) {() -> AnyView in
                    switch store.state {
                    case .loading:
                        return AnyView(
                            ProgressView().scaleEffect(2,anchor: .center))
                    case .loaded(let data):
                        return (AnyView(
                            ScrollView(showsIndicators: false) {
                                MovieDetails(movie: data.movie)
                                ForEach(data.similarMovies,id: \.id) { movie in MovieListItem(movie: movie, genres: data.genres)
                                }.background(Color.black)
                            }.edgesIgnoringSafeArea(.all)
                        ))
                    case .error(let error):
                        return (AnyView(
                            VStack {
                                Spacer()
                                Text(error.localizedDescription)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal,20)
                                Spacer()
                            }
                        ))
                    }
                }
            }.background(Color.black)
            if(self.showGoBack) {
                Button(action: {}){
                    Image("chevron-left-solid").resizable().scaledToFit()
                        .frame(width: 20, height: 20).foregroundColor(.white)
                }.frame(width: 30,height: 30)
                .background(Color.black)
                .clipShape(Circle()).padding(.leading,20).padding(.top,50)
            }
        }.navigationBarTitle("",displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .onAppear(perform: self.presenter.populate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(store: MovieStore())
    }
}

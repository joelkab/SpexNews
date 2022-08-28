//
//  HomeVIew.swift
//  SpexNews
//
//  Created by Joel Kabura on 8/9/22.
//

import SwiftUI
import Kingfisher
struct HomeVIew: View {
    @StateObject var vm = GridViewModel()

     
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors:[ Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
            
            
            ScrollView {
                ForEach(vm.resultss, id: \.id) { num in
                    
                    
                    
                    NavigationLink(destination: WebInfo(url: num.url).navigationBarTitle("", displayMode: .inline))   {
                        
                        
                        
                        
                        VStack(alignment: .center)  {
                            KFImage(URL(string: num.imageURL))
                                .downsampling(size: CGSize(width: 200, height: 200))
                                .cacheOriginalImage()
                            
                                .cornerRadius(4)
                            
                            Text(num.newsSite)
                            VStack(alignment: .leading) {
                                
                                
                                Text(num.title)
                                    .fontWeight(.black).font(.body)
                                    .foregroundColor(.black)
                                Text(num.summary).lineLimit(2).foregroundColor(.black)
                                
                            }.padding(2)
                        }
                    }
                }
                
                
                .navigationTitle("SpexNews")
                
            }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}


struct HomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        HomeVIew()
    }
}

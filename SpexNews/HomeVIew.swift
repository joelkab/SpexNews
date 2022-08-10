//
//  HomeVIew.swift
//  SpexNews
//
//  Created by Joel Kabura on 8/9/22.
//

import SwiftUI

struct HomeVIew: View {
    @StateObject var vm = GridViewModel()
    var body: some View {
        NavigationView {
            
            ScrollView {
                ForEach(vm.resultss, id: \.id) { num in
                    
                    NavigationLink(destination: WebInfo(url: num.url).navigationBarTitle("", displayMode: .inline))   {
                        
                    
                    VStack(alignment: .leading, spacing: 10)  {
                    
                    Text(num.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(num.summary).lineLimit(2).foregroundColor(.black)
     
                    }.padding(.vertical, 10)
                
                    }
            }
                
            .navigationTitle("Trending")
            
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

//
//  ViewModel.swift
//  MyAlamofire
//
//  Created by 박힘찬 on 2022/03/25.
//

import SwiftUI
import Alamofire
import Combine

class ViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    @Published var viewmodel = [User]()
    
    var baseurl = "https://randomuser.me/api/?results=100"
    
    init() {
        print("🐯")
        
//        AF.request(baseurl)
//            .responseJSON { response in
//                print(response)
//            }
        
//        AF.request(baseurl)
//            .responseDecodable(of: RandomUserResponse.self) { response in
//                switch response.result {
//                case .success(let res):
//                    print(res)
//                    print(response.value)
//                    guard let _result = response.value else { return }
//                    print("🐭 \(_result.results[0].name.title)")
//                    self.viewmodel = _result.results
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
        
        AF.request(baseurl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap { $0.value }
            .map { $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { (receiveValue: [User]) in
                print("받은 값 : \(receiveValue.count)")
                self.viewmodel = receiveValue
            })
            .store(in: &subscription)
    }
}

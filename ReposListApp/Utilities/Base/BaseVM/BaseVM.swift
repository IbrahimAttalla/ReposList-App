//
//  BaseVM.swift
//
//

import Foundation

class BaseViewModel {
    
    init() {
        hydrate()
    }
    
    func hydrate() {}
    
    var successMessage = Dynamic<String>("")
    var actionDone = Dynamic<String>("")
    var errorMessage = Dynamic<String>("")
    var isLoading: Dynamic<Bool> = Dynamic(false)
    var errorMessageWithAction = Dynamic<String>("")

    func showLoading() {
        isLoading.value = true
    }
    
    func hideLoading() {
        isLoading.value = false
    }

}

//
//  ServiceError.swift
//
//

import Foundation

enum ServiceError: Error {
    case noInternetConnection
//    case login_verifyEmailFirst(User)
//    case login_verifyPhoneFirst(User)
//    case login_completePayment(User)
//    case login_completeActivate(User)
    case unauthorize
    case custom(String)
    case other
    case serverBusy
//    case unavailableService(ServiceUnavilable)
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .other:
            return "Something went wrong"
        case .custom(let message):
            return message
//        case .login_verifyEmailFirst:
//            return "verify Account email first"
        case .unauthorize:
             return "Unauthenticated account please login again"
        case .serverBusy:
            return "Server is Busy try agian later"
//        case .login_verifyPhoneFirst(_):
//            return "verify Account phone first"
//        case .login_completePayment(_):
//            return "Complete payment first"
//        case .login_completeActivate(_):
//            return "wait for account activation"
//        case .unavailableService(let servce):
//            return servce.serviceUnavilabiltyText ?? "Sorry the service unavailable now, try again later"
        }
    }
}

extension ServiceError {
    /*
     {
         "message": "The given data was invalid.",
         "errors": {
             "email": [
                 "The email has already been taken."
             ],
             "user_name": [
                 "The user name has already been taken."
             ],
             "phone.number": [
                 "The phone.number has already been taken."
             ]
         }
     }
     */
    init(json: [String: Any]) {
        var messages: [String] = []
        if let errors =  json["errors"] as? [String: Any] {
            for (_, value) in errors {
                if let errorData =  value as? [String] {
                    messages.append(contentsOf: errorData)
                }
            }
        }else if let msg = json["message"] as? String{
             messages.append(msg)
        }
            
        if messages.count > 0{
            self = .custom(messages.joined(separator: "\n "))
        } else {
            self = .other
        }
    }
}

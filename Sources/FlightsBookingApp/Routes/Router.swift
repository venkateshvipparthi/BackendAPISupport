//
//  Router.swift
//  FlightsBookingApp
//
//  Created by Admin on 28/07/2022.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


func setupRouter() -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uri: "/") { request, response in
        response.setBody(string: getIndexData())
            .completed()
    }
    
    routes.add(method: .get, uri: "/flights") { request, response in
        FlightsListController().handleFlightsListRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/details/{id}") { request, respone in
        FlightsDetailController().handleFlightsDetailRequest(request: request, response: respone)
    }
    
    return routes
}

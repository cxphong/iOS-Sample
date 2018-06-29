//
//  WebSocketClient.swift
//  Exinot
//
//  Created by CAO XUAN PHONG on 6/29/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import UIKit
import Starscream

class WebSocketClient: NSObject {
    var socket : WebSocket!
    var macAddress : String!
    var ipAddress : String!
    
    init(ipAddress : String) {
        self.ipAddress = ipAddress
    }
    
    public func connect() {
        var request = URLRequest(url: URL(string: "ws://" + ipAddress + ":8080")!)
        request.timeoutInterval = 5
        
        socket = WebSocket(request: request)
        socket.advancedDelegate = self
        socket.connect()
    }
    
    public func close() {
        if (socket != nil) {
            socket.disconnect()
        }
    }
    
}

extension WebSocketClient : WebSocketAdvancedDelegate {
    
    func websocketDidConnect(socket: WebSocket) {
        print ("websocketDidConnect")
        socket.write(string: "Hello")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: Error?) {
        print ("websocketDidDisconnect \(error)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String, response: WebSocket.WSResponse) {
        print ("websocketDidReceiveMessage \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data, response: WebSocket.WSResponse) {
        print ("websocketDidReceiveData")
    }
    
    func websocketHttpUpgrade(socket: WebSocket, request: String) {
        print ("websocketHttpUpgrade \(request)")
    }
    
    func websocketHttpUpgrade(socket: WebSocket, response: String) {
        print ("websocketHttpUpgrade \(response)")
    }
    
}

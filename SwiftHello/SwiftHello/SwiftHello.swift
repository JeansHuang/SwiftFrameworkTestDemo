//
//  SwiftHello.swift
//  SwiftHello
//
//  Created by JeansHuang on 2018/7/28.
//  Copyright © 2018 JeansHuang. All rights reserved.
//

import Foundation

@objc(SwiftHello)
public class SwiftHello: NSObject, GCDAsyncSocketDelegate {
    
    @objc(hello)
    public func hello() {
        print("Swift Hello")
    }
    
    private lazy var socketQueue: DispatchQueue = DispatchQueue(label: "socketQueue")
    
    private lazy var server: GCDAsyncSocket = GCDAsyncSocket(delegate: self, delegateQueue: self.socketQueue)
    
    @objc(startListening)
    public func startListening() {
        do {
            try server.accept(onPort: 6666)
            print("监听成功")
            
        }catch (let error) {
            print("监听失败:\(error.localizedDescription)")
        }
    }
    
    // MARK: - GCDAsyncSocketDelegate
    
    /// 有客户端接入
    public func socket(_ sock: GCDAsyncSocket, didAcceptNewSocket newSocket: GCDAsyncSocket) {
        print("连接成功,连接地址:\(newSocket.connectedHost!),端口:\(String(newSocket.connectedPort))")
    }
    
}

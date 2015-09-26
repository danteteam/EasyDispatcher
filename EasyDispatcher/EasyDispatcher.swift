//
//  EasyDispatcher.swift
//  EasyDispatcher
//
//  Created by Ivan Brazhnikov on 27/09/15.
//  Copyright © 2015 dantelab. All rights reserved.
//

import Foundation

public enum Priority {
    case High
    case Default
    case Low
    case Background
    
   private var queueIdentifier: dispatch_queue_priority_t {
        switch self {
        case .High : return DISPATCH_QUEUE_PRIORITY_HIGH
        case .Default : return DISPATCH_QUEUE_PRIORITY_DEFAULT
        case .Low: return DISPATCH_QUEUE_PRIORITY_LOW
        case .Background : return DISPATCH_QUEUE_PRIORITY_BACKGROUND
        }
    }
    
   private var queue: dispatch_queue_t {
        return dispatch_get_global_queue(queueIdentifier, 0)
    }
}

public struct dispatch${
    
    public static func main(action: ()->())  {
        dispatch_async(dispatch_get_main_queue(), action)
    }
    public static func main_sync(action: ()->())  {
        dispatch_sync(dispatch_get_main_queue(), action)
    }
    
    public static func main_after(delay: NSTimeInterval, _ action: ()->()){
        dispatch_after(
            convertTime(delay),
            dispatch_get_main_queue(),
            action)
        
    }
    
    public static func async(priority: Priority, _ action: ()->()){
        dispatch_async(priority.queue, action)
    }
    
    public static func async_after(priority: Priority, _ delay: NSTimeInterval, _ action: ()->()){
        dispatch_after(convertTime(delay), priority.queue, action)
    }
    
    public static func async_default(action: ()->()){
        async(.Default, action)
    }
    
    public static func async_low(action: ()->()){
        async(.Low, action)
    }
    
    public static func async_high(action: ()->()){
        async(.High, action)
    }
    
    public static func async_background(action: ()->()){
        async(.Background, action)
    }
    
    private static func convertTime(time: NSTimeInterval) -> dispatch_time_t {
        return dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(time * Double(NSEC_PER_SEC)))
    }
    
    
}
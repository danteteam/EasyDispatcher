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
    
    public static func main(block: dispatch_block_t)  {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    public static func main_sync(block: dispatch_block_t)  {
        dispatch_sync(dispatch_get_main_queue(), block)
    }
    
    public static func main_after(delay: NSTimeInterval, _ block: dispatch_block_t){
        dispatch_after(
            convertTime(delay),
            dispatch_get_main_queue(),
            block)
        
    }
    
    public static func async(priority: Priority, _ block: dispatch_block_t){
        dispatch_async(priority.queue, block)
    }
    
    public static func async(queue: dispatch_queue_t, block: dispatch_block_t){
        dispatch_async(queue, block)
    }
    
    public static func async_after(priority: Priority, _ delay: NSTimeInterval, _ block: dispatch_block_t){
        dispatch_after(convertTime(delay), priority.queue, block)
    }
    
    public static func async_default(block: dispatch_block_t){
        async(.Default, block)
    }
    
    public static func async_low(block: dispatch_block_t){
        async(.Low, block)
    }
    
    public static func async_high(block: dispatch_block_t){
        async(.High, block)
    }
    
    public static func async_background(block: dispatch_block_t){
        async(.Background, block)
    }
    
    private static func convertTime(time: NSTimeInterval) -> dispatch_time_t {
        return dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(time * Double(NSEC_PER_SEC)))
    }
    
    
}
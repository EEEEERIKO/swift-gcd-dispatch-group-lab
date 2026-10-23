//
//  main.swift
//  GCDDispatchGroupLab
//
//  Created by Erik Valencia Cardona on 23/10/26.
//

import Foundation

func fetchData( from source: String, completion: @escaping () -> Void) {
    print("\(source) - Fetching data...")
    
    sleep(2) //simulation of the network delay
    
    print("\(source) = Data fetched")
    
    completion()
}

func runGCDTask() {
    let queue = DispatchQueue.global(qos: .userInitiated)
    let group = DispatchGroup()
    
    let sources = ["API 1", "API 2", "API 3"]
    
    for source in sources {
        group.enter()
        queue.async {
            defer {
                group.leave()
            }
            fetchData(from: source) {
                print("\(source) - Processing complete")
            }
        }
    }
    
    print(" All tasks started...")
    group.wait()
    print("All task finished :)")
}

runGCDTask()


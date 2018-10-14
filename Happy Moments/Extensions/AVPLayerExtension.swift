//
//  AVPLayerExtension.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/7/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import AVFoundation

extension AVPlayer {
    
    var isPlaying: Bool{
        return rate != 0 && error == nil
    }
}

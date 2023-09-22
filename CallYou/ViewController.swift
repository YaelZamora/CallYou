//
//  ViewController.swift
//  CallYou
//
//  Created by Yael Javier Zamora Moreno on 22/09/23.
//

import UIKit
import AgoraUIKit

class ViewController: UIViewController {
    
    
    // Fill the App ID of your project generated on Agora Console.
    let appId: String = "8cdab228e3d540159c39602958250c9c"

    // Fill the temp token generated on Agora Console.
    let token: String? = "007eJxTYPj7XaRz74IpM3ou+8bEs3u6HDyefiJNTlXE+n2WurR/+k8FBovklMQkIyOLVOMUUxMDQ1PLZGNLMwMjS1MLI1ODZMvkY795UxsCGRle9wczMTJAIIjPzeCTWZbqnJGYl5eaw8AAABnGIYI="

    // Fill the channel name.
    let channelName: String = "LiveChannel"

    // Create the view object.
    var agoraView: AgoraVideoViewer!

    
    func initializeAndJoinChannel(){

        agoraView = AgoraVideoViewer(
            connectionData: AgoraConnectionData(
                appId: appId,
                rtcToken: token
            )
        )
        agoraView.fills(view: self.view)

        agoraView.join(
            channel: channelName,
            with: token,
            as: .broadcaster
        )
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeAndJoinChannel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        agoraView.exit()
    }
}


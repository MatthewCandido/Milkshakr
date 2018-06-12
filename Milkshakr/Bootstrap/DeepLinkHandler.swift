//
//  DeepLinkHandler.swift
//  Milkshakr
//
//  Created by Guilherme Rambo on 12/06/18.
//  Copyright © 2018 Guilherme Rambo. All rights reserved.
//

import UIKit
import MilkshakrKit

final class DeepLinkHandler {

    let flowController: AppFlowController

    private let validActivityTypes: [String]

    init(_ flowController: AppFlowController) {
        self.flowController = flowController

        var activityTypes = [Constants.userActivityType]

        if #available(iOS 12.0, *) {
            activityTypes.append(String(describing: OrderMilkshakeIntent.self))
        }

        validActivityTypes = activityTypes
    }

    func prepareToHandle(type: String) -> Bool {
        guard validActivityTypes.contains(type) else { return false }

        flowController.goHome()

        return true
    }

    func handle(_ userActivity: NSUserActivity) -> Bool {
        guard validActivityTypes.contains(userActivity.activityType) else { return false }

        flowController.pushDetail(from: userActivity)

        return true
    }

}

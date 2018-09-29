//
// Created by Taizo Kusuda on 2018/09/12.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

struct Developer {
    let icon: UIImage
    let name: String
    let role: String
    let detail: String
    let address: String
    let publicKey: String

    static let android = Developer(
            icon: R.image.icon_yuki()!,
            name: R.string.localizable.donation_android_engineer_name(),
            role: R.string.localizable.donation_android_engineer_role(),
            detail: R.string.localizable.donation_android_engineer_detail(),
            address: "NBHF3BSD4OHRIXHIERML27LHABVKK2MVK36YOYUN",
            publicKey: "b5ffa10aca9ac7abbf6517195d9a7eae2cdcb3b9f286ce11837d0d8ecc9669b2"
    )

    static let designer = Developer(
            icon: R.image.icon_rhime()!,
            name: R.string.localizable.donation_designer_name(),
            role: R.string.localizable.donation_designer_role(),
            detail: R.string.localizable.donation_designer_detail(),
            address: "NA4JR3MMBGS2P5U6WD7WVKYE5IHJZYICDDUL3IQI",
            publicKey: "2d781927ab153e2fb4d23284ac3d63a46aa4acea4f01a34dd6856c5a28280bf5"
    )

    static let ios = Developer (
            icon: R.image.icon_ryuta()!,
            name: R.string.localizable.donation_ios_engineer_name(),
            role: R.string.localizable.donation_ios_engineer_role(),
            detail: R.string.localizable.donation_ios_engineer_detail(),
            address: "NAEZYI6YPR4YIRN4EAWSP3GEYU6ATIXKTXSVBEU5",
            publicKey: "f687ee0fc27fa664f19c072825e0ccc8e0bf631b704434c977fa6472d7c4980f"
    )
}
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
    let github: String
    let twitter: String

    static let yuki = Developer(
            icon: R.image.icon_yuki()!,
            name: R.string.localizable.donation_yuki_name(),
            role: R.string.localizable.donation_yuki_role(),
            detail: R.string.localizable.donation_yuki_detail(),
            address: "NBHF3BSD4OHRIXHIERML27LHABVKK2MVK36YOYUN",
            publicKey: "b5ffa10aca9ac7abbf6517195d9a7eae2cdcb3b9f286ce11837d0d8ecc9669b2",
            github: "SasakiYuki",
            twitter: "YukiYamadaJP"

    )

    static let soma = Developer(
            icon: R.image.icon_soma()!,
            name: R.string.localizable.donation_soma_name(),
            role: R.string.localizable.donation_soma_role(),
            detail: R.string.localizable.donation_soma_detail(),
            address: "NBHF3BSD4OHRIXHIERML27LHABVKK2MVK36YOYUN",
            publicKey: "b5ffa10aca9ac7abbf6517195d9a7eae2cdcb3b9f286ce11837d0d8ecc9669b2",
            github: "Soma-Kato",
            twitter: "Riberd_Puzzle1"

    )


    static let rhime = Developer(
            icon: R.image.icon_rhime()!,
            name: R.string.localizable.donation_rhime_name(),
            role: R.string.localizable.donation_rhime_role(),
            detail: R.string.localizable.donation_rhime_detail(),
            address: "NA4JR3MMBGS2P5U6WD7WVKYE5IHJZYICDDUL3IQI",
            publicKey: "2d781927ab153e2fb4d23284ac3d63a46aa4acea4f01a34dd6856c5a28280bf5",
            github: "Rhime-design",
            twitter: "Rhime_design"
    )

    static let ryuta = Developer (
            icon: R.image.icon_ryuta()!,
            name: R.string.localizable.donation_ryuta_name(),
            role: R.string.localizable.donation_ryuta_role(),
            detail: R.string.localizable.donation_ryuta_detail(),
            address: "NAEZYI6YPR4YIRN4EAWSP3GEYU6ATIXKTXSVBEU5",
            publicKey: "f687ee0fc27fa664f19c072825e0ccc8e0bf631b704434c977fa6472d7c4980f",
            github: "ryuta46",
            twitter: "ryuta461"

    )
}

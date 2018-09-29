//
//  MosaicDetailViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import Nuke

class MosaicDetailViewController: BaseViewController {
    var presenter: MosaicDetailPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet var outside: UIView!
    @IBOutlet weak var dialog: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameHeadline: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var namespaceHeadline: UILabel!
    @IBOutlet weak var namespace: UILabel!
    override func setup() {
        super.setup()
        
        nameHeadline.textColor = Theme.secondary
        namespaceHeadline.textColor = Theme.secondary

        dialog.isUserInteractionEnabled = true
        dialog.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedDialog(_:))))

        outside.isUserInteractionEnabled = true
        outside.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedOutside(_:))))
    }

    @objc func onTouchedDialog(_ sender: Any) {
        // Do nothing
    }
    @objc func onTouchedOutside(_ sender: Any) {
        presenter.didClickOutside()
    }
}

extension MosaicDetailViewController: MosaicDetailView {
    func showImage(_ url: URL) {
        Nuke.loadImage(with: url,
                options: ImageLoadingOptions(placeholder: R.image.icon_reset()),
                into: image)
    }

    func showText(_ namespace: String, _ name: String) {
        self.namespace.text = namespace
        self.name.text = name
    }
}

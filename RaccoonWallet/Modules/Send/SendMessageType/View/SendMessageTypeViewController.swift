//
//  SendMessageTypeViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents

class SendMessageTypeViewController: BaseViewController {
    var presenter: SendMessageTypePresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var contentsScroll: UIScrollView!
    @IBOutlet weak var plainMessageCard: CardView!
    @IBOutlet weak var encryptedMessageCard: CardView!
    @IBOutlet weak var pager: UIPageControl!
    
    @IBOutlet weak var plainMessageHeadline: UILabel!
    @IBOutlet weak var plainMessageDescription: UILabel!
    @IBOutlet weak var encryptedMessageHeadline: UILabel!
    @IBOutlet weak var encryptedMessageDescription: UILabel!
    @IBOutlet weak var encryptedCautionBackground: UIView!
    @IBOutlet weak var encryptedCautionDescription: UILabel!
    
    override func setup() {
        super.setup()
        
        title = R.string.localizable.send_message_type_select_title()
        hideBackTitle()

        plainMessageCard.setShadowElevation(ShadowElevation(4.0), for: .normal)
        encryptedMessageCard.setShadowElevation(ShadowElevation(4.0), for: .normal)

        contentsScroll.delegate = self
        
        plainMessageHeadline.text = R.string.localizable.send_message_plain_title()
        plainMessageDescription.text = R.string.localizable.send_message_plain_description()
        encryptedMessageHeadline.text = R.string.localizable.send_message_encrypted_title()
        encryptedMessageDescription.text = R.string.localizable.send_message_encrypted_description()
        encryptedCautionDescription.text = R.string.localizable.send_message_encrypted_caution()
        
        encryptedCautionBackground.backgroundColor = Theme.baseBackground
    }
    
    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }

    
    /*

    @objc func onTouchedStandard(_ sender: Any) {
        presenter.didClickStandard()
    }

    @objc func onTouchedEncryption(_ sender: Any) {
        presenter.didClickEncryption()
    }
 */

}

extension SendMessageTypeViewController: SendMessageTypeView {
    func showMessageInputDialog() {
        let dialog = SendMessageRouter.assembleModule { [weak self] message in
            if let message = message {
                self?.presenter.didConfirmMessage(message)
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}


extension SendMessageTypeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width

        let currentPage = Int((scrollView.contentOffset.x / pageWidth).rounded())
        if pager.currentPage != currentPage {
            pager.currentPage = currentPage
        }
        
        presenter.didSelectPage(currentPage)
    }
}

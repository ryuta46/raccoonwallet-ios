//
//  MessageDialogViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class MessageDialogViewController: BaseViewController {
    var presenter: MessageDialogPresentation! { didSet { basePresenter = presenter } }

    @IBOutlet var outside: UIView!
    
    @IBOutlet weak var headerBackground: UIView!
    @IBOutlet weak var headerIcon: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var ok: UIButton!
    @IBOutlet weak var okBottomSpace: UIView!
    @IBOutlet weak var choices: UIStackView!
    @IBOutlet weak var okChoice: UIButton!
    @IBOutlet weak var cancelChoice: UIButton!
    @IBOutlet weak var messagePages: UIScrollView!
    @IBOutlet weak var messagePage0: UILabel!
    @IBOutlet weak var messagePage1: UILabel!
    @IBOutlet weak var messagePager: UIPageControl!
    @IBOutlet weak var dialog: UIView!

    @IBOutlet weak var neverRemindChoices: UIStackView!
    @IBOutlet weak var okForever: UIButton!
    @IBOutlet weak var okOnce: UIButton!
    
    override func setup() {
        dialog.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedDialog(_:))))
        outside.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedOutside(_:))))

        messagePages.delegate = self
        messagePager.addTarget(self, action: #selector(onTouchedPager(_:)), for: .valueChanged)

        okChoice.backgroundColor = Theme.primary
        cancelChoice.backgroundColor = Theme.secondary
        
        okForever.setTitleColor(Theme.primary, for: .normal)
        okForever.setTitle(R.string.localizable.common_never_remind(), for: .normal)
        okOnce.setTitleColor(Theme.primary, for: .normal)
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
    
    @IBAction func onTouchedOkChoice(_ sender: Any) {
        presenter.didClickOk()
    }
    @IBAction func onTouchedCancelChoice(_ sender: Any) {
        presenter.didClickCancel()
    }
    
    @IBAction func onTouchedOkForever(_ sender: Any) {
        presenter.didClickNeverRemind()
    }
    
    @IBAction func onTouchedOkOnce(_ sender: Any) {
        presenter.didClickOk()
    }
    
    @objc func onTouchedDialog(_ sender: Any) {
        // DO NOTHING
    }

    @objc func onTouchedOutside(_ sender: Any) {
        presenter.didClickOutside()
    }

    @objc func onTouchedPager(_ sender: Any) {
        var frame = self.messagePages.frame
        frame.origin.x = frame.size.width * CGFloat(self.messagePager.currentPage)
        self.messagePages.scrollRectToVisible(frame, animated: true)
    }

}

extension MessageDialogViewController: MessageDialogView{
    func showHeader(icon: UIImage, background: UIColor) {
        headerIcon.image = icon
        headerBackground.backgroundColor = background
    }

    func showOk(text: String, color: UIColor) {
        ok.setTitle(text, for: .normal)
        okChoice.setTitle(text, for: .normal)
        okOnce.setTitle(text, for: .normal)

        ok.backgroundColor = color
        okChoice.backgroundColor = color
        okOnce.setTitleColor(color, for: .normal)
    }

    func showHeadline(_ headline: String) {
        self.headline.text = headline
    }
    
    func showMessage(_ messages: [String]) {
        let multiMessage = messages.count > 1
        self.messagePages.isHidden = !multiMessage
        self.messagePager.isHidden = !multiMessage
        self.message.isHidden = multiMessage
        
        if multiMessage {
            self.messagePager.numberOfPages = messages.count
            self.messagePage0.text = messages[0]
            self.messagePage1.text = messages[1]
        } else {
            self.message.text = messages[0]
        }
    }


    func showActions(_ mode: MessageDialogMode) {
        ok.isHidden = mode != .show
        okBottomSpace.isHidden = mode != .show
        choices.isHidden = mode != .selectable
        neverRemindChoices.isHidden = mode != .neverRemind
    }
}
extension MessageDialogViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width

        guard scrollView.contentOffset.x.truncatingRemainder(dividingBy: pageWidth) == 0 else {
            return
        }

        let currentPage = Int((scrollView.contentOffset.x / pageWidth).rounded())
        if messagePager.currentPage != currentPage {
            messagePager.currentPage = currentPage
        }
    }
}

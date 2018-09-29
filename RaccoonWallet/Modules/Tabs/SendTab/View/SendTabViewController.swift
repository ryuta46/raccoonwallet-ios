//
//  SendTabViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/02.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SendTabViewController : BaseViewController {
    var presenter: SendTabPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var destinationHeadline: UILabel!
    
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var paste: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var userInputs: UIStackView!
    
    @IBOutlet weak var ok: PrimaryButton!
    //@IBOutlet weak var loading: NVActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!

    var loading: FullScreenLoadingView!
    
    override func setup() {
        super.setup()

        destinationHeadline.text = R.string.localizable.send_destination()
        destination.placeholder = R.string.localizable.send_input_address()

        loading = createFullScreenLoadingView()
        //loading.setup()
    }

    override func keyboardWillShow(keyboardFrame: CGRect, duration: TimeInterval) {
        let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
        let targetViewFrame = scrollView.convert(ok.frame, from: ok.superview)

        let offsetY: CGFloat = targetViewFrame.maxY - convertedKeyboardFrame.minY
        if offsetY < 0 { return }

        scrollView.setOffsetY(offsetY, duration: duration)
    }

    override func keyboardWillHide() {
        scrollView.clearOffset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onChangedDestination(_ sender: Any) {
        if let text = destination.text {
            presenter.didChangeDestination(text)
        }
    }
    
    @IBAction func onEndedDestination(_ sender: Any) {
        destination.resignFirstResponder()
    }

    @IBAction func onTouchedClear(_ sender: Any) {
        presenter.didClickClear()
    }
    @IBAction func onTouchedPaste(_ sender: Any) {
        presenter.didClickPaste()
    }
    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }

}

extension SendTabViewController : SendTabView {
    func setDestination(_ destination: String) {
        self.destination.text = destination
        presenter.didChangeDestination(destination)
    }

    func showPaste() {
        paste.isHidden = false
        clear.isHidden = true
    }

    func showClear() {
        paste.isHidden = true
        clear.isHidden = false
    }

    func showOk() {
        loading.stopLoading()
        //ok.isHidden = false
        //loading.isHidden = true
        //loading.stopAnimating()
        //userInputs.isUserInteractionEnabled = true
    }

    func showLoading() {
        loading.startLoading()
        //ok.isHidden = true
        //loading.isHidden = false
        //loading.startAnimating()
        //userInputs.isUserInteractionEnabled = false
    }

    func showNewbieDialog() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.send_newbie_caution_title(),
                messages: [R.string.localizable.send_newbie_caution_message()]) { [weak self] _ in
            self?.presenter.didClickNewbieOk()
        }
        navigationController?.present(dialog, animated: true)
    }

    func showNotSetPinError() {
        let dialog = MessageDialogPreset.createErrorNotSetPin { result in
            if result == .ok {
                self.presenter.didClickGoPinSetting()
            }
        }
        navigationController?.present(dialog, animated: true)
    }

    func showNotSelectWalletError() {
        let dialog = MessageDialogPreset.createErrorNotSelectWallet { result in
            if result == .ok {
                self.presenter.didClickGoWalletSelect()
            }
        }
        navigationController?.present(dialog, animated: true)
    }

}

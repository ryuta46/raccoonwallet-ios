//
//  IntroductionConceptViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class IntroductionConceptViewController: BaseViewController {
    var presenter: IntroductionConceptPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var concept: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var getStarted: UIButton!
    override func setup() {
        super.setup()
        
        concept.text = R.string.localizable.first_tutorial_title()
        getStarted.setTitle(R.string.localizable.first_tutorial_button(), for: .normal)

        setStatusBarColor()

        scrollView.delegate = self
    }
    @IBAction func onTouchedGetStarted(_ sender: Any) {
        presenter.didClickGetStarted()
    }
}

extension IntroductionConceptViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width

        guard scrollView.contentOffset.x.truncatingRemainder(dividingBy: pageWidth) == 0 else {
            return
        }

        let currentPage = Int((scrollView.contentOffset.x / pageWidth).rounded())
        if pageIndicator.currentPage != currentPage {
            pageIndicator.currentPage = currentPage
            presenter.didChangePage(currentPage)
        }
    }
}


extension IntroductionConceptViewController: IntroductionConceptView {
    func showMessage(_ message: String) {
        self.message.text = message
    }

    func showGetStarted() {
        getStarted.isHidden = false
    }

    func hideGetStarted() {
        getStarted.isHidden = true
    }
}

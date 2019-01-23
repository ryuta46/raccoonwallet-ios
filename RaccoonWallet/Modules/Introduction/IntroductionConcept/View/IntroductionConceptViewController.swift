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
    @IBOutlet weak var getStarted: UIButton!
    @IBOutlet weak var concept1: UILabel!
    @IBOutlet weak var message1: UILabel!
    @IBOutlet weak var concept2: UILabel!
    @IBOutlet weak var message2: UILabel!
    @IBOutlet weak var concept3: UILabel!
    @IBOutlet weak var message3: UILabel!
    override func setup() {
        super.setup()
        
//        concept.text = R.string.localizable.first_tutorial_title()
        getStarted.setTitle(R.string.localizable.first_tutorial_button(), for: .normal)
        
        concept1.text = R.string.localizable.first_tutorial_title1()
        concept2.text = R.string.localizable.first_tutorial_title2()
        concept3.text = R.string.localizable.first_tutorial_title3()
        message1.text = R.string.localizable.first_tutorial_message1()
        message2.text = R.string.localizable.first_tutorial_message2()
        message3.text = R.string.localizable.first_tutorial_message3()
        
        pageIndicator.currentPageIndicatorTintColor = Theme.primary
        pageIndicator.pageIndicatorTintColor = Theme.primaryDisabled

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
}

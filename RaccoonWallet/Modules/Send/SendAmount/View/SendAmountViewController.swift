//
//  SendAmountViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/03.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

class SendAmountViewController : BaseViewController {
    var presenter: SendAmountPresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var tabBarContainer: UIView!
    @IBOutlet weak var tabBarShadow: UIView!
    
    @IBOutlet weak var amountContents: UIStackView!
    
    @IBOutlet weak var amountPageIndicator: UIPageControl!
    
    @IBOutlet weak var amountPageScrollView: UIScrollView!
    @IBOutlet weak var amountPages: UIStackView!
    @IBOutlet weak var amountXemPage: SendAmountPage!
    @IBOutlet weak var calculator: Calculator!

    @IBOutlet weak var mosaicContents: UIStackView!
    @IBOutlet weak var mosaicWithXemContainer: UIStackView!
    @IBOutlet weak var mosaicWithXemHeadline: UILabel!
    @IBOutlet weak var mosaicWithXem: UISwitch!
    @IBOutlet weak var mosaicList: UITableView!

    var selectedMosaics: [MosaicDetail] = []
    var ownedMosaics: [MosaicDetail] = []

    var amountTab: UITabBarItem!
    var mosaicTab: UITabBarItem!

    override func setup() {
        super.setup()
        title = R.string.localizable.send_amount_title()
        hideBackTitle()

        mosaicWithXemHeadline.text = R.string.localizable.send_amount_with_xem()
        mosaicWithXem.onTintColor = Theme.primary

        setupTabBar()

        setupAmountPager()

        setupMosaicList()

        calculator.delegate = self
    }

    private func setupTabBar() {
        let tabBar = MDCTabBar(frame: tabBarContainer.bounds)
        amountTab = UITabBarItem(title: R.string.localizable.send_amount_setting(), image: .none, tag: 0)
        mosaicTab = UITabBarItem(title: R.string.localizable.send_mosaic_setting(), image: .none, tag: 0)
        tabBar.tintColor = Theme.primary
        tabBar.items = [
            amountTab,
            mosaicTab
        ]
        tabBar.delegate = self

        tabBar.itemAppearance = .titles
        tabBar.setTitleColor(UIColor.black, for: .selected)
        tabBar.setTitleColor(UIColor.lightGray, for: .normal)
        tabBar.alignment = .justified
        
        tabBar.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        
        tabBar.sizeToFit()
        tabBarContainer.addSubview(tabBar)

        // shadow
        tabBarShadow.layer.masksToBounds = false
        tabBarShadow.layer.shadowOffset = Constant.shadowOffset
        tabBarShadow.layer.shadowOpacity = Constant.shadowOpacity
        tabBarShadow.layer.shadowColor = Constant.shadowColor
        tabBarShadow.layer.shadowRadius = Constant.shadowRadius
    }

    private func setupMosaicList() {
        mosaicList.dataSource = self
        mosaicList.delegate = self
        mosaicList.setEditing(true, animated: false)
        mosaicList.allowsMultipleSelection = true
        mosaicList.allowsMultipleSelectionDuringEditing = true
    }

    @IBAction func onChangedMosaicWithXem(_ sender: Any) {
        presenter.didChangeMosaicWithXem(mosaicWithXem.isOn)
    }
    
    // To reserve mosaicWithXem's space, show the view temporally
    override func viewWillAppear(_ animated: Bool) {
        mosaicWithXemContainer.isHidden = false
        super.viewWillAppear(animated)
    }
}
extension SendAmountViewController: MDCTabBarDelegate {
    public func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        switch item {
        case amountTab: presenter.didClickAmountTab()
        case mosaicTab: presenter.didClickMosaicTab()
        default: break
        }
    }
}

extension SendAmountViewController: SendAmountView {
    func showAmount() {
        amountContents.isHidden = false
        mosaicContents.isHidden = true
    }

    func showMosaic() {
        amountContents.isHidden = true
        mosaicContents.isHidden = false
    }

    func showFirstAmountPage() {
        amountPageScrollView.setContentOffset(CGPoint.zero, animated: false)
        amountPageIndicator.currentPage = 0
    }

    func setAmounts(_ amounts: [String]) {
        if amounts.count != amountPages.subviews.count {
            // clear old subviews
            let oldSubviews = amountPages.subviews
            oldSubviews.forEach { $0.removeFromSuperview() }
            // add pages
            for _ in 0..<amounts.count {
                let page = SendAmountPage(frame: amountPageScrollView.bounds)
                amountPages.addArrangedSubview(page)

                page.widthAnchor.constraint(equalTo: amountPageScrollView.widthAnchor, multiplier: 1).isActive = true
                page.heightAnchor.constraint(equalTo: amountPages.heightAnchor, multiplier: 1).isActive = true
            }
            amountPages.layoutIfNeeded()
            amountPageIndicator.numberOfPages = amounts.count
        }

        amounts.enumerated().forEach {
            let index = $0.0
            let value = $0.1
            if let page = amountPages.subviews[safe: index] as? SendAmountPage {
                page.amount.text = value
            }
        }
    }

    func setFormula(_ formula: String) {
        calculator.formula = formula
    }

    func showLoading() {
        // Ideally, mosaicWithXem should be hidden during loading.
        // But if do so, the layout is collapsed and mosaicWithXem never be shown even when the view should be shown.
        // To avoid this, the alpha is used.
        mosaicWithXemContainer.alpha = 0
        ownedMosaics = []
        selectedMosaics = []
        mosaicList.reloadData()
    }

    func showMosaicWithXem() {
        mosaicContents.showSubview(mosaicWithXemContainer, visible: true, animated: true)
    }

    func hideMosaicWithXem(animated: Bool) {
        mosaicContents.showSubview(mosaicWithXemContainer, visible: false, animated: animated)
    }

    func showMosaicOwned(_ mosaics: [MosaicDetail], selected: [MosaicDetail]) {
        ownedMosaics = mosaics
        selectedMosaics = selected
        mosaicWithXemContainer.alpha = 1
        
        mosaicList.reloadData()
    }
}


extension SendAmountViewController: UIScrollViewDelegate {
    private func setupAmountPager() {
        amountPageScrollView.delegate = self
        amountPageIndicator.addTarget(self, action: #selector(onTouchedPageIndicator(_:)), for: .valueChanged)
    }

    @objc func onTouchedPageIndicator(_ sender: Any) {

        let frame = amountPageScrollView.frame
        let offset = frame.size.width * CGFloat(amountPageIndicator.currentPage)

        amountPageScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        presenter.didChangeAmountPage(amountPageIndicator.currentPage)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width

        guard scrollView.contentOffset.x.truncatingRemainder(dividingBy: pageWidth) == 0 else {
            return
        }

        let currentPage = Int((scrollView.contentOffset.x / pageWidth).rounded())
        if amountPageIndicator.currentPage != currentPage {
            amountPageIndicator.currentPage = currentPage
            presenter.didChangeAmountPage(currentPage)
        }
    }
}


extension SendAmountViewController: CalculatorDelegate {
    func onChangedFormula(formula: String) {
        presenter.didChangeFormula(formula)
    }

    func onCalculated(_ value: Decimal) {
        presenter.didCalculateFormula(value)
    }

    func onConfirmed(_ value: Decimal) {
        presenter.didCalculateFormula(value)
        presenter.didConfirm()
    }
}

extension SendAmountViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle(rawValue: 3)! // check box
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectMosaicOwned(ownedMosaics[indexPath.row])
    }

    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        presenter.didDeselectMosaicOwned(ownedMosaics[indexPath.row])
    }
}

extension SendAmountViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ownedMosaics.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mosaicList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sendAmountMosaicCell, for: indexPath)!

        let mosaic = ownedMosaics[indexPath.row]

        cell.textLabel?.text = mosaic.identifier
        cell.detailTextLabel?.text = mosaic.amount.description
        cell.tintColor = Theme.primary // for check box color

        return cell
    }
}

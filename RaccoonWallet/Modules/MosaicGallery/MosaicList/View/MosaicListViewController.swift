//
//  MosaicListViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Nuke

class MosaicListViewController: BaseViewController {
    var presenter: MosaicListPresentation! { didSet {basePresenter = presenter} }
    

    //@IBOutlet weak var loadingView: NVActivityIndicatorView!
    @IBOutlet weak var mosaicList: UICollectionView!
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var emptyHeadline: UILabel!
    @IBOutlet weak var emptyMessage: UILabel!
    
    var mosaics: [MosaicImageUrl] = []
    var computedCellSize: CGSize? = nil

    private var loadingView: FullScreenLoadingView!

    override func setup() {
        super.setup()
        title = R.string.localizable.common_mosaic_gallery()
        
        emptyHeadline.text = R.string.localizable.gallery_no_mosaic_title()
        emptyHeadline.textColor = Theme.secondary
        emptyMessage.text = R.string.localizable.gallery_no_mosaic_message()
        emptyMessage.textColor = Theme.secondary

        mosaicList.delegate = self
        mosaicList.dataSource = self

        loadingView = createFullScreenLoadingView()
        //loadingView.setup()
    }
}

extension MosaicListViewController: MosaicListView {
    func showLoading() {
        loadingView.startLoading()
        //loadingView.isHidden = false
        //emptyView.isHidden = true
        //mosaicList.isHidden = true
        //loadingView.startAnimating()
    }

    func hideLoading() {
        loadingView.stopLoading()
        //loadingView.isHidden = true
        //loadingView.stopAnimating()
    }

    func showEmpty() {
        mosaicList.isHidden = true
        emptyView.isHidden = false
        loadingView.stopLoading()

        //mosaicList.isHidden = true
        //loadingView.switchTo(view: emptyView)
    }

    func showMosaics(_ mosaics: [MosaicImageUrl]) {
        emptyView.isHidden = true
        mosaicList.isHidden = false
        loadingView.stopLoading()

        //emptyView.isHidden = true
        //loadingView.switchTo(view: mosaicList)
        self.mosaics = mosaics
        mosaicList.reloadData()
    }

    func showMosaicDetail(_ mosaic: MosaicImageUrl) {
        let dialog = MosaicDetailRouter.assembleModule(mosaic)
        navigationController?.present(dialog, animated: true)
    }
}

extension MosaicListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let cellSize = self.computedCellSize {
            return cellSize
        } else {
            guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
                fatalError()
            }
            let cellSize = MosaicImageCell.proportionalScaledSize(in: flowLayout, forColumnCount: 3)
            self.computedCellSize = cellSize

            return cellSize
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didClickMosaic(mosaics[indexPath.row])
    }
}


extension MosaicListViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mosaics.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mosaicList.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.mosaicGalleryMosaicCell, for: indexPath)! as MosaicImageCell

        let mosaicImage = mosaics[indexPath.row]

        if let url = URL(string: mosaicImage.url) {
            Nuke.loadImage(with: url,
                    options: ImageLoadingOptions(placeholder: R.image.icon_reset()),
                    into: cell.image)
        } else {
            cell.image.image = nil
        }
        return cell
    }
}

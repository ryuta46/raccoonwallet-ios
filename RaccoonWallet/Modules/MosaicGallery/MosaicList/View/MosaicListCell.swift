//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class MosaicImageCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!


    static func proportionalScaledSize(in flowLayout: UICollectionViewFlowLayout, forColumnCount columnCount: Int) -> CGSize {
        let size = calculatePreferredItemWidth(in: flowLayout, forColumnCount: columnCount)
        return CGSize(width: size, height: size)

        /*
        self.bounds.size =
        self.layoutIfNeeded()

        return self.systemLayoutSizeFitting(
                UILayoutFittingExpandedSize,
                withHorizontalFittingPriority: UILayoutPriority.required,
                verticalFittingPriority: UILayoutPriority.defaultLow
        )
        */
    }

    static private func calculatePreferredItemWidth(in flowLayout: UICollectionViewFlowLayout, forColumnCount columnCount: Int) -> CGFloat {
        guard columnCount > 0 else {
            return 0
        }
        guard let collectionView = flowLayout.collectionView else {
            return 0
        }

        let collectionViewWidth = collectionView.bounds.width
        let inset = flowLayout.sectionInset
        let spacing = flowLayout.minimumInteritemSpacing

        // Evenly divide the width excluding each margin from the width of the collection view.
        return (collectionViewWidth - (inset.left + inset.right + spacing * CGFloat(columnCount - 1))) / CGFloat(columnCount)
    }
}


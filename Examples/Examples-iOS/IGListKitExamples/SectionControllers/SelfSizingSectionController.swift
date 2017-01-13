/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.

 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

final class SelfSizingSectionController: IGListSectionController, IGListSectionType {

    var model: SelectionModel!

    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
    }

    func numberOfItems() -> Int {
        return model.options.count
    }

    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let text = model.options[index]
        let cell: UICollectionViewCell
        switch model.type {
        case .none:
            let manualCell = collectionContext!.dequeueReusableCell(of: ManuallySelfSizingCell.self, forSectionController: self, at: index) as! ManuallySelfSizingCell
            manualCell.label.text = text
            cell = manualCell
        case .fullWidth:
            let manualCell = collectionContext!.dequeueReusableCell(of: FullWidthSelfSizingCell.self, forSectionController: self, at: index) as! FullWidthSelfSizingCell
            manualCell.label.text = text
            cell = manualCell
        case .nib:
            let nibCell = collectionContext!.dequeueReusableCell(withNibName: "NibSelfSizingCell", bundle: nil, forSectionController: self, at: index) as! NibSelfSizingCell
            nibCell.contentLabel.text = text
            cell = nibCell
        }
        return cell
    }

    func didUpdate(to object: Any) {
        self.model = object as? SelectionModel
    }

    func didSelectItem(at index: Int) {}

}

import UIKit

import SnapKit
import Then

// MARK: - GalleryCollectionViewCell

final class GalleryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "GalleryCollectionViewCell"
    
    // MARK: - UI Components
    
    private let galleryContainerView = UIView()
    private let galleryImageView = UIImageView()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension GalleryCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [galleryContainerView].forEach {
            contentView.addSubview($0)
        }
        
        galleryContainerView.addSubview(galleryImageView)
        galleryContainerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(123)
        }
        
        galleryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: GalleryModel) {
        galleryImageView.image = UIImage(named: model.galleryImage)
    }
}

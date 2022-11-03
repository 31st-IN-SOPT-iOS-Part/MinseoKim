import UIKit

import SnapKit
import Then

// MARK: - GalleryGridViewController

final class GalleryGridViewController: UIViewController {

    // MARK: - UI Components
    
    private lazy var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let firstView = UIView() // 닫기 아이콘, "최근 항목", "전송"
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"iconClose"), for: .normal)
        button.addTarget(self, action:#selector(touchupCloseButton), for:.touchUpInside) // 왜 안됨??
        return button
    }()
    
    private let recentTextLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 항목"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
//    private let selectLabel: UILabel = {
//        let label = UILabel()
//        label.text = "최근 항목"
//        label.font = .systemFont(ofSize: 16, weight: .regular)
//        label.textAlignment = .center
//        return label
//    }()
    
    private let sendTextLabel: UILabel = {
        let label = UILabel()
        label.text = "전송"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Variables
    
    var galleryList: [GalleryModel] = [
        GalleryModel(galleryImage: "galleryImage0"),
        GalleryModel(galleryImage: "galleryImage1"),
        GalleryModel(galleryImage: "galleryImage2"),
        GalleryModel(galleryImage: "galleryImage3"),
        GalleryModel(galleryImage: "galleryImage4"),
        GalleryModel(galleryImage: "galleryImage5"),
        GalleryModel(galleryImage: "galleryImage6"),
        GalleryModel(galleryImage: "galleryImage7"),
        GalleryModel(galleryImage: "galleryImage8"),
        GalleryModel(galleryImage: "galleryImage9"),
        GalleryModel(galleryImage: "galleryImage10"),
        GalleryModel(galleryImage: "galleryImage11"),
        GalleryModel(galleryImage: "galleryImage12"),
        GalleryModel(galleryImage: "galleryImage13"),
        GalleryModel(galleryImage: "galleryImage14"),
        GalleryModel(galleryImage: "galleryImage15"),
        GalleryModel(galleryImage: "galleryImage16"),
        GalleryModel(galleryImage: "galleryImage17"),
        GalleryModel(galleryImage: "galleryImage18"),
        GalleryModel(galleryImage: "galleryImage19"),
        GalleryModel(galleryImage: "galleryImage20"),
        GalleryModel(galleryImage: "galleryImage21"),
        GalleryModel(galleryImage: "galleryImage22"),
        GalleryModel(galleryImage: "galleryImage23"),
    ]
    
    // MARK: - Constants
    
    final let kGalleryInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    final let kGalleryLineSpacing: CGFloat = 9
    final let kGalleryInterItemSpacing: CGFloat = 9
    final let kCellHeight: CGFloat = 119
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
    }
    
    @objc
    private func touchupCloseButton() {
        self.dismiss(animated:true, completion:nil)
    }
}

// MARK: - Extensions

extension GalleryGridViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [firstView, galleryCollectionView].forEach {
            view.addSubview($0)
        }
        
        [closeButton, recentTextLabel, sendTextLabel].forEach {
            firstView.addSubview($0)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(38)
        }
        
        closeButton.snp.makeConstraints {
            $0.leading.equalTo(self.firstView.snp.leading).offset(12)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        recentTextLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.firstView.snp.centerX)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        sendTextLabel.snp.makeConstraints {
            $0.trailing.equalTo(self.firstView.snp.trailing).offset(-11)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        galleryCollectionView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    // MARK: - General Helpers
    
    private func register() {
        galleryCollectionView.register(
            GalleryCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier
        )
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(galleryList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * kCellHeight + (heightCount - 1) * kGalleryLineSpacing + kGalleryInset.top + kGalleryInset.bottom
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GalleryGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let tripleCellWidth = screenWidth - kGalleryInset.left - kGalleryInset.right - kGalleryInterItemSpacing * 2
        return CGSize(width: tripleCellWidth / 3, height: 119)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kGalleryLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kGalleryInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return kGalleryInset
    }
}

// MARK: -UICollectionViewDataSource

extension GalleryGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let galleryCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath)
                as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        galleryCell.dataBind(model: galleryList[indexPath.item])
        return galleryCell
    }
}

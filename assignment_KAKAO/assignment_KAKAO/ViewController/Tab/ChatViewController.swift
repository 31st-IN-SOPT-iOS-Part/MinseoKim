import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - ChatViewController

final class ChatViewController: UIViewController {

    // MARK: - UI Components
    
    private lazy var chatCollectionView: UICollectionView = {
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
    
    private let firstView = UIView() // "채팅", "오픈채팅", + 아이콘, 설정 아이콘
    
    private let chatTextLabel: UILabel = {
        let label = UILabel()
        label.text = "채팅"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let openchatTextLabel: UILabel = {
        let label = UILabel()
        label.text = "오픈채팅"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = 0xA6A6A6.color
        label.textAlignment = .center
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"iconPlus"), for: .normal)
        button.addTarget(self, action: #selector(touchupPlusButton), for:.touchUpInside)
        return button
    }()

    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"iconSetting"), for: .normal)
        return button
    }()
    
    private let adContainerView = UIView()
    
    private let adImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "minseo_ios")
        // image.layer.cornerRadius = 6
        return image
    }()
    
    // MARK: - Variables
    
    var chatList: [ChatModel] = [
        ChatModel(profileImage: "profileImage1", profileName: "장석우", recentChat: "여친 구함 ㅋㅋ", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage2", profileName: "김인영", recentChat: "피곤해요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage3", profileName: "안솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage4", profileName: "최솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage5", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage6", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage7", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage8", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage9", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage4", profileName: "최솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage5", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage6", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage7", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage8", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41"),
        ChatModel(profileImage: "profileImage9", profileName: "정솝트", recentChat: "살려줘요", recentChatTime: "오후 9:41")
    ]
    
    // MARK: - Constants
    final let kChatInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let kChatLineSpacing: CGFloat = 0
    // final let kChatInterItemSpacing: CGFloat = 0
    final let kChatHeight: CGFloat = 50
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
    }
    
    // 갤러리 페이지로 이동 (present)
    private func presentToGalleryVC() {
        let galleryVC = GalleryGridViewController()
        galleryVC.modalPresentationStyle = .fullScreen
        self.present(galleryVC, animated:true, completion:nil)
    }
        
    
    @objc
    private func touchupPlusButton() {
        presentToGalleryVC()
    }
}

// MARK: - Extensions

extension ChatViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [firstView, adContainerView, chatCollectionView].forEach {
            view.addSubview($0)
        }
        
        [chatTextLabel, openchatTextLabel, plusButton, settingsButton].forEach {
            firstView.addSubview($0)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        chatTextLabel.snp.makeConstraints {
            $0.leading.equalTo(self.firstView.snp.leading).offset(14)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        openchatTextLabel.snp.makeConstraints {
            $0.leading.equalTo(self.chatTextLabel.snp.trailing).offset(7)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        plusButton.snp.makeConstraints {
            $0.trailing.equalTo(self.firstView.snp.trailing).offset(-46)
            $0.height.equalTo(19)
            $0.width.equalTo(19)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        settingsButton.snp.makeConstraints {
            $0.trailing.equalTo(self.firstView.snp.trailing).offset(-15)
            $0.height.equalTo(19)
            $0.width.equalTo(19)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        adContainerView.addSubview(adImageView)
        adContainerView.snp.makeConstraints{
            $0.top.equalTo(self.firstView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(71.06)
        }
        
        adImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        chatCollectionView.snp.makeConstraints {
            $0.top.equalTo(adContainerView.snp.bottom).offset(8.94)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    // MARK: - General Helpers
    
    private func register() {
        chatCollectionView.register(
            ChatCollectionViewCell.self,
            forCellWithReuseIdentifier: ChatCollectionViewCell.identifier
        )
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(chatList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * kChatHeight + (heightCount - 1) * kChatLineSpacing + kChatInset.top + kChatInset.bottom
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = chatCollectionView.frame.width
        // let doubleCellWidth = screenWidth - kChatInset.left - kChatInset.right - kChatInterItemSpacing
        return CGSize(width: screenWidth, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kChatLineSpacing
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return kChatInterItemSpacing
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return kChatInset
    }
}

// MARK: -UICollectionViewDataSource

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath)
                as? ChatCollectionViewCell else { return UICollectionViewCell() }
        chatCell.dataBind(model: chatList[indexPath.item])
        return chatCell
    }
    
}

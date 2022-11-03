import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - ChatCollectionViewCell

final class ChatCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ChatCollectionViewCell"
    
    // MARK: - UI Components
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let profileNameLabel = UILabel().then {
        $0.textColor = 0x191919.color
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private let recentChatLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    private let recentChatTimeLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 8, weight: .regular)
    }
    
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

extension ChatCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        [profileContainerView, profileNameLabel, recentChatLabel, recentChatTimeLabel].forEach {
            contentView.addSubview($0)
        }
        
        profileContainerView.addSubview(profileImageView)
        profileContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(41)
        }
        
        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(11)
        }
        
        recentChatLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(profileNameLabel)
        }
        
        recentChatTimeLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameLabel.snp.top)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: ChatModel) {
        profileNameLabel.text = model.profileName
        recentChatLabel.text = model.recentChat
        recentChatTimeLabel.text = model.recentChatTime
        profileImageView.image = UIImage(named: model.profileImage)
    }
}

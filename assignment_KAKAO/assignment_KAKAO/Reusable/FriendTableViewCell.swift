import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - ChatTableViewCell

final class FriendTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "FriendTableViewCell"

    // MARK: - UI Components
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let profileNameLabel = UILabel().then {
        $0.textColor = 0x191919.color
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private let commentLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }

    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension FriendTableViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [profileContainerView, profileNameLabel, commentLabel].forEach {
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
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(profileNameLabel)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: FriendModel) {
        profileNameLabel.text = model.profileName
        commentLabel.text = model.comment
        profileImageView.image = UIImage(named: model.profileImage)
    }
}

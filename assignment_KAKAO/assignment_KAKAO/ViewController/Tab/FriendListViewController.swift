import UIKit

import SnapKit

// MARK: - FriendListViewController

final class FriendListViewController: UIViewController {

    // MARK: - UI Components
    
    private lazy var friendTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        // tableView.separatorColor = .black.withAlphaComponent(0.1)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let firstView = UIView()// "친구", 설정 아이콘
    
    private let friendTextLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"iconSetting"), for: .normal)
        return button
    }()
    
    private let secondView = UIView()
    private let myProfileContainerView = UIView()
    private let myProfileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile_userImg")
    }
    
    private let myProfileNameLabel = UILabel().then {
        $0.text = "김민서"
        $0.textColor = 0x191919.color
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private let myCommentLabel = UILabel().then {
        $0.text = "불닭볶음면"
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    private let line = UILabel().then {
        $0.backgroundColor = .systemGray6
    }
    
    // MARK: - Variables
    
    var friendList: [FriendModel] = [
        // FriendModel(profileImage: "profile_userImg", profileName: "김민서", comment: "불닭볶음면"),
        FriendModel(profileImage: "profileImage1", profileName: "장석우", comment: "여친 구함 ㅋㅋ"),
        FriendModel(profileImage: "profileImage2", profileName: "김인영", comment: "학생~ 안 타~?"),
        FriendModel(profileImage: "profileImage3", profileName: "권정", comment: "알코올 치료가 필요해요"),
        FriendModel(profileImage: "profileImage4", profileName: "최솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage5", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage6", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage7", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage8", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage9", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage4", profileName: "최솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage5", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage6", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage7", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage8", profileName: "정솝트", comment: "살려줘요"),
        FriendModel(profileImage: "profileImage9", profileName: "정솝트", comment: "살려줘요")
    ]
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        register()
        layout()
    }
}

// MARK: - Extensions

extension FriendListViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [firstView, secondView, friendTableView].forEach {
            view.addSubview($0)
        }
        
        [friendTextLabel, settingsButton].forEach {
            firstView.addSubview($0)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        friendTextLabel.snp.makeConstraints {
            $0.leading.equalTo(self.firstView.snp.leading).offset(14)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        settingsButton.snp.makeConstraints {
            $0.trailing.equalTo(self.firstView.snp.trailing).offset(-15)
            $0.height.equalTo(19)
            $0.width.equalTo(19)
            $0.centerY.equalTo(self.firstView.snp.centerY)
        }
        
        [myProfileContainerView, myProfileNameLabel, myCommentLabel, line].forEach {
            secondView.addSubview($0)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(self.firstView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(73)
        }
        
        myProfileContainerView.addSubview(myProfileImageView)
        myProfileContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(58)
        }
        
        myProfileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        myProfileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.leading.equalTo(myProfileContainerView.snp.trailing).offset(11)
        }
        
        myCommentLabel.snp.makeConstraints {
            $0.top.equalTo(myProfileNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(myProfileNameLabel)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * friendList.count)
        }
        
        line.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(17)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - General Helpers
    
    private func register() {
        friendTableView.register(FriendTableViewCell.self,
                                forCellReuseIdentifier: FriendTableViewCell.identifier
        )
    }
}

// MARK: - UITableViewDelegate

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - UITableViewDataSource

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(
            withIdentifier: FriendTableViewCell.identifier, for: indexPath)
                as? FriendTableViewCell else { return UITableViewCell() }
        
        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }
}

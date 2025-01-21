//
//  SocialView.swift
//  PuppyMode
//
//  Created by 김미주 on 07/01/2025.
//

import UIKit

class SocialView: UIView {
    
    private lazy var rankingIcon = UIImageView().then {
        $0.image = .rankingIcon
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var titleLabel = UILabel().then { label in
        label.text = "랭킹"
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
    }
    
    public lazy var segmentView = UISegmentedControl(items: ["전체 랭킹", "친구 랭킹"]).then { seg in
        let customFont = UIFont(name: "NotoSansKR-Medium", size: 16)!
        seg.selectedSegmentIndex = 0
        seg.setTitleTextAttributes([
            NSAttributedString.Key.font: customFont
        ], for: .normal)
    }
    
    public lazy var rankingTableView = UITableView().then {
        $0.rowHeight = UITableView.automaticDimension
        // $0.estimatedRowHeight = 60
        $0.separatorStyle = .none
        $0.sectionHeaderTopPadding = 10
        $0.backgroundColor = .kakaoLogin // UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        $0.rowHeight = 65
        $0.separatorInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        $0.register( RankingTableViewCell.self, forCellReuseIdentifier: RankingTableViewCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(rankingIcon)
        self.addSubview(titleLabel)
        self.addSubview(segmentView)
        self.addSubview(rankingTableView)
        
        rankingIcon.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(titleLabel.snp.leading).offset(-8)
            make.width.height.equalTo(22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        segmentView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(42)
        }
        
        rankingTableView.snp.makeConstraints { make in
            make.top.equalTo(segmentView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
}

#Preview {
    SocialViewController()
}


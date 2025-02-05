//
//  DecorationItemModel.swift
//  PuppyMode
//
//  Created by 김민지 on 1/19/25.
//

import UIKit
import Foundation

// 아이템 카테고리
struct itemKey {
    struct String {
        static let tags = ["모자", "옷", "바닥", "집", "장난감"]
    }
}

// 강아지 레벨
enum DogLevel {
    case level1, level2, level3
}

struct CategoryModel {
    let categoryId: Int
    let items: [DecoItemModel]
}

// struct이면 해당 값을 업데이트한 후 다시 저장하는 방식이 필요
// class면 바로 수정 가능
class DecoItemModel {
    let itemId: Int
    let image: UIImage?
    let price: String
    var isPurchased: Bool
    var mission_item: Bool
    
    // 착용 이미지
    var levelImages: [UIImage?] = [] // 레벨별 이미지 배열
    
    init(itemId: Int, image: UIImage?, price: String, isPurchased: Bool, mission_item: Bool, levelImages: [UIImage?]) {
        self.itemId = itemId
        self.image = image
        self.price = price
        self.isPurchased = isPurchased
        self.mission_item = mission_item
        self.levelImages = levelImages
     }

    
    // 레벨에 따른 착용 이미지를 가져오는 함수
    func image(for level: Int) -> UIImage? {
        guard level >= 0 && level < levelImages.count else { return nil }
        return levelImages[level]
    }
}


extension DecoItemModel {
    // 모자
    static let hatData: [CategoryModel] = [
        CategoryModel(categoryId: 1, items: [
            DecoItemModel(itemId: 1, image: UIImage(named: "머리 위에 무지개"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_머리 위에 무지개"),
            UIImage(named: "level2_머리 위에 무지개"),
            UIImage(named: "level3_머리 위에 무지개")
        ]),
            DecoItemModel(itemId: 2, image: UIImage(named: "머리 위에 별 하나"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_머리 위에 별 하나"),
            UIImage(named: "level2_머리 위에 별 하나"),
            UIImage(named: "level3_머리 위에 별 하나")
        ]),
        DecoItemModel(itemId: 3, image: UIImage(named: "머리 위에 별 세개"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_머리 위에 별 세개"),
            UIImage(named: "level2_머리 위에 별 세개"),
            UIImage(named: "level3_머리 위에 별 세개")
        ]),
        DecoItemModel(itemId: 4, image: UIImage(named: "돌 모자"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_돌 모자"),
            UIImage(named: "level2_돌 모자"),
            UIImage(named: "level3_돌 모자")
        ]),
        DecoItemModel(itemId: 5, image: UIImage(named: "판다 머리띠"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_판다 머리띠"),
            UIImage(named: "level2_판다 머리띠"),
            UIImage(named: "level3_판다 머리띠")
        ]),
      ])
    ]
    
    // 옷
    static let clothesData: [CategoryModel] = [
        CategoryModel(categoryId: 2, items: [
        DecoItemModel(itemId: 6, image: UIImage(named: "붕대"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_붕대"),
            UIImage(named: "level2_붕대"),
            UIImage(named: "level3_붕대")
        ]),
        DecoItemModel(itemId: 7, image: UIImage(named: "밴드"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_밴드"),
            UIImage(named: "level2_밴드"),
            UIImage(named: "level3_밴드")
        ]),
        DecoItemModel(itemId: 8, image: UIImage(named: "이불"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_이불"),
            UIImage(named: "level2_이불"),
            UIImage(named: "level3_이불")
        ]),
        DecoItemModel(itemId: 9, image: UIImage(named: "명품 강아지 옷"), price: "500P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_명품 강아지 옷"),
            UIImage(named: "level2_명품 강아지 옷"),
            UIImage(named: "level3_명품 강아지 옷")
        ]),
        DecoItemModel(itemId: 10, image: UIImage(named: "하늘색 체크 옷"), price: "500P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_하늘색 체크 옷"),
            UIImage(named: "level2_하늘색 체크 옷"),
            UIImage(named: "level3_하늘색 체크 옷")
        ]),
      ])
    ]
    
    // 바닥
    static let floorData: [CategoryModel] = [
        CategoryModel(categoryId: 3, items: [
        DecoItemModel(itemId: 11, image: UIImage(named: "별 다섯개 짜리 돌침대"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_별 다섯개 짜리 돌침대"),
            UIImage(named: "level2_별 다섯개 짜리 돌침대"),
            UIImage(named: "level3_별 다섯개 짜리 돌침대")
        ]),
        DecoItemModel(itemId: 12, image: UIImage(named: "좌변기"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_좌변기"),
            UIImage(named: "level2_좌변기"),
            UIImage(named: "level3_좌변기")
        ]),
        DecoItemModel(itemId: 13, image: UIImage(named: "핑크 집"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_핑크 집"),
            UIImage(named: "level2_핑크 집"),
            UIImage(named: "level3_핑크 집")
        ]),
        DecoItemModel(itemId: 14, image: UIImage(named: "산타 집"), price: "1500P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_산타 집"),
            UIImage(named: "level2_산타 집"),
            UIImage(named: "level3_산타 집")
        ]),
        DecoItemModel(itemId: 15, image: UIImage(named: "텐트"), price: "1500P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_텐트"),
            UIImage(named: "level2_텐트"),
            UIImage(named: "level3_텐트")
        ]),
        DecoItemModel(itemId: 16, image: UIImage(named: "박스"), price: "1500P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_박스"),
            UIImage(named: "level2_박스"),
            UIImage(named: "level3_박스")
        ])
      ])
    ]

    // 집
    static let houseData: [CategoryModel] = [
        CategoryModel(categoryId: 4, items: [
        DecoItemModel(itemId: 17, image: UIImage(named: "무지개 카페트"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_무지개 카페트"),
            UIImage(named: "level2_무지개 카페트"),
            UIImage(named: "level3_무지개 카페트")
        ]),
        DecoItemModel(itemId: 18, image: UIImage(named: "무지개 바다"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_무지개 바다"),
            UIImage(named: "level2_무지개 바다"),
            UIImage(named: "level3_무지개 바다")
        ]),
        DecoItemModel(itemId: 19, image: UIImage(named: "코타츠"), price: "1000P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_코타츠"),
            UIImage(named: "level2_코타츠"),
            UIImage(named: "level3_코타츠")
        ]),
        DecoItemModel(itemId: 20, image: UIImage(named: "코타츠2"), price: "1000P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_코타츠2"),
            UIImage(named: "level2_코타츠2"),
            UIImage(named: "level3_코타츠2")
        ]),
        DecoItemModel(itemId: 21, image: UIImage(named: "귀여운 러그"), price: "1000P", isPurchased: false, mission_item: false, levelImages: [
            UIImage(named: "level1_귀여운 러그"),
            UIImage(named: "level2_귀여운 러그"),
            UIImage(named: "level3_귀여운 러그")
        ]),
        DecoItemModel(itemId: 22, image: UIImage(named: "정수기 생수통"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_정수기 생수통"),
            UIImage(named: "level2_정수기 생수통"),
            UIImage(named: "level3_정수기 생수통")
        ])
      ])
    ]

    // 장난감
    static let toyData: [CategoryModel] = [
        CategoryModel(categoryId: 5, items: [
        DecoItemModel(itemId: 23, image: UIImage(named: "두루마리 휴지"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_두루마리 휴지"),
            UIImage(named: "level2_두루마리 휴지"),
            UIImage(named: "level3_두루마리 휴지")
        ]),
        DecoItemModel(itemId: 24, image: UIImage(named: "소화제"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_소화제"),
            UIImage(named: "level2_소화제"),
            UIImage(named: "level3_소화제")
        ]),
        DecoItemModel(itemId: 25, image: UIImage(named: "링거"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_링거"),
            UIImage(named: "level2_링거"),
            UIImage(named: "level3_링거")
        ]),
        DecoItemModel(itemId: 26, image: UIImage(named: "소주병"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_소주병"),
            UIImage(named: "level2_소주병"),
            UIImage(named: "level3_소주병")
        ]),
        DecoItemModel(itemId: 27, image: UIImage(named: "1.5L 생수병"), price: "", isPurchased: false, mission_item: true, levelImages: [
            UIImage(named: "level1_1.5L 생수병"),
            UIImage(named: "level2_1.5L 생수병"),
            UIImage(named: "level3_1.5L 생수병")
        ])
        ])
    ]
}

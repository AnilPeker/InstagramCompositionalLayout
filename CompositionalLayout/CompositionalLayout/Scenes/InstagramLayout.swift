//
//  InstagramLayout.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 20.09.2021.
//

import UIKit


class InstagramLayout {
    
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (section, env) ->  NSCollectionLayoutSection in
            
            // MARK: - ITEMS
            let tagItem = NSCollectionLayoutItem (
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            let carouselItem = NSCollectionLayoutItem (
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )
            )
            
            let bigItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(2/3),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            let verticalSmallItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            let tripleSmallItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/3),
                    heightDimension: .fractionalHeight(1)
                )
            )
            
            // MARK: - GROUPS
            
            let tagCarouselGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(70),
                    heightDimension: .absolute(20)),
                subitem: tagItem,
                count: 1
            )
            
            let carouselGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)),
                subitem: carouselItem,
                count: 1
            )
            
            let verticalStackGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/3),
                    heightDimension: .fractionalHeight(1)),
                subitem: verticalSmallItem,
                count: 2
            )
            
            let items: [NSCollectionLayoutItem] = [
                bigItem,
                verticalStackGroup
            ]
            
            let horizontalLeftMosaicGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.65)
                ),
                subitems: items
            )
            
            let horizontalRightMosaicGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.65)
                ),
                subitems: items.reversed()
            )
            
            let tripleStackGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(0.35)
                ),
                subitem: tripleSmallItem,
                count: 3)
            
            let verticalMainStackGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(2)
                ),
                subitems: [
                    horizontalLeftMosaicGroup,
                    tripleStackGroup,
                    horizontalRightMosaicGroup,
                    tripleStackGroup
                ]
            )
            
            
            // MARK: - SECTION
            let tagCarouselSection = NSCollectionLayoutSection(group: tagCarouselGroup)
            tagCarouselSection.orthogonalScrollingBehavior = .continuous
            tagCarouselSection.interGroupSpacing = 10
            tagCarouselSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
            
            let carouselSection = NSCollectionLayoutSection(group: carouselGroup)
            carouselSection.orthogonalScrollingBehavior = .groupPaging
            
            let defaultSection = NSCollectionLayoutSection(group: verticalMainStackGroup)
            
            // MARK: - RETURN
            switch section {
            case 0:
                return tagCarouselSection
            case 1:
                return carouselSection
            default:
                return defaultSection
            }
        }
    }
    
}

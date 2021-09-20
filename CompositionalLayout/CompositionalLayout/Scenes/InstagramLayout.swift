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
            
            let section = NSCollectionLayoutSection(group: verticalMainStackGroup)
            
            // MARK: - RETURN
            
            return section
        }
    }
    
}

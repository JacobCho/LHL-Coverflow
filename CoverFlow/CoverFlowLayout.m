//
//  CoverFlowLayout.m
//  CoverFlow
//
//  Created by Jacob Cho on 2014-10-24.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout {
    
    CGSize boundsSize;
    
}


-(void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.itemSize = CGSizeMake(300, 300);
    
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray* attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size   = self.collectionView.bounds.size;
    
    
    CGFloat zoomDistance = visibleRegion.size.width * 0.5;
    
    // Modify the layout attributes as needed here
    
    for (UICollectionViewLayoutAttributes *att in attributes) {
        
        CGFloat distance =
        CGRectGetMidX(visibleRegion) - att.center.x;
        
        CGFloat normalizedDistance = 1.0 - fabs(distance/zoomDistance);

        [att setTransform3D:CATransform3DMakeScale(normalizedDistance, normalizedDistance, normalizedDistance)];
        
        

        
    }
    
    
    return attributes;
    
    
}

@end

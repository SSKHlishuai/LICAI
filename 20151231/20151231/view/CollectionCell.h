//
//  CollectionCell.h
//  20151231
//
//  Created by analysys on 15/12/31.
//  Copyright © 2015年 analysys. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionCellDelegate <NSObject>

@optional
-(void)longgestureEvent:(NSInteger)item withView:(UIView*)bgview;

@end


@interface CollectionCell : UICollectionViewCell

@property (nonatomic, assign) id<CollectionCellDelegate> collectionCellDelegate;

-(void)setCellConfigWithDate:(NSInteger)dateCount withEvent:(NSArray*)showArrays withItem:(NSInteger)item;

-(void)setnull;

@end

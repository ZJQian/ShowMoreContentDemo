//
//  CustomCell.h
//  ShowMoreContentDemo
//
//  Created by ZJQ on 2017/2/9.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <UIKit/UIKit.h>



@class TextModel;
@interface CustomCell : UITableViewCell

typedef void(^ShowTextBlock)(CustomCell *customCell);

@property (nonatomic, strong) TextModel *textModel;
@property (nonatomic, copy) ShowTextBlock showTextBlock;

+ (CGFloat) cellDefautHeight:(TextModel *)model;
+ (CGFloat) cellMoreHeight:(TextModel *)model;

@end

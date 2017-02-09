//
//  TextModel.h
//  ShowMoreContentDemo
//
//  Created by ZJQ on 2017/2/9.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextModel : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign)BOOL isShowMore;

@end

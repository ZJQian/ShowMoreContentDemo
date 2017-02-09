//
//  CustomCell.m
//  ShowMoreContentDemo
//
//  Created by ZJQ on 2017/2/9.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

#import "CustomCell.h"
#import "Define.h"
#import "TextModel.h"
@interface CustomCell ()

{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UIButton *_moreTextBtn;

}

@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 300, 20)];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 35,SCREEN_WIDTH - 30 , 20)];
        _contentLabel.textColor = [UIColor darkGrayColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        _moreTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreTextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _moreTextBtn.frame = CGRectMake(SCREEN_WIDTH - 50, 5, 60, 20);
        _moreTextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_moreTextBtn setTitle:@"more" forState:UIControlStateNormal];
        [_moreTextBtn setTitle:@"less" forState:UIControlStateSelected];
        [self.contentView addSubview:_moreTextBtn];
        [_moreTextBtn addTarget:self action:@selector(showMoreText:) forControlEvents:UIControlEventTouchUpInside];
        
        self.textModel.isShowMore = NO;
    }
    return self;
}

- (void)setTextModel:(TextModel *)textModel {

    _textModel = textModel;
    _titleLabel.text = textModel.title;
    _contentLabel.text = textModel.content;
    
    if (textModel.isShowMore) {
        CGFloat height = [CustomCell getStringHeight:self.textModel.content font:15];
        _contentLabel.frame = CGRectMake(15, 35, SCREEN_WIDTH-30, height);
        _moreTextBtn.selected = YES;
    }else{
    
        _contentLabel.frame = CGRectMake(15, 35, SCREEN_WIDTH-30, 20);
        _moreTextBtn.selected = NO;
    }
}

- (void)showMoreText:(UIButton *)sender{

    self.textModel.isShowMore = !self.textModel.isShowMore;
    
    if (self.showTextBlock) {
        self.showTextBlock(self);
    }
    
}

+ (CGFloat)getStringHeight:(NSString *)string font:(CGFloat)fontSize {

    CGRect rect = [string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];

    return ceil(rect.size.height);
}

+ (CGFloat) cellDefautHeight:(TextModel *)model {

    return 60;
}

+ (CGFloat) cellMoreHeight:(TextModel *)model {
    
    return [CustomCell getStringHeight:model.content font:15]+35;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

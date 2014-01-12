//
//  TSPacosCell.m
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSPacosCell.h"

@implementation TSPacosCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // cellの向きと色の設定
        CGAffineTransform t = CGAffineTransformMakeRotation(M_PI_2);
        self.transform = t;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 実際に表示されるviewの設定
        self.containerView = [[UIView alloc] initWithFrame:frame];
        self.containerView.backgroundColor = [UIColor whiteColor];
        self.containerView.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetWidth(frame));
        self.containerFrame = self.containerView.frame;
        self.containerView.center = CGPointMake(CGRectGetWidth(self.containerView.frame) / 2,
                                                CGRectGetHeight(self.containerView.frame) / 2);
        [self addSubview:self.containerView];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - transform

// アニメーションの設定
- (void)setContainerScale:(float)val
{
    float scale = [self scaleForCellDistance:val];
    CGPoint center = self.containerView.center;
    self.containerView.layer.frame = CGRectMake(self.containerView.frame.origin.x,
                                                self.containerView.frame.origin.y,
                                                CGRectGetWidth(self.containerFrame) * scale,
                                                CGRectGetHeight(self.containerFrame) * scale);
    self.containerView.layer.position = center;
}

# pragma mark - 評価関数

// アニメーション時に利用する、cellのサイズを決める関数
- (float)scaleForCellDistance:(float)theValue
{
    return (1 - fabs(theValue) / 3);
}

@end

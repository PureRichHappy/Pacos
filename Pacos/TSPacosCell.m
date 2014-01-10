//
//  TSPacosCell.m
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSPacosCell.h"

@implementation TSPacosCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        CGAffineTransform t = CGAffineTransformMakeRotation(M_PI_2);
        self.transform = t;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - transform

- (void)setContainerScale:(float)val
{
    float scale = [self scaleForCellDistance:val];
    CGPoint center = self.containerView.center;
    self.containerView.layer.frame = CGRectMake(self.containerView.frame.origin.x,
                                                self.containerView.frame.origin.y,
                                                CGRectGetWidth([[UIScreen mainScreen] bounds]) * scale,
                                                CGRectGetHeight([[UIScreen mainScreen] bounds]) * scale);
    self.containerView.layer.position = center;
    NSLog(@"%f", self.containerView.layer.position.y);
}

# pragma mark - 評価関数

- (float)scaleForCellDistance:(float)theValue
{
    return (1 - fabs(theValue) / 3);
}

@end

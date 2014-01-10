//
//  TSPacosTableView.m
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSPacosTableView.h"

@implementation TSPacosTableView


+ (TSPacosTableView *)createPacosWithFrame:(CGRect)frame delegate:(id)delegate
{
    TSPacosTableView *pacos = [[self alloc] initWithFrame:frame];
    pacos.delegate = delegate;
    pacos.dataSource = delegate;
    [pacos setCenter:CGPointMake(frame.origin.x, frame.origin.y)];
    pacos.separatorStyle = UITableViewCellSeparatorStyleNone;
    return pacos;
}

- (id)initWithFrame:(CGRect)frame
{
    CGRect rect = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetWidth(frame));
    self = [super initWithFrame:rect];
    if (self) {
        [self recline];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self recline];
    }
    return self;
}

- (void)recline
{
    CGAffineTransform t  = CGAffineTransformMakeRotation(-M_PI_2);
    self.transform = t;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.backgroundColor = [UIColor clearColor];
}

- (int)getCurrentPage
{
    int page = self.contentOffset.y / self.frame.size.height;
    return page;
}

- (float)getCenterY
{
    return self.contentOffset.y + 160;
}

-(float)getDistance:(UITableViewCell *)cell
{
    float centerY = [self getCenterY];
    float distance = (centerY - cell.center.y) / 320;
    return distance;
}

@end

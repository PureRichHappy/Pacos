//
//  TSViewController.h
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSPacosTableView.h"

@interface TSPacosViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) TSPacosTableView *tableView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) CGRect myFrame;
@property (nonatomic, assign) float containerScale;

- (id)initWithFrame:(CGRect)frame;

@end

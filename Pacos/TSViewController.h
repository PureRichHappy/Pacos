//
//  TSViewController.h
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSPacosTableView.h"

@interface TSViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) TSPacosTableView *tableView;
@property (nonatomic, strong) NSArray *items;
@end

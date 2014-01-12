//
//  TSPacosTableView.h
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSPacosTableView : UITableView

+ (TSPacosTableView *)createPacosWithFrame:(CGRect)frame delegate:(id)delegate;

- (int)getCurrentPage;
- (float)getDistance:(UITableViewCell*)cell;

@end

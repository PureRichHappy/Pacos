//
//  TSContentsViewController.h
//  Pacos
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSContentsViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *contentsLabel;
@property (nonatomic, strong) IBOutlet UITableView *contentsTableView;
@property (nonatomic, strong) NSDictionary *item;

@end

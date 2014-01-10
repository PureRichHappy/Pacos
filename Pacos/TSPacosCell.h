//
//  TSPacosCell.h
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSPacosCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (void)setContainerScale:(float)val;

@end

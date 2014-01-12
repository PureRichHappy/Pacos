//
//  TSContentsViewController.m
//  Pacos
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSContentsViewController.h"

@interface TSContentsViewController ()

@end

@implementation TSContentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *title = [self.item valueForKey:@"title"];
    self.contentsLabel.text = title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  TSViewController.m
//  Pacos
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSViewController.h"
#import "TSContentsViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    TSPacosViewController *vc = [[TSPacosViewController alloc] initWithFrame:CGRectMake(0,
                                                                                        0,
                                                                                        CGRectGetWidth(self.containerView.frame),
                                                                                        CGRectGetHeight(self.containerView.frame))];
    vc.delegate = self;
    self.items = @[@{@"title" : @"1"},
                   @{@"title" : @"2"},
                   @{@"title" : @"3"},
                   @{@"title" : @"4"},
                   @{@"title" : @"5"},
                   @{@"title" : @"6"}];
    vc.items = self.items;
    // cellに表示されるviewのサイズ（TSPacosViewControllerのviewサイズに対する割合）指定
    vc.containerScale = 0.9;
    [self addChildViewController:vc];
    [self.containerView addSubview:vc.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - pacos delegate

- (UIViewController *)setContainerViewController:(TSPacosViewController *)pacosViewController indexPath:(NSIndexPath *)indexPath
{
    TSContentsViewController *contentsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contents"];
    contentsViewController.item = self.items[indexPath.row];
    return contentsViewController;
}

@end

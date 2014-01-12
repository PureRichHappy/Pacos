//
//  TSViewController.m
//  Pacos
//
//  Created by 清 貴幸 on 2014/01/09.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "TSPacosViewController.h"
#import "TSPacosCell.h"

@interface TSPacosViewController ()

@end

@implementation TSPacosViewController

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.myFrame = frame;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // カスタムtableviewの作成
    self.view.frame = self.myFrame;
    self.tableView = [TSPacosTableView createPacosWithFrame:CGRectMake(0,
                                                                       0,
                                                                       CGRectGetWidth(self.myFrame),
                                                                       CGRectGetHeight(self.myFrame))
                                                   delegate:self];
    self.tableView.center = self.view.center;

    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Unselect the selected row if any
    NSIndexPath *selection = [self.tableView indexPathForSelectedRow];
    if (selection) {
        [self.tableView deselectRowAtIndexPath:selection animated:YES];
    }
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    //        The scrollbars won't flash unless the tableview is long enough.
    [self.tableView flashScrollIndicators];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // カスタムCellの横幅を返す
    return CGRectGetWidth(self.view.frame);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // カスタムCellの呼び出し
    static NSString *CellIdentifier = @"TSPacosCell";
    TSPacosCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UIViewController *vc = [self.delegate setContainerViewController:self
                                                           indexPath:indexPath];
    if (cell == nil) {
        cell = [[TSPacosCell alloc] initWithFrame:CGRectMake(0,
                                                             0,
                                                             CGRectGetHeight(self.tableView.frame),
                                                             CGRectGetWidth(self.tableView.frame))
                                   containerScale:self.containerScale
                                     contentsView:vc.view];
    }
    [self addChildViewController:vc];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.tableView flashScrollIndicators];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scroll view delegate

// セルへのエフェクトをかける
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (TSPacosCell *cell in [self.tableView visibleCells]) {
        float distance = [self.tableView getDistance:cell];
        [cell setContainerScale:distance];
    }
}

#pragma mark - origin method

- (CGSize)getCellContainerViewSize
{
    return CGSizeMake(CGRectGetWidth(self.view.frame) * self.containerScale,
                      CGRectGetHeight(self.view.frame) * self.containerScale);
}

@end

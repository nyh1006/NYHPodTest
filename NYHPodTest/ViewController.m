//
//  ViewController.m
//  NYHPodTest
//
//  Created by greenspiderios on 2019/6/19.
//  Copyright © 2019 NYH. All rights reserved.
//

#import "ViewController.h"
#import "NYHEmptyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NYHEmptyView *emptyView = [NYHEmptyView nyh_emptyView];
    emptyView.frame = self.view.bounds;
    emptyView.dataType = NYHRequestErrorType;
    [self.view addSubview:emptyView];
}


@end

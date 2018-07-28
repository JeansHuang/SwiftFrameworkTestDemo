//
//  ViewController.m
//  OCTestDemo
//
//  Created by JeansHuang on 2018/7/28.
//  Copyright © 2018 JeansHuang. All rights reserved.
//

#import "ViewController.h"
@import SwiftHello;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SwiftHello *h = [[SwiftHello alloc]init];
    [h hello];
    
    [h startListening];
}


@end

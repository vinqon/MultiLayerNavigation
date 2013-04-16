//
//  ViewController.m
//  MultiLayerNavigation
//
//  Created by Feather Chan on 13-4-12.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "ViewController.h"
#import "MLNavigationController.h"
#import "MLScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 280, 280)]autorelease];
    label.text = [NSString stringWithFormat:@"%d",self.navigationController.viewControllers.count];
    label.font = [UIFont systemFontOfSize:250];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *button = [[[UIButton alloc]initWithFrame:CGRectMake(50, 240, 220, 50)]autorelease];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"Push a new controller" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [NSString stringWithFormat:@"No.%d Page",self.navigationController.viewControllers.count];
    
    UILabel *textView = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 180)]autorelease];
    textView.font = [UIFont systemFontOfSize:12];
    textView.text = @"Introduction:\n MultiLayerNavigation helps you implemntation the interaction -- 'drag to back' in a easy way.\n The only one thing you need to do is replacing your UINavigationController with the MLNavigation Controller. \n In addtion, if there are a scroll view in your ViewController, you need to do one more thing -- replace the UIScrollView with MLScrollView or inherit it, that's all.";
    textView.numberOfLines = 0;

    
    MLScrollView *scrollView = [[[MLScrollView alloc]initWithFrame:CGRectMake(0,300,320,140)]autorelease];
    scrollView.contentSize = CGSizeMake(320, 200);
    scrollView.userInteractionEnabled = YES;
    [scrollView addSubview:textView];
    [self.view addSubview:scrollView];
    
}

- (void)pressBtn:(UIButton *)sender
{

    ViewController *vc = [[[ViewController alloc]init]autorelease];
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    NSLog(@"view move");
}


@end

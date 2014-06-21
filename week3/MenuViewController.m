//
//  MenuViewController.m
//  week3
//
//  Created by Christine Chao on 6/21/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *menuImage = [UIImage imageNamed:@"menu"];
    UIImageView *menuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    menuImageView.image = menuImage;
    
    [self.view addSubview:menuImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

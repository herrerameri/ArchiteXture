//
//  ViewController.m
//  ArchiteXture
//
//  Copyright © 2017 Mariana Herrera. All rights reserved.

#import "RingProfile_VC.h"
#import "UIViewRingProfile.h"

@interface RingProfile_VC ()
{
    UIViewRingProfile* ringProfile;
    
    NSArray* RINGS;
}
@end

@implementation RingProfile_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    RINGS = [NSArray arrayWithObjects:@"HAPPI", @"FANCY", nil];
    UIViewRingProfile *ringView;
    CGFloat deviceWidth = self.view.frame.size.width;
    CGFloat deviceHeight = self.view.frame.size.height;
    
    for (int i = 0; i < RINGS.count; i++) {
        CGRect frame = CGRectMake(i * deviceWidth, 0, deviceWidth, deviceHeight);
        ringView = [[UIViewRingProfile alloc] initWithRingName:RINGS[i] andFrame: frame];
        [_scrContainer addSubview:ringView];
    }
    
    CGFloat widthScrollJewel = ringView.bounds.size.width;
    CGFloat heightScrollJewel = ringView.bounds.size.height;
    
    [_scrContainer setContentSize:CGSizeMake(widthScrollJewel * RINGS.count,
                                             heightScrollJewel)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

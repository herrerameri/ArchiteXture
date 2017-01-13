//
//  UIViewRingProfile.h
//  ArchiteXture
//
//  Copyright © 2017 Mariana Herrera. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIViewRingProfile : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imgTitle;
@property (strong, nonatomic) IBOutlet UIScrollView *scrCarrousel;
@property (strong, nonatomic) IBOutlet UIImageView *imgInfo;
@property (strong, nonatomic) IBOutlet UIImageView *imgImages;
@property (strong, nonatomic) IBOutlet UIImageView *imgProduct;
@property (strong, nonatomic) IBOutlet UIScrollView *scrProduct;
@property (strong, nonatomic) IBOutlet UIImageView *imgMap;
@property (strong, nonatomic) IBOutlet UIScrollView *scrContainer;
@property (strong, nonatomic) IBOutlet UIImageView *imgBlur;
@property (strong, nonatomic) IBOutlet UIImageView *imgBack;
@property (strong, nonatomic) IBOutlet UIImageView *imgSmallTItle;
@property (strong, nonatomic) IBOutlet UIImageView *imgBigTitle;

- (id)initWithRingName: (NSString*)ringName andFrame: (CGRect)frame;

@end

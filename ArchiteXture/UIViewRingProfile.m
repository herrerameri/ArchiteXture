
#import "UIViewRingProfile.h"

@implementation UIViewRingProfile
float deviceHeight = 0;

- (id)initWithRingName: (NSString*)ringName andFrame: (CGRect)frame {
    self = [[[NSBundle mainBundle] loadNibNamed:@"UIViewRingProfile" owner:self options:nil] objectAtIndex:0];
    
    [self initInfo: ringName];
    [self initScrolls: ringName];
    [self initMenu: ringName];
    deviceHeight = frame.size.height;
    
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    _scrContainer.delegate = self;
    return self;
}

-(void) initInfo: (NSString*) ringName{
    NSString* title = [NSString stringWithFormat:@"%@.png", ringName];
    NSString* back = [NSString stringWithFormat:@"%@00.jpg", ringName];
    NSString* blur = [NSString stringWithFormat:@"%@19.jpg", ringName];
    NSString* info = [NSString stringWithFormat:@"%@_INFO_AN.png", ringName];
    NSString* map = [NSString stringWithFormat:@"%@_MAP.jpg", ringName];
    
    UIImage* imgTitle = [UIImage imageNamed:title inBundle:nil
              compatibleWithTraitCollection:nil];
    UIImage* imgBack = [UIImage imageNamed:back inBundle:nil compatibleWithTraitCollection:nil];
    UIImage* imgBlur = [UIImage imageNamed:blur inBundle:nil compatibleWithTraitCollection:nil];
    UIImage* imgMap = [UIImage imageNamed:map inBundle:nil compatibleWithTraitCollection:nil];
    UIImage* imgInfo = [UIImage imageNamed:info inBundle:nil compatibleWithTraitCollection:nil];
    
    [_imgTitle setImage: imgTitle];
    [_imgBack setImage: imgBack];
    [_imgBlur setImage: imgBlur];
    [_imgInfo setImage: imgInfo];
    [_imgMap setImage: imgMap];
    
    float heightInfo = _imgInfo.frame.size.height;
    [_scrContainer setContentSize:CGSizeMake(self.frame.size.width, [[UIScreen mainScreen] bounds].size.height + heightInfo + 70)];
    
    [_imgBlur setAlpha:0];
    [_imgBack setAlpha:1];
}

-(void) initScrolls : (NSString*) ringName {
    NSString* images = [NSString stringWithFormat:@"%@_TIRA_IMATGES.png", ringName];
    NSString* product = [NSString stringWithFormat:@"%@_PRODUCT.png", ringName];
    UIImage* imgProduct = [UIImage imageNamed:product inBundle:nil compatibleWithTraitCollection:nil];
    UIImage* imgImages = [UIImage imageNamed:images inBundle:nil compatibleWithTraitCollection:nil];
    
    [_imgImages setImage: imgImages];
    [_imgProduct setImage: imgProduct];
    [_scrProduct setContentSize:CGSizeMake(_imgProduct.bounds.size.width, _imgProduct.bounds.size.height)];
    [_scrCarrousel setContentSize:CGSizeMake(_imgImages.bounds.size.width, _imgImages.bounds.size.height)];
}

-(void) initMenu : (NSString*) ringName{
    
    NSString* bigTitleName = [NSString stringWithFormat:@"%@_TITLE_BIG.png", ringName];
    NSString* smallTitleName = [NSString stringWithFormat:@"%@_TITLE_SMALL.png", ringName];
    
    UIImage* imgBigTitle = [UIImage imageNamed:bigTitleName inBundle:nil compatibleWithTraitCollection:nil];
    UIImage* imgSmallTitle = [UIImage imageNamed:smallTitleName inBundle:nil compatibleWithTraitCollection:nil];
        
    [_imgBigTitle setImage: imgBigTitle];
    [_imgSmallTItle setImage: imgSmallTitle];
    [_imgSmallTItle setAlpha:0];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    float alpha =  1-(scrollView.contentOffset.y/deviceHeight);
   
        [_imgBlur setAlpha: fabsf(alpha - 1)];
    
    
    if(scrollView.contentOffset.y <= ([[UIScreen mainScreen] bounds].size.height)*0.5)
    {
        [_imgSmallTItle setAlpha:0];
        [_imgBigTitle setAlpha:1];
    }
    else
    {
        [_imgSmallTItle setAlpha:1];
        [_imgBigTitle setAlpha:0];
    }
}

@end

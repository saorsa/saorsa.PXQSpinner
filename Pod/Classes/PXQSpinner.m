////////////////////////////////////////////////////////////////////////////
//
//  PXQSpinner.m
//  Pods
//
//  Created by Dragolov,Atanas on 24.03.15.
//
////////////////////////////////////////////////////////////////////////////
#import "PXQSpinner.h"

@interface PXQSpinner ()

@property (nonatomic, strong) UILabel * textLabel;

@property (nonatomic, strong) CAShapeLayer * backgroundLayer;

@property (atomic, assign) BOOL isSpinning;

@end

@implementation PXQSpinner

@synthesize textLabel = _textLabel;

#pragma mark -
#pragma mark Properties

- (NSString *)titleText {
    
    return [self.textLabel.text copy];
}

- (void)setTitleText:(NSString *)titleText {
    
    self.textLabel.text = [titleText isKindOfClass:[NSString class]] ? [titleText copy] : @"";
}

- (UIFont *)titleFont {
    
    return self.textLabel.font;
}

- (void)setTitleFont:(UIFont *)titleFont {
    
    self.textLabel.font = [titleFont isKindOfClass:[UIFont class]] ? titleFont : [UIFont systemFontOfSize:18.0f];
}

#pragma mark -
#pragma mark View Hierarchy 

+ (instancetype)setOnView:(UIView *)view withTitle:(NSString *)title animated:(BOOL)animated {
    
    PXQSpinner *hud = [[[self class] alloc] initWithFrame:CGRectMake(40, 40, 40, 40)];
    
    //You can add an image to the center of the spinner view
    //    UIImageView *img = [[UIImageView alloc] initWithFrame:GMD_SPINNER_IMAGE];
    //    img.image = GMD_IMAGE;
    //    hud.center = img.center;
    //    [hud addSubview:img];
    
    hud.titleText = title;
    
    [hud start];
    
    [view addSubview:hud];
    
    float height = [[UIScreen mainScreen] bounds].size.height;
    
    float width = [[UIScreen mainScreen] bounds].size.width;
    
    CGPoint center = CGPointMake(width/2, height/2);
    
    hud.center = center;
    
    return hud;
}

+ (PXQSpinner *)hideFromView:(UIView *)view animated:(BOOL)animated {
    
    PXQSpinner *hud = [PXQSpinner HUDForView:view];
    
    [hud stop];
    
    if (hud) {
    
        [hud removeFromSuperview];
        
        return hud;
    }
    
    return nil;
}

+ (PXQSpinner *)HUDForView: (UIView *)view {
    
    PXQSpinner *hud = nil;
    
    NSArray *subViewsArray = view.subviews;
    
    Class hudClass = [PXQSpinner class];
    
    for (UIView *aView in subViewsArray) {
    
        if ([aView isKindOfClass:hudClass]) {
        
            hud = (PXQSpinner *)aView;
        }
    }
    return hud;
}

#pragma mark - 
#pragma mark Initialization

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    [self setup];
    
    return self;
}

- (instancetype)init {
    
    self = [super init];
    
    [self setup];
    
    return self;
}

#pragma mark -
#pragma mark Setup

- (void)setup {

    //
    //  Background rotation animation layer
    //
    
    self.backgroundColor = [UIColor clearColor];
    
    _lineWidth = fmaxf(self.frame.size.width * 0.025, 1.f);
    
    self.backgroundLayer = [CAShapeLayer layer];
    
    _backgroundLayer.strokeColor =  [UIColor colorWithRed:0.129 green:0.455 blue:0.627 alpha:1.0].CGColor;
    
    _backgroundLayer.fillColor = self.backgroundColor.CGColor;
    
    _backgroundLayer.lineCap = kCALineCapRound;
    
    _backgroundLayer.lineWidth = _lineWidth;
    
    [self.layer addSublayer:_backgroundLayer];
    
    //
    //  Text label
    //
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-70.0f, 40.0f, 200.0f, 42.0f)];
    
    label.font = [UIFont boldSystemFontOfSize:18.0f];
    
    label.textColor = [UIColor colorWithRed:0.129 green:0.455 blue:0.627 alpha:1.0];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.text = @"";
    
    self.textLabel = label;
    
    [self addSubview:label];
}

- (void)drawRect:(CGRect)rect {
    
    _backgroundLayer.frame = self.bounds;
}

#pragma mark -
#pragma mark Drawing

- (void)drawBackgroundCircle:(BOOL) partial {
    
    CGFloat startAngle = - ((float)M_PI / 2); // 90 Degrees
    
    CGFloat endAngle = (2 * (float)M_PI) + startAngle;
    
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    CGFloat radius = (self.bounds.size.width - _lineWidth)/2;
    
    //
    // Begin draw background
    //
    
    UIBezierPath *processBackgroundPath = [UIBezierPath bezierPath];
    processBackgroundPath.lineWidth = _lineWidth;
    
    //
    // Make end angle to 90% of the progress
    //
    
    if (partial) {
        
        endAngle = (1.8f * (float)M_PI) + startAngle;
    }
    
    [processBackgroundPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    _backgroundLayer.path = processBackgroundPath.CGPath;
}

#pragma mark - 
#pragma mark Animation Spin

- (void)start {
    
    if ( ! self.isSpinning ) {
        
        self.isSpinning = YES;
        
        [self drawBackgroundCircle:YES];
        
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
        
        rotationAnimation.duration = 1;
        
        rotationAnimation.cumulative = YES;
        
        rotationAnimation.repeatCount = HUGE_VALF;
        
        [_backgroundLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
}

- (void)stop{
    
    if ( self.isSpinning ) {
        
        [self drawBackgroundCircle:NO];
        
        [_backgroundLayer removeAllAnimations];
        
        self.isSpinning = NO;
    }
}

@end

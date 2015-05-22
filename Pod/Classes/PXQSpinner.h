////////////////////////////////////////////////////////////////////////////
//
//  PXQSpinner.h
//  Pods
//
//  Created by Dragolov,Atanas on 24.03.15.
//
////////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/**
    Represents a view similar to @seealso UIActivityIndicator
 */
@interface PXQSpinner : UIView

#pragma mark -
#pragma mark UI Outlets

/**
    The subview label displaying the spinner text.
 */
@property (nonatomic, strong, readonly) UILabel * textLabel;

/**
    The sublayer used to display the spinning animation.
 */
@property (nonatomic, strong, readonly) CAShapeLayer * backgroundLayer;

#pragma mark -
#pragma mark UI Customization

/**
    Gets or sets the width / thickness of the spinner.
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
    Gets or sets the tint color of the spinner.
 */
@property (nonatomic, assign) UIColor * lineTintColor;

/**
    Gets or sets the text being displayed 'below' the spinning animation.
 */
@property (nonatomic, copy) NSString * titleText;

/**
    Gets or sets the font of the text being displayed 'below' the spinning animation.
 */
@property (nonatomic, strong) UIFont * titleFont;

/**
    Gets or sets the font of the color of the text being displayed 'below' the spinning animation.
 */
@property (nonatomic, strong) UIColor * titleColor;


#pragma mark -
#pragma mark Rotation

/**
    Starts the spinner animation.
 */
- (void)start;

/**
    Stops the spinner animation.
 */
- (void)stop;

#pragma mark -
#pragma mark Initialization

+ (instancetype)setOnView:(UIView *)view withTitle:(NSString *)title animated:(BOOL)animated;

+ (PXQSpinner *)hideFromView:(UIView *)view animated:(BOOL)animated;

@end

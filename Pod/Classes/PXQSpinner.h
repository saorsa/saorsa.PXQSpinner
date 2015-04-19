////////////////////////////////////////////////////////////////////////////
//
//  PXQSpinner.h
//  Pods
//
//  Created by Dragolov,Atanas on 24.03.15.
//
////////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>

@interface PXQSpinner : UIView

@property (nonatomic, strong, readonly) UILabel * textLabel;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) UIColor * lineTintColor;

@property (nonatomic, copy) NSString * titleText;

@property (nonatomic, strong) UIFont * titleFont;

- (void)start;

- (void)stop;

+ (instancetype)setOnView:(UIView *)view withTitle:(NSString *)title animated:(BOOL)animated;

+ (PXQSpinner *)hideFromView:(UIView *)view animated:(BOOL)animated;

@end

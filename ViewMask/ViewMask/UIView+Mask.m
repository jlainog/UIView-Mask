@import ObjectiveC.runtime;
#import "UIView+Mask.h"

static char imgMaskKey;
static char maskLayerKey;

@interface UIView ()
@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation UIView (Mask)

#pragma -
#pragma UIView

- (void)layoutSubviews {
    if (self.maskLayer && self.imgMask) {
        CGRect frame;
        
        frame.origin.x = (CGRectGetWidth(self.bounds) - self.imgMask.size.width) / 2;
        frame.origin.y = (CGRectGetHeight(self.bounds) - self.imgMask.size.height) / 2;
        frame.size = self.imgMask.size;
        self.maskLayer.frame = frame;
    }
}

#pragma -
#pragma UIView+Mask

- (UIImage *)imgMask {
    return objc_getAssociatedObject(self, &imgMaskKey);
}

- (void)setImgMask:(UIImage *)imgMask {
    if (imgMask)
        [self viewWithMask:imgMask];
    
    objc_setAssociatedObject(self, &imgMaskKey, imgMask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CALayer *)maskLayer {
    return  objc_getAssociatedObject(self, &maskLayerKey);
}

- (void)setMaskLayer:(CALayer *)maskLayer {
    objc_setAssociatedObject(self, &maskLayerKey, maskLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma -
#pragma UIView+Mask Private Methods

- (void)viewWithMask:(UIImage *)maskImage {
    CGRect frame;
    CALayer *maskingLayer = [CALayer layer];
    
    frame.origin.x = (CGRectGetWidth(self.bounds) - maskImage.size.width) / 2;
    frame.origin.y = (CGRectGetHeight(self.bounds) - maskImage.size.height) / 2;
    frame.size = maskImage.size;
    maskingLayer.frame = frame;
    [maskingLayer setContents:(id)[maskImage CGImage]];
    [self.layer setMask:maskingLayer];
    self.maskLayer = maskingLayer;
}

@end


#import "VerticalCenterCell.h"

@implementation VerticalCenterCell

- (NSRect)drawingRectForBounds:(NSRect)theRect{
    // Get the parent's idea of where we should draw
    NSRect newRect = [super drawingRectForBounds:theRect];
    
    // When the text field is being
    // edited or selected, we have to turn off the magic because it screws up
    // the configuration of the field editor.  We sneak around this by
    // intercepting selectWithFrame and editWithFrame and sneaking a
    // reduced, centered rect in at the last minute.
    
    // Get our ideal size for current text
    NSSize textSize = [self cellSizeForBounds:theRect];
    
    // Center that in the proposed rect
    float heightDelta = newRect.size.height - textSize.height;
    if (heightDelta > 0){
        newRect.size.height -= heightDelta;
        newRect.origin.y += round(heightDelta / 2);
    }
    return newRect;
}

// if the text field is only used in xib, this method can be omitted
- (void)drawInteriorWithFrame:(NSRect)cellFrame
                       inView:(NSView*)controlView{
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(cellFrame, 0, 0) xRadius:0 yRadius:0];
    path.lineWidth = 1;
    
    NSColor *fillColor = [NSColor whiteColor];
    NSColor *borderColor = [NSColor grayColor];
    
    [fillColor setFill];
    [borderColor setStroke];
    
    [path fill];
    [path stroke];
    
    [super drawInteriorWithFrame:cellFrame inView:controlView];
}

@end

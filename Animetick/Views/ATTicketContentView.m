//
//  ATTicketContentView.m
//  Animetick
//
//  Created by yayugu on 2013/10/19.
//  Copyright (c) 2013年 yayugu. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>
#import "ATTicketContentView.h"
#import "ATTicket.h"

static const CGFloat ATTicketContentViewTitleTopMargin = 10;
static const CGFloat ATTicketContentViewRightPadding = 5;
static const CGFloat ATTicketContentViewLeftPadding = 5;

@implementation ATTicketContentView

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    [self drawTitleWithContext:context];
    

    
    /*
    {
    // フォント属性を設定して文字列を生成
    CTFontRef font = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 20.f, NULL);
    CFStringRef keys[] = { kCTFontAttributeName };
    CFTypeRef values[] = { font };
    CFDictionaryRef attributes = CFDictionaryCreate(kCFAllocatorDefault, (const void**)&keys,
                                                    (const void**)&values, sizeof(keys) / sizeof(keys[0]),
                                                    &kCFTypeDictionaryKeyCallBacks,
                                                    &kCFTypeDictionaryValueCallBacks);
    CFAttributedStringRef attrString = CFAttributedStringCreate(kCFAllocatorDefault, CFSTR("吾輩は猫である。"), attributes);
    CFRelease(font);
    CFRelease(attributes);
    // 文字列を渡してCTLineを生成
    CTLineRef line = CTLineCreateWithAttributedString(attrString);
    CFRelease(attrString);
    // 描画
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetTextPosition(ctx, 10.0, 10.0);
    CTLineDraw(line, ctx);
    CFRelease(line);
    }
    */
}

- (void)drawTitleWithContext:(CGContextRef)context;
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat leftPaddingSum = self.icon.frame.origin.x + self.icon.frame.size.width + ATTicketContentViewLeftPadding;
    CGRect bounds = (CGRect) {
        .origin.x = leftPaddingSum,
        .origin.y = ATTicketContentViewTitleTopMargin * -1,
        .size.width = self.bounds.size.width - leftPaddingSum - ATTicketContentViewRightPadding,
        .size.height = self.bounds.size.height,
    };
    CGPathAddRect(path, NULL, bounds);
    CFStringRef textString = (__bridge CFStringRef)self.ticket.title;
    
    CTFontRef font = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 15.0, NULL);
    CFStringRef keys[] = { kCTFontAttributeName };
    CFTypeRef values[] = { font };
    CFDictionaryRef attributes = CFDictionaryCreate(kCFAllocatorDefault, (const void**)&keys,
                                                    (const void**)&values, sizeof(keys) / sizeof(keys[0]),
                                                    &kCFTypeDictionaryKeyCallBacks,
                                                    &kCFTypeDictionaryValueCallBacks);
    CFAttributedStringRef attrString = CFAttributedStringCreate(kCFAllocatorDefault, textString, attributes);
    CFRelease(attributes);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attrString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                                                CFRangeMake(0, CFAttributedStringGetLength(attrString)),
                                                path,
                                                NULL);
    
    CTFrameDraw(frame, context);
    
    CFRelease(attrString);
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}

@end

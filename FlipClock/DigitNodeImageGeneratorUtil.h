//
//  DigitNodeImageGeneratorUtil.h
//  FlipClock
//
//  Created by Jonathan Salvador on 2/12/17.
//  Copyright © 2017 Jonathan Salvador. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DigitMedianDrawType) {
    kDigitMedianDrawTypeAM,
    kDigitMedianDrawTypePM
};

@interface DigitNodeImageGeneratorUtil : NSObject

+ (NSImage *)drawString:(NSString *)string withFont:(NSFont *)font andBackgroundColour:(NSColor *)backgroundColour;

+ (NSImage *)drawMedianWithType:(DigitMedianDrawType)type withFont:(NSFont *)font andBackgroundColour:(NSColor *)backgroundColour;

@end

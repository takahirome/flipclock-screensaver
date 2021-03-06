//The MIT License (MIT) Copyright (c) <2013> <Jonathan Salvador>
//
//Permission is hereby granted, free of charge, to any person obtaining a
//copy of this software and associated documentation files (the
//"Software"), to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be included
//in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  DigitAnimationDelegate.m
//  ClockDemo
//
//  Created by Jonathan Salvador on 1/24/13.
//  Copyright (c) 2013 Jonathan Salvador. All rights reserved.
//

#import "DigitAnimationDelegate.h"
#import "DigitAnimationModel.h"
#import "SCNPlane+FlipClock.h"
#import "DigitNode.h"

@implementation DigitAnimationDelegate


- (void)animationDidStart:(CAAnimation *)theAnimation{
    
    //update topHalf
    [self.animationModel.topHalf applyMaterialWithName:[NSString stringWithFormat:@"%@_top", self.animationModel.texturePrefix]];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    
    
    if(flag){

        //update bottomHalf
        [self.animationModel.bottomHalf applyMaterialWithName:[NSString stringWithFormat:@"%@_bot", self.animationModel.texturePrefix]];
        
        //Nil the NSImages in the given material array
        for (SCNNode* __strong currentNode in self.animationModel.flipNode.childNodes) {
            
            SCNPlane *currentPlane =  (SCNPlane *) currentNode.geometry;
            [currentPlane clearMaterials];
            currentPlane = nil;
        }
        
        for(SCNNode* __strong currentNode in self.animationModel.flipNode.childNodes){
            [currentNode cleanupAndRemoveFromParentNode];
            currentNode = nil;
        }
        
        //remove flipper
        [self.animationModel.flipNode cleanupAndRemoveFromParentNode];
        self.animationModel.flipNode = nil;
        
        self.animationModel = nil;
    }
}

@end

//
//  NSString+Category.h
//  DeepIntoCategory
//
//  Created by ronglei on 15/4/29.
//  Copyright (c) 2015年 ronglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

@property (nonatomic, strong) NSString *associateObj;

- (NSString *)removeWhiteSpace;

@end

//
//  NSString+Category.m
//  DeepIntoCategory
//
//  Created by ronglei on 15/4/29.
//  Copyright (c) 2015年 ronglei. All rights reserved.
//

#import "NSString+Category.h"
#import <objc/runtime.h>

@implementation NSString (Category)
static char *kassociateKey = "kassociateKey";

- (NSString *)associateObj
{
    return objc_getAssociatedObject(self, &kassociateKey);
}

- (void)setAssociateObj:(NSString *)associateObj
{
    objc_setAssociatedObject(self, &kassociateKey, associateObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 移除字符串中间的空格
- (NSString *)removeWhiteSpace
{
    // Scanner
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSMutableString *result = [[NSMutableString alloc] init];
    NSString *temp;
    NSCharacterSet*newLineAndWhitespaceCharacters = [NSCharacterSet whitespaceCharacterSet];
    // Scan
    while (![scanner isAtEnd]) {
        
        // Get non new line or whitespace characters
        temp = nil;
        [scanner scanUpToCharactersFromSet:newLineAndWhitespaceCharacters intoString:&temp];
        if (temp) [result appendString:temp];
        
        // Replace with a space
        if ([scanner scanCharactersFromSet:newLineAndWhitespaceCharacters intoString:NULL]) {
            if (result.length > 0 && ![scanner isAtEnd]) // Dont append space to beginning or end of result
                [result appendString:@" "];
        }
    }
    
    // Return
    return result;
}

@end

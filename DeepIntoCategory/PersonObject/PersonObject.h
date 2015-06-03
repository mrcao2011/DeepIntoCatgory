//
//  PersonObject.h
//  DeepIntoCategory
//
//  Created by ronglei on 15/4/30.
//  Copyright (c) 2015年 ronglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonObject : NSObject

@property (nonatomic, strong, readonly) NSString *firstName;
@property (nonatomic, strong, readonly) NSString *lastName;
@property (nonatomic, strong, readonly) NSArray *friends;

- (id)initWithFirstName:(NSString *)firstName
            andLastName:(NSString *)lastName;

@end

// 用类扩展将类的@interface声明代码分割到几个文件中 这样再添加方法的时候可以分类添加防止类的文件过大 难于管理
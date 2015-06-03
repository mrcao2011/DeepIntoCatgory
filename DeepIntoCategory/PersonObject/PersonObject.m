//
//  PersonObject.m
//  DeepIntoCategory
//
//  Created by ronglei on 15/4/30.
//  Copyright (c) 2015年 ronglei. All rights reserved.
//

#import "PersonObject.h"
#import "PersonObject+Life.h"
#import "PersonObject+Work.h"
#import "PersonObject+Friendlist.h"

@implementation PersonObject

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    
    return self;
}

- (id)initWithFirstName:(NSString *)firstName
            andLastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        [self isFriendWith:nil];
    }
    
    return self;
}
@end

@implementation PersonObject(Friendlist)
- (void)addFriend:(PersonObject *)person
{
    
}

- (void)removeFriend:(PersonObject *)person
{
    
}

- (BOOL)isFriendWith:(PersonObject *)person
{
    BOOL isFriend = YES;
    
    return isFriend;
}
@end

@implementation PersonObject(Work)

- (void)performDaysWork;
{
    
}

- (void)takeVacationFromWork
{
    
}

@end

@implementation PersonObject(Life)

- (void)goToTheCinema
{
    
}

- (void)goShopping
{
    
}

@end

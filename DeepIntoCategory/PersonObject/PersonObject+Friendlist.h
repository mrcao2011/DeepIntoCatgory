//
//  PersonObject+Friendlist.h
//  DeepIntoCategory
//
//  Created by ronglei on 15/4/30.
//  Copyright (c) 2015年 ronglei. All rights reserved.
//

#import "PersonObject.h"

@interface PersonObject (Friendlist)

- (void)addFriend:(PersonObject *)person;
- (void)removeFriend:(PersonObject *)person;
- (BOOL)isFriendWith:(PersonObject *)person;

@end

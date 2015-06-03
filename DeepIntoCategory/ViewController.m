//
//  ViewController.m
//  DeepIntoCategory
//
//  Created by ronglei on 15/4/29.
//  Copyright (c) 2015年 ronglei. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Category.h"
#import "PersonObject+Work.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController
static char kAssociateArrayKey;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *string = [[NSString alloc] init];
    [string setAssociateObj:[NSString stringWithFormat:@"i am in %@", [self class]]];
    NSLog(@"\n%@", string.associateObj);
    
    [self associateSet];
    [self associateGet];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)associateSet
{
    if (_array == nil) {
        _array = [[NSArray alloc] initWithObjects:@"1", nil];
    }
    NSString *string = [[NSString alloc] initWithFormat:@"associate sting in %@", [self class]];
    // 建立关联对象
    objc_setAssociatedObject(_array, &kAssociateArrayKey, string, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)associateGet
{
    // 访问关联对象
    // 通过被关联者的地址查询关联对象映射列表(ObjectAssociationMap) 再通过关联对象key找到关联对象
    NSString *associateStr = objc_getAssociatedObject(_array, &kAssociateArrayKey);
    NSLog(@"\n%@\n", associateStr);
    
    // 断开关联
//    objc_setAssociatedObject(_array, &kAssociateArrayKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

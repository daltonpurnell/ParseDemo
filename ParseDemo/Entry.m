//
//  Entry.m
//  ParseDemo
//
//  Created by Dalton on 5/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"



@import Parse;

static NSString * const entryClassName = @"Entry";


@implementation Entry

@dynamic name;


+ (NSString *)parseClassName {
    
    return entryClassName;
}

@end

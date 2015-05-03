//
//  Entry.h
//  ParseDemo
//
//  Created by Dalton on 5/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@import Parse;



@interface Entry : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name;


@end

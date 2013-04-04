//
//  NSDictionary+JSON.m
//
//  Created by Steven Sheldon on 4/4/13.
//  Copyright (c) 2013 Steven Sheldon. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (id)objectMaybeNilForKey:(id)key {
  id object = [self objectForKey:key];
  return ([object isEqual:[NSNull null]] ? nil : object);
}

@end

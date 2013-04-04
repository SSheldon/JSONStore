//
//  JSONStore.m
//
//  Created by Steven Sheldon on 4/4/13.
//  Copyright (c) 2013 Steven Sheldon. All rights reserved.
//

#import "JSONStore.h"

NSString * const JSONStoreType = @"JSON";

@implementation JSONStore

+ (void)initialize {
  [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:JSONStoreType];
}

#pragma mark - NSIncrementalStore

- (BOOL)loadMetadata:(NSError **)error {
  self.metadata = @{
    NSStoreUUIDKey: [[NSProcessInfo processInfo] globallyUniqueString],
    NSStoreTypeKey: JSONStoreType,
  };
  return YES;
}

@end

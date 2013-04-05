//
//  JSONStore.m
//
//  Created by Steven Sheldon on 4/4/13.
//  Copyright (c) 2013 Steven Sheldon. All rights reserved.
//

#import "JSONStore.h"

@implementation JSONStore

+ (void)initialize {
  [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self storeType]];
}

+ (NSString *)storeType {
  return NSStringFromClass(self);
}

#pragma mark - NSIncrementalStore

- (BOOL)loadMetadata:(NSError **)error {
  self.metadata = @{
    NSStoreUUIDKey: [[NSProcessInfo processInfo] globallyUniqueString],
    NSStoreTypeKey: [[self class] storeType],
  };
  return YES;
}

@end

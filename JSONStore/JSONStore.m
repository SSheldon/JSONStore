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

- (NSArray *)IDStringsForObjectsWithEntityName:(NSString *)name {
  return nil;
}

- (id)executeFetchRequest:(NSFetchRequest *)request
              withContext:(NSManagedObjectContext *)context
                    error:(NSError **)error {
  NSArray *idStrings = [self IDStringsForObjectsWithEntityName:request.entityName];
  NSMutableArray *results = [NSMutableArray array];
  for (NSString *idString in idStrings) {
    NSManagedObjectID *objectID = [self newObjectIDForEntity:request.entity referenceObject:idString];
    if (request.resultType == NSManagedObjectIDResultType) {
      [results addObject:objectID];
    } else if (request.resultType == NSManagedObjectResultType) {
      [results addObject:[context objectWithID:objectID]];
    }
  }
  return results;
}

#pragma mark - NSIncrementalStore

- (BOOL)loadMetadata:(NSError **)error {
  self.metadata = @{
    NSStoreUUIDKey: [[NSProcessInfo processInfo] globallyUniqueString],
    NSStoreTypeKey: [[self class] storeType],
  };
  return YES;
}

- (id)executeRequest:(NSPersistentStoreRequest *)request
         withContext:(NSManagedObjectContext *)context
               error:(NSError **)error {
  switch (request.requestType) {
    case NSFetchRequestType:
      return [self executeFetchRequest:(NSFetchRequest *)request withContext:context error:error];
  }
  return nil;
}

@end

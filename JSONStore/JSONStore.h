//
//  JSONStore.h
//
//  Created by Steven Sheldon on 4/4/13.
//  Copyright (c) 2013 Steven Sheldon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface JSONStore : NSIncrementalStore

+ (NSString *)storeType;

- (NSArray *)IDStringsForObjectsWithEntityName:(NSString *)name;
- (NSDictionary *)JSONDictionaryForObjectWithEntityName:(NSString *)name IDString:(NSString *)idString;

@end

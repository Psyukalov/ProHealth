//
//  DataManager.h
//  ProHealth
//
//  Created by Vladimir Psyukalov on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (instancetype) init __attribute__((unavailable("init is not available; use sharedManager instead")));
+ (instancetype)sharedManager;

@end

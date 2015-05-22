//
//  Note.h
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "_Notebook.h"

@interface Notebook : _Notebook

+ (instancetype) notebookWithContext:(NSManagedObjectContext *)context title:(NSString *)title;

@end

//
//  PARNotesViewController.h
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import UIKit;
#import "CoreDataTableViewController.h"
#import "Notebook.h"
@interface PARNotesViewController : CoreDataTableViewController

@property (strong, nonatomic) Notebook *notebook;

@end

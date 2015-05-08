//
//  PARNotesViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARNotesViewController.h"
#import "Note.h"

#define CELL_ID @"NoteCell"
@interface PARNotesViewController ()

@end

@implementation PARNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    Note *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = note.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    cell.detailTextLabel.text = [dateFormatter stringFromDate:note.creationDate];
    return cell;
}
@end

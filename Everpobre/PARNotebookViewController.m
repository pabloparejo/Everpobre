//
//  PARNotebookViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 22/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARNotebookViewController.h"
#import "Notebook.h"
#import "AppDelegate.h"

#define CELL_ID @"NOTEBOOK_CELL"

@interface PARNotebookViewController ()

@end

@implementation PARNotebookViewController


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
    Notebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = notebook.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    cell.detailTextLabel.text = [dateFormatter stringFromDate:notebook.creationDate];
    return cell;
}
- (IBAction)newNotebook:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    [Notebook notebookWithContext:[appDelegate managedObjectContext] title:@"New Notebook"];
}

@end

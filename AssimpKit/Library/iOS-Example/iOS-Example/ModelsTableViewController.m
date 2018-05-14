//

/*
 ---------------------------------------------------------------------------
 Assimp to Scene Kit Library (AssimpKit)
 ---------------------------------------------------------------------------
 Copyright (c) 2016, Deepak Surti, Ison Apps, AssimpKit team
 All rights reserved.
 Redistribution and use of this software in source and binary forms,
 with or without modification, are permitted provided that the following
 conditions are met:
 * Redistributions of source code must retain the above
 copyright notice, this list of conditions and the
 following disclaimer.
 * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the
 following disclaimer in the documentation and/or other
 materials provided with the distribution.
 * Neither the name of the AssimpKit team, nor the names of its
 contributors may be used to endorse or promote products
 derived from this software without specific prior
 written permission of the AssimpKit team.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ---------------------------------------------------------------------------
 */

#import "ModelsTableViewController.h"
@import AssimpKit;
#import "AnimationsTableViewController.h"
#import "iOS_Example-Swift.h"

@interface ModelsTableViewController ()

@property (nonatomic, strong) ModelsController *controller;

@end

@implementation ModelsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.controller = [[ModelsController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return self.controller.modelFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"modelViewCell"
                                        forIndexPath:indexPath];

    // Configure the cell...
    cell.textLabel.text = [self.controller.modelFiles objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Common for both segues: skipModelSegue_ID, showAnimsSegue_ID
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    AnimationsTableViewController *animsVC =
        (AnimationsTableViewController *)segue.destinationViewController;
    animsVC.controller = self.controller;
    if ([segue.identifier isEqualToString:@"showAnimsSegue_ID"])
    {
        self.controller.currentModelPath = [self.controller filePathAt:indexPath.row];
    }
}

@end

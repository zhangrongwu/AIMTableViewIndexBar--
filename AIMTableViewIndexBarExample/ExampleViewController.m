

#import "ExampleViewController.h"
#import "AIMTableViewIndexBar.h"

@interface ExampleViewController ()<
UITableViewDataSource,
UITableViewDelegate,
AIMTableViewIndexBarDelegate>{
    __weak IBOutlet AIMTableViewIndexBar    *indexBar;
    __weak IBOutlet UITableView             *plainTableView;
    
    NSArray *sections;
    NSArray *rows;
}

@end

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    sections = @[@"A", @"D", @"F", @"M", @"N", @"O", @"Z"];
    
    rows = @[@[@"adam", @"alfred", @"ain", @"abdul", @"anastazja", @"angelica"],
             @[@"dennis" , @"deamon", @"destiny", @"dragon", @"dry", @"debug", @"drums"],
             @[@"Fredric", @"France", @"friends", @"family", @"fatish", @"funeral"],
             @[@"Mark", @"Madeline"],
             @[@"Nemesis", @"nemo", @"name"],
             @[@"Obama", @"Oprah", @"Omen", @"OMG OMG OMG", @"O-Zone", @"Ontario"],
             @[@"Zeus", @"Zebra", @"zed"]];
    
    indexBar.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    [indexBar setIndexes:sections]; // to always have exact number of sections in table and indexBar
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [rows[section] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return sections[section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"TableViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell.textLabel setText:rows[indexPath.section][indexPath.row]];
    return cell;
}

#pragma mark - AIMTableViewIndexBarDelegate
- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index{
    NSLog(@"___%ld", (long)index);
    if ([plainTableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [plainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}


@end








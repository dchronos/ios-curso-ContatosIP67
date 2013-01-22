//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3144 on 18/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"


@implementation ListaContatosViewController
@synthesize contatos = _contatos;

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contatos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *vi = @"pdc";
    Contato *c = [self.contatos objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:vi];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: vi];
    }
    
    cell.textLabel.text = c.nome;
    return cell;
}
-(void)viewWillAppear:(BOOL)animated
{
    //[super viewWillAppear:animated];
    NSLog(@"lista %@", self.contatos.description);
    [self.tableView reloadData];
}

-(id) init
{
    self = [super init];
    if(self){
        self.navigationItem.title = @"contatos";
    }
    /*UIBarButtonSystemItemAdd eh uma constante*/
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
    target:self
    action:@selector(chamaFormulario)];
    self.navigationItem.rightBarButtonItem = btn;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    return self;
}
- (void) chamaFormulario{
    NSLog(@"chamou");
    FormularioContatoViewController *formulario = [[FormularioContatoViewController alloc] init];
    formulario.contatos = _contatos;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:formulario];
    //[self presentModalViewController:formulario animated:YES];
    [self presentViewController:nav animated:YES completion:nil];
}




@end

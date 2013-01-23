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
@synthesize linhaDestaque;

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
    FormularioContatoViewController *formulario = [[FormularioContatoViewController alloc] init];
    formulario.contatos = _contatos;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:formulario];
    //[self presentModalViewController:formulario animated:YES];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithContato: contato];
    form.contatos = self.contatos;
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
    NSLog(@"didSelect %@", contato.nome);
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatos removeObjectAtIndex:indexPath.row];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)contatoAdicionado:(Contato *)contato
{
    
}
-(void)contatoAlterado:(Contato *)contato
{
    self.linhaDestaque = [self.contatos indexOfObject:contato];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:linhaDestaque inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    self.linhaDestaque = -1;
}

-(void)viewDidLoad
{
    UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    [self.tableView addGestureRecognizer:lp];
}

-(void)exibeMaisAcoes:(UIGestureRecognizer *) gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan){
        CGPoint point = [gesture locationInView:self.tableView];
        NSIndexPath *ip = [self.tableView indexPathForRowAtPoint:point];
        Contato *c = [self.contatos objectAtIndex:ip.row];
        NSLog(@"Contato %@", c);
        UIActionSheet *folhaAcoes = [[UIActionSheet alloc] initWithTitle:c.nome delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Email", @"Site", @"Mapa", nil];
        [folhaAcoes showInView:self.view];
    }
}



@end

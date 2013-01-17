//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3144 on 16/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation FormularioContatoViewController
@synthesize fieldNome;
@synthesize fieldTelefone;
@synthesize fieldEmail;
@synthesize fieldEndereco;
@synthesize fieldSite;

- (IBAction)criarContato:(id)sender
{
    
    Contato *c = [[Contato alloc] init];
    c.nome = fieldNome.text;
    c.telefone = fieldTelefone.text;
    c.email = fieldEmail.text;
    c.endereco = fieldEndereco.text;
    c.site = fieldSite.text;
    
    /** Usando Dicionario
    NSMutableDictionary *c = [[NSMutableDictionary alloc] init];
    [c setObject:fieldNome.text forKey:@"nome"];
    [c setObject:fieldTelefone.text forKey:@"telefone"];
    [c setObject:fieldEmail.text forKey:@"email"];
    [c setObject:fieldEndereco.text forKey:@"endereco"];
    [c setObject:fieldSite.text forKey:@"fieldSite"];
    */
    NSLog(@"Contato adicionado: %@", c.description);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setFieldNome:nil];
    [self setFieldTelefone:nil];
    [self setFieldEmail:nil];
    [self setFieldEndereco:nil];
    [self setFieldSite:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

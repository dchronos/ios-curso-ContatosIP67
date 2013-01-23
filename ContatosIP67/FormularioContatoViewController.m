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
@synthesize contatos = _contatos;
@synthesize contato = _contato;
@synthesize delegate = _delegate;

- (void)pegaDadosDoFormulario
{
    if(!_contato){
        self.contato = [[Contato alloc] init];
    }
    self.contato.nome = self.fieldNome.text;
    self.contato.telefone = self.fieldTelefone.text;
    self.contato.email = self.fieldEmail.text;
    self.contato.endereco = self.fieldEndereco.text;
    self.contato.site = self.fieldSite.text;
    /** Usando Dicionario
    NSMutableDictionary *c = [[NSMutableDictionary alloc] init];
    [c setObject:fieldNome.text forKey:@"nome"];
    [c setObject:fieldTelefone.text forKey:@"telefone"];
    [c setObject:fieldEmail.text forKey:@"email"];
    [c setObject:fieldEndereco.text forKey:@"endereco"];
    [c setObject:fieldSite.text forKey:@"fieldSite"];
    */
}
- (void)adicionaContato
{
    [self pegaDadosDoFormulario];
    NSLog(@"Adiciona");
    [_contatos addObject:self.contato];
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)alteraContato
{
    [self pegaDadosDoFormulario];
    NSLog(@"Alterar");
    [self.delegate contatoAlterado:self.contato];
    [self.navigationController popViewControllerAnimated:YES];
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)atualizaContato
{
    
}

- (IBAction)proximoElemento:(UITextField *)campoAtual
{
    if(campoAtual == self.fieldNome){
        [self.fieldTelefone becomeFirstResponder];
    }
    else if(campoAtual == self.fieldTelefone){
        [self.fieldEmail becomeFirstResponder];
    }
    else if(campoAtual == self.fieldEmail){
        [self.fieldEndereco becomeFirstResponder];
    }
    else if(campoAtual == self.fieldEndereco){
        [self.fieldSite becomeFirstResponder];
    }
    else if(campoAtual == self.fieldSite){
        if(!self.contato){
            [self adicionaContato];
        }
        else{
            [self alteraContato];
        }
    }
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
    if (self.contato) {
        self.fieldNome.text = _contato.nome;
        self.fieldTelefone.text = _contato.telefone;
        self.fieldEmail.text = _contato.email;
        self.fieldEndereco.text = _contato.endereco;
        self.fieldSite.text = _contato.site;
    }
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

- (id)init
{
    self = [super init];
    if(self){
        self.navigationItem.title = @"Formulario";
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
        target:self
        action:@selector(chamaLista)];
        self.navigationItem.leftBarButtonItem= btn;
    }
    return self;
}

- (id)initWithContato: (Contato *)contato
{
    self = [super init];
    if (self) {
        self.contato = contato;
    }
    return self;
}

-(void)chamaLista
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

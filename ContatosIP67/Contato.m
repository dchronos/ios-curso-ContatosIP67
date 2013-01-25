//
//  Contato.m
//  ContatosIP67
//
//  Created by ios3144 on 16/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato
@dynamic nome;
@dynamic telefone;
@dynamic email;
@dynamic endereco;
@dynamic site;
//@dynamic foto;
@dynamic latitude;
@dynamic longitude;

- (NSString *)description
{
    return [NSString stringWithFormat:@"nome: %@ telefone: %@",self.nome, self.telefone];
}
-(CLLocationCoordinate2D) coordinate{
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}
-(NSString *) title{
    return self.nome;
}
-(NSString *) subtitle{
    return self.email;
}
@end

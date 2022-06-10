# Propósito: crear infraestructura AWS
# Autor: DH
# Fecha: 30.07.21
# Versión: 1.0
# ==================================================================

# ==================================================================
# Creamos nuestro VPC
# usamos el bloque "resource", el "provider element" y una "etiqueta"
# le pasamos por variable el CIDR block que quiero que use
resource "aws_vpc" "Main" {
    cidr_block = var.main_vpc_cidr
    instance_tenancy = "default"
    tags = {
        Name = "My_VPC"
    }
}
# ==================================================================
# Creamos un Internet Gateway "Y" lo asociamos al VPC que se acaba de crear
# Internet Gateway
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.Main.id
    tags = {
        Name = "IGW"
    }
}
# ==================================================================
# Creamos la subnet pública
resource "aws_subnet" "public_subnets" {
    vpc_id = aws_vpc.Main.id
    cidr_block = var.public_subnets
    tags = {
        Name = "Public Subnet"
    }
}
# ==================================================================
# Creamos la subnet privada
resource "aws_subnet" "private_subnets" {
    vpc_id = aws_vpc.Main.id
    cidr_block = var.private_subnets
    tags = {
        Name = "Private Subnet"
    }
}
# ==================================================================
# Tabla de ruteo para la subnet pública
resource "aws_route_table" "Public_RT" {
    vpc_id = aws_vpc.Main.id
    route {
        cidr_block = "0.0.0.0/0"
        # Declaramos el tráfico desde la subnet pública llega a Internet desde el Internet Gateway
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
        Name = "Tabla de Ruteo Pública"
    }
}
# ==================================================================
# Tabla de ruteo para la subnet privada
resource "aws_route_table" "Private_RT" {
    vpc_id = aws_vpc.Main.id
    route {
        cidr_block = "0.0.0.0/0"
        # Tráfico proveniente desde la subnet privadas llegando a Internet vía NAT Gateway
        nat_gateway_id = aws_nat_gateway.NAT_GW.id
    }
    tags = {
        Name = "Tabla de Ruteo Privada"
    }
}
# ==================================================================
# Asociación de tabla de ruteo con la subnet pública
resource "aws_route_table_association" "Public_RT_Association" {
    subnet_id = aws_subnet.public_subnets.id
    route_table_id = aws_route_table.Public_RT.id
}
# Asociación de tabla de ruteo con la subnet privada
resource "aws_route_table_association" "Private_RT_Association" {
    subnet_id = aws_subnet.private_subnets.id
    route_table_id = aws_route_table.Private_RT.id
}
resource "aws_eip" "NAT_EIP" {
    vpc = true
    tags = {
        Name = "NAT con elastic IP"
    }
}
# ==================================================================
# Creación del NAT Gateway usando subnet_id y allocation_id
resource "aws_nat_gateway" "NAT_GW" {
    allocation_id = aws_eip.NAT_EIP.id
    subnet_id = aws_subnet.public_subnets.id
    tags = {
        Name = "NAT Gateway alocada a la subnet pública"
    }
}
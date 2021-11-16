//la lista de clientes.
let arrayCuentas = [
    {
      nroCuenta: 5486273622,
      tipoDeCuenta: "Cuenta Corriente",
      saldoEnPesos: 27771,
      titularCuenta: "Abigael Natte",
    },
    {
      nroCuenta: 1183971869,
      tipoDeCuenta: "Caja de Ahorro",
      saldoEnPesos: 8675,
      titularCuenta: "Ramon Connell",
    },
    {
      nroCuenta: 9582019689,
      tipoDeCuenta: "Caja de Ahorro",
      saldoEnPesos: 27363,
      titularCuenta: "Jarret Lafuente",
    },
    {
      nroCuenta: 1761924656,
      tipoDeCuenta: "Cuenta Corriente",
      saldoEnPesos: 32415,
      titularCuenta: "Ansel Ardley",
    },
    {
      nroCuenta: 7401971607,
      tipoDeCuenta: "Cuenta Unica",
      saldoEnPesos: 18789,
      titularCuenta: "Jacki Shurmer",
    },
  ];
  // podes continuar tu codigo a partir de aca!
  
  // punto 2
  let banco = {
      clientes : arrayCuentas ,
      
      consultarCliente : function(nombre){
          for (let i=0; i<arrayCuentas.length; i++){
              if (arrayCuentas[i].titularCuenta === nombre){
                  return arrayCuentas[i];
              }
          }
      },
  
      deposito : function(titular, dinero){
          let sumaDinero = 0;
          for (let i=0; i<arrayCuentas.length; i++){
              if (arrayCuentas[i].titularCuenta === titular){
                  sumaDinero = arrayCuentas[i].saldoEnPesos + dinero;
              }
          }
          return "Depósito realizado, su nuevo saldo es:" + sumaDinero;
      },
  
      extraccion : function(titular, montoARetirar){
          let nuevoSaldo = 0;
          for (let i=0; i<arrayCuentas.length; i++){
              if (arrayCuentas[i].titularCuenta === titular){
                  if (montoARetirar>arrayCuentas[i].saldoEnPesos){
                      return "Fondos insuficientes";
                  }
                  else{
                      nuevoSaldo = arrayCuentas[i].saldoEnPesos - montoARetirar;
                      return "Extracción realizada correctamente, su nuevo saldo es:" + nuevoSaldo;
                  }
              }
          }
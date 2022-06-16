const jsonHelper = require('./jsonHelper');

const concesionaria = {
	autos: jsonHelper.leerArchivo('AUTOS'),

	agregarAuto: function (marca, modelo, anio, precio, patente) {
		let nuevoAuto = {
			marca: marca,
			modelo: modelo,
			anio: anio,
			precio: precio,
			patente: patente,
			vendido: false,
		};
		this.autos.push(nuevoAuto);
		jsonHelper.escribirArchivo('AUTOS', this.autos);
        return 'Vehículo agregado correctamente';
	},

	venderAuto: function (patente) {
		for (let i = 0; i < this.autos.length; i++) {
			let seleccionado = this.autos[i];
			if (seleccionado.patente === patente) {
				seleccionado.vendido = true;
			}
		}
		jsonHelper.escribirArchivo('AUTOS', this.autos);
        return `El vehículo: ${seleccionado.marca} ${seleccionado.modelo} ha sido vendido.`;
	},

	totalVentas: function () {
		let total = 0;
		for (let i = 0; i < this.autos.length; i++) {
			const auto = this.autos[i];
			if (auto.vendido) {
				total += auto.precio;
			}
		}
		return `El total de ventas es ${total}`;
	},

	eliminarAuto: function (patente) {
        let message = '';
		for (let i = 0; i < this.autos.length; i++) {
			const auto = this.autos[i];
			if (auto.patente === patente) {
				let indice = this.autos.indexOf(auto);
				this.autos.splice(indice, 1);
                message = `El vehículo ${auto.marca}`;
			}
		}
		jsonHelper.escribirArchivo('AUTOS', this.autos);
        return `El vehículo: ${seleccionado.marca} ${seleccionado.modelo} ha sido eliminado correctamente.`;
	},
};
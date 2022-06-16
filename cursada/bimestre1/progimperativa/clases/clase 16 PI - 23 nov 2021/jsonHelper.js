const fs = require("fs");

const jsonHelper = {
  leerArchivo: function (nombreArchivo) {
    return JSON.parse(
      fs.readFileSync(`${__dirname}/${nombreArchivo}.json`, "utf8")
    );
  },
  escribirArchivo: function (nombreArchivo, datos) {
    fs.writeFileSync(
      `${__dirname}/${nombreArchivo}.json`,
      JSON.stringify(datos)
    );
  },
};

module.exports = jsonHelper;
const fs = require("fs");

const jsonHelper = {
  leerJson: function (nombreArchivo) {
    return JSON.parse(
      fs.readFileSync(__dirname + "/" + nombreArchivo + ".json", "UTF-8")
    );
  },
  escribirJson: function (nombreArchivo, datos) {
    return fs.writeFileSync(
      __dirname + "/" + nombreArchivo + ".json",
      JSON.stringify(datos,null,2)
    );
  },
};

module.exports = jsonHelper;

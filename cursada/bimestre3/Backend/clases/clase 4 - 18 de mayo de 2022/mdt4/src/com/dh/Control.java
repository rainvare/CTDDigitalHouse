package com.dh;

public abstract class Control {
    protected Control siguienteControl;

    public Control() {
        siguienteControl = null;
    }

    public void setSiguienteControl(Control siguienteControl) {
        this.siguienteControl = siguienteControl;
    }

    public abstract String comprobar(Articulo articulo);
}

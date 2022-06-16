import React, { Component } from "react";
import './App.css';
import Order from "./components/Order";

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mostrar: true,
    };
    this.cancelOrder = this.cancelOrder.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
  }

  cancelOrder() {
    this.setState({ mostrar: false });
    console.log("Cancelando pedido...");
  }

  placeOrder() {
    this.setState({ mostrar: true });
    console.log("Haciendo pedido...");
  }

  render() {
    return (
      <div className="App">
        {this.state.mostrar ? <Order/> : ""}
        <button type="button" onClick={this.cancelOrder}>
          Cancelar pedido
        </button>
        <button type="button" onClick={this.placeOrder}>
          Hacer pedido
        </button>
      </div>
    );
  }
}

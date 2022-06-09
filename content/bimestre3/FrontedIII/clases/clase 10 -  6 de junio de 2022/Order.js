import React, { Component } from "react";

export default class Order extends Component {

    constructor(props) {
        super(props);
        this.state = {
            comida: "",
        };
    }

    componentDidMount() {
        setTimeout(() => {
            this.setState({ comida: "Pizzas" });
        }, 2000);
    }

    componentDidUpdate() {
        console.log("¡El componente se actualizó!");
    }

    componentWillUnmount() {
        alert("Tu pedido ha sido cancelado.");
    }

    render() {
        return (
            <h1>
                Tu pedido: {this.state.comida} 
            </h1>
        );
    }
}

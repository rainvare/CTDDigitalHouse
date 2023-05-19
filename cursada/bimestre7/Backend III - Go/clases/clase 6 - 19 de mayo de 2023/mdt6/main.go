package main

import (
	"fmt"
)

const (
	CREDIT_CARD = "Credit Card"
	BANK_TRANSFER = "Bank Transfer"
	CASH = "Cash"
)

type PaymentMethod interface {
	Pay(purchase *Purchase) float64
}

type Purchase struct {
	Price float64
}

func (p *Purchase) SetPrice(value float64) {
	p.Price = value
}

type CreditCard struct{}

func (c *CreditCard) Pay(purchase *Purchase) float64 {
	return purchase.Price * 1.10
}

type BankTransfer struct {}

func (b *BankTransfer) Pay(purchase *Purchase) float64 {
	return purchase.Price
}

type Cash struct{}

func (m *Cash) Pay(purchase *Purchase) float64 {
	return purchase.Price * 0.95
}

func Process(paymentMethod string) (PaymentMethod, error) {
	switch paymentMethod {
		case CREDIT_CARD: return &CreditCard{}, nil
		case BANK_TRANSFER: return &BankTransfer{}, nil
		case CASH: return &Cash{}, nil
	}
	return nil, fmt.Errorf("payment method does not exist. try again")
}

func main() {
	newPurchase := Purchase{}
	newPurchase.SetPrice(10.0)

	methodCreditCardSelected, err := Process("Credit Card"); if err != nil {
		fmt.Println(err)
		return
	}

	methodBankTransferSelected, err := Process("Bank Transfer"); if err != nil {
		fmt.Println(err)
		return
	}

	methodCashSelected, err := Process("Cash"); if err != nil {
		fmt.Println(err)
		return
	}

	_, err = Process("Ticket")

	fmt.Println("METHOD PAYMENT CREDIT CARD SELECTED. FINAL VALUE:", methodCreditCardSelected.Pay(&newPurchase))
	fmt.Println("METHOD PAYMENT CREDIT CARD SELECTED. FINAL VALUE:", methodBankTransferSelected.Pay(&newPurchase))
	fmt.Println("METHOD PAYMENT CREDIT CARD SELECTED. FINAL VALUE:", methodCashSelected.Pay(&newPurchase))
	fmt.Println("METHOD PAYMENT NON EXISTENT SELECTED. FINAL VALUE:", err.Error())
}
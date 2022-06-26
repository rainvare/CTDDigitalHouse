package digital.house.flyweight;

import digital.house.flyweight.dto.Computer;
import digital.house.flyweight.factory.ComputerFactory;

public class Application {

	static int CANVAS_SIZE = 500;

	public static void main(String[] args) {

		ComputerFactory computer = new ComputerFactory();
		Computer mac1 = computer.getComputer(16, 500);
		Computer windows = computer.getComputer(2, 256);
		Computer mac2 = computer.getComputer(16, 500);

		System.out.println(mac2.toString());
		System.out.println(mac1.toString());
		System.out.println(windows.toString());

	}
}
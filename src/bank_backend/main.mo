import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
	var currentValue: Float = 300;
	currentValue := 300; 
	stable var startTime = Time.now();
	// startTime := Time.now();

	let id = 236565656;

	// Debug.print(debug_show(currentValue));

	public func topUp(amount: Float)
	{
		currentValue := currentValue + amount;
		Debug.print(debug_show(currentValue));
	};
 
	public func withdraw(amount: Float)
	{
		let temp: Float = currentValue - amount;
		if (temp >= 0)
		{
			currentValue := currentValue - amount;
			Debug.print(debug_show(currentValue));
		}
		else 
		{
			Debug.print("Amount too large. currentValue will less than zero!")
		}
	};

	public query func checkBalance(): async Float
	{
		return currentValue;
	};

	public func compound()
	{
		let currentTime = Time.now();
		var timeCollapse = currentTime - startTime;
		timeCollapse := timeCollapse / 1000000000;
		currentValue := currentValue * (1.01 ** Float.fromInt(timeCollapse));

		startTime := currentTime;
	};

}






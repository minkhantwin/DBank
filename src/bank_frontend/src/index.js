import { bank_backend as dbank } from "../../declarations/bank_backend/index";
window.addEventListener("load", async function () {
	// console.log("Finished loading")
	const currentAmount = await dbank.checkBalance();
	this.document.getElementById("value").innerText =
		Math.round(currentAmount * 100) / 100;
});
 
document.querySelector("form").addEventListener("submit", async function (e) {
	e.preventDefault();

	const button = e.target.querySelector('#submit-btn');
	const inputElement = document.getElementById('input-amount');
	const outputElement = document.getElementById('withdrawal-amount')
	const inputAmount = parseFloat(inputElement.value);
	const outputAmount = parseFloat(outputElement.value);
	
	button.setAttribute('disabled', true);
	
	await dbank.topUp(inputAmount || 0);
	await dbank.withdraw(outputAmount|| 0);

	
	const currentAmount = await dbank.checkBalance();
	document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
	button.removeAttribute('disabled');
	inputElement.value = '';
	outputElement.value = '';
});

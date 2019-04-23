using System;

namespace ConsoleManager {
	public class RequestInput {
		private readonly string Message;
		public RequestInput(string pRequestMessage = "") {
			Message = pRequestMessage;
			if(String.IsNullOrEmpty(pRequestMessage)) {
				Message = "Input";
			}
		}

		public string Start() {
			Console.Write($"{Message} => ");
			return Console.ReadLine();
		}
	}
}

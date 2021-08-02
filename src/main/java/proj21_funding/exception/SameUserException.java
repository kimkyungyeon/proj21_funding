package proj21_funding.exception;

@SuppressWarnings("serial")
public class SameUserException extends RuntimeException {

	
	public SameUserException() {
		
	}

	public SameUserException(String message) {
		super(message);
	}

}

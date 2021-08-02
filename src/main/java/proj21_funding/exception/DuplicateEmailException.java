package proj21_funding.exception;

@SuppressWarnings("serial")
public class DuplicateEmailException extends RuntimeException {

	
	public DuplicateEmailException() {
		
	}

	public DuplicateEmailException(String message) {
		super(message);
	}

}

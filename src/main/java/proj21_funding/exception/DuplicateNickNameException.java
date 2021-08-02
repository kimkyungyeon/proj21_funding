package proj21_funding.exception;

@SuppressWarnings("serial")
public class DuplicateNickNameException extends RuntimeException {

	
	public DuplicateNickNameException() {
		
	}

	public DuplicateNickNameException(String message) {
		super(message);
	}

}

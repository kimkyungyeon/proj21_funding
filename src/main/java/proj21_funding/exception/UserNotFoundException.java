package proj21_funding.exception;

@SuppressWarnings("serial")
public class UserNotFoundException extends RuntimeException {

	public UserNotFoundException() {		
	}

	public UserNotFoundException(String arg0) {
		super(arg0);
	}

}

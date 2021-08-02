package proj21_funding.exception;

@SuppressWarnings("serial")
public class DateTimeOverException extends RuntimeException {

	public DateTimeOverException() {}

	public DateTimeOverException(String message) {
		super(message);
	}

}

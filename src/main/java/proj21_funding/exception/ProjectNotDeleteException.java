package proj21_funding.exception;

@SuppressWarnings("serial")
public class ProjectNotDeleteException extends RuntimeException {

	public ProjectNotDeleteException() {
	}

	public ProjectNotDeleteException(String message) {
		super("삭제할 프로젝트가 없습니다.");
	}
}

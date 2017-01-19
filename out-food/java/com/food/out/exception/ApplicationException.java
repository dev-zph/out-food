package com.food.out.exception;

public class ApplicationException extends RuntimeException {
	private static final long serialVersionUID = -1936158479822916234L;

	/**
     * 构造一个空的异常.
     */
    public ApplicationException() {
        super();
    }

    /**
     * 构造一个异常, 指明异常的详细信息.
     *
     * @param message 详细信息
     */
    public ApplicationException(String message) {
        super(message);
    }

    /**
     * 构造一个异常, 指明引起这个异常的起因.
     *
     * @param cause 异常的起因
     */
    public ApplicationException(Throwable cause) {
        super(cause);
    }

    /**
     * 构造一个异常, 指明引起这个异常的起因.
     *
     * @param message 详细信息
     * @param cause 异常的起因
     */
    public ApplicationException(String message, Throwable cause) {
        super(message, cause);
    }
}

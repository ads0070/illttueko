package com.illttueko.config;

import lombok.Getter;

@Getter
public enum BaseResponseStatus {
    /**
     * 1000 : 요청 성공
     */
    SUCCESS(true, 1000, "요청에 성공하였습니다."),


    /**
     * 2000 : Request 오류
     */
    // Common
    REQUEST_ERROR(false, 2000, "입력값을 확인해주세요."),
    EMPTY_JWT(false, 2001, "JWT를 입력해주세요."),
    INVALID_JWT(false, 2002, "유효하지 않은 JWT입니다."),
    INVALID_USER_JWT(false,2003,"권한이 없는 유저의 접근입니다."),

    // users
    USERS_EMPTY_USER_ID(false, 2010, "유저 아이디 값을 확인해주세요."),

    /**
     * 3000 : Response 오류
     */
    // Common
    RESPONSE_ERROR(false, 3000, "값을 불러오는데 실패하였습니다."),

    // [POST] /login
    FAILED_TO_LOGIN(false,3001,"없는 아이디거나 비밀번호가 틀렸습니다."),

    NO_LOOKUP_VALUE(false,3002,"조회된 데이터가 없습니다."),

    /**
     * 4000 : Database, Server 오류
     */
    DATABASE_ERROR(false, 4000, "데이터베이스 연결에 실패하였습니다."),
    SERVER_ERROR(false, 4001, "서버와의 연결에 실패하였습니다."),
    PASSWORD_ENCRYPTION_ERROR(false, 4011, "비밀번호 암호화에 실패하였습니다."),
    PASSWORD_DECRYPTION_ERROR(false, 4012, "비밀번호 복호화에 실패하였습니다."),
    FAILED_TO_UPDATE_NOTICE(false, 4013, "공지 변경에 실패하였습니다."),
    FAILED_TO_UPDATE_RULE(false, 4014, "규칙 변경에 실패하였습니다."),
    FAILED_TO_INSERT_RESERVATION(false, 4015, "예약에 실패하였습니다."),
    FAILED_TO_RETRIEVE_NOTICE(false, 4016, "공지 조회에 실패하였습니다."),
    FAILED_TO_RETRIEVE_STUDENT(false, 4017, "학생 조회에 실패하였습니다."),
    FAILED_TO_RETRIEVE_LAB(false, 4018, "실습실 조회에 실패하였습니다."),
    FAILED_TO_RETRIEVE_RESERVATION(false, 4019, "예약 현황 조회에 실패하였습니다.");


    // 5000 : 필요시 만들어서 쓰세요
    PERMISSION_DENY(false, 5000, "권한이 없습니다.");
    // 6000 : 필요시 만들어서 쓰세요


    private final boolean isSuccess;
    private final int code;
    private final String message;

    private BaseResponseStatus(boolean isSuccess, int code, String message) {
        this.isSuccess = isSuccess;
        this.code = code;
        this.message = message;
    }
}

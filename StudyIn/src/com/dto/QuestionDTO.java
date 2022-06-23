package com.dto;

public class QuestionDTO {
	private String question;
    private String questionImage;
    
	public QuestionDTO(String question, String questionImage) {
		super();
		this.question = question;
		this.questionImage = questionImage;
	}

	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionImage() {
		return questionImage;
	}
	public void setQuestionImage(String questionImage) {
		this.questionImage = questionImage;
	}
}

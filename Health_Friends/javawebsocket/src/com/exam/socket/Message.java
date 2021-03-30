package com.exam.socket;


public class Message {
    private String fromName;
	private String fromId;
	private String toId;
	private String content;
	
    public String getFromName() {
        return fromName;
    }
    public void setFromName(String fromName) {
        this.fromName = fromName;
    }
    public String getFromId() {
        return fromId;
    }
    public void setFromId(String fromId) {
        this.fromId = fromId;
    }
    public String getToId() {
        return toId;
    }
    public void setToId(String toId) {
        this.toId = toId;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    
    @Override
    public String toString() {
        return "Message [fromName=" + fromName + ", fromId=" + fromId + ", toId=" + toId + ", content=" + content + "]";
    }
}

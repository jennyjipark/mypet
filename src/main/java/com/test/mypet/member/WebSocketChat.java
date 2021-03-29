package com.test.mypet.member;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;




/**
 * 웹소켓 메소드 관리 클래스
 * @author 노푸른
 *
 */
@Controller
@ServerEndpoint(value="/member/echo.action")
public class WebSocketChat {
	
	/**
	 * 회원관련 db작업 전담 객체
	 */
	private IMemberDAO dao = SpringContext.getBean(MemberDAO.class);
	
	/**
	 * 세션을 저장하는 배열
	 */
	private static final List<Session> sessionList=new ArrayList<Session>();
	
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {

        System.out.println("웹소켓(서버) 객체생성");
        System.out.println("dao: " + (dao == null));
    }
    
    /**
     * 채팅 시작을 위해 웹소켓 연결하는 메소드
     * @param session 세션 객체
     */
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("마이펫 채팅에 연결 되었습니다.");
        }catch (Exception e) {

            System.out.println(e.getMessage());
        }
        sessionList.add(session);

        System.out.println("채팅연결직후");
//        System.out.println(((HttpSession) session).getAttribute("id").toString());
//        System.out.println(((HttpSession) session).getAttribute("seqUser").toString());
//        System.out.println(session.getId());
//        System.out.println();
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     */
    /**
     * 채팅 메시지를 모든 사용자에게 전송하는 메소드
     * @param self 채팅을 보낸사람이 본인인지 구분하는 변수
     * @param sender 채팅을 보낸 사람
     * @param message 메시지 내용을 저장하는 변수
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
        	for(Session session : WebSocketChat.sessionList) {
        		if((!self.getId().equals(session.getId())) && (!(self.getId().equals("Administrator1")))) {
        			//session.getBasicRemote().sendText(sender+" : "+message);
        			session.getBasicRemote().sendText("마이펫 "+message);
        		} else if ((!self.getId().equals(session.getId())) && (self.getId().equals("Administrator1"))) {
        			session.getBasicRemote().sendText("마이펫 "+message);
        		}
        		
        		
        		
        	}
        }catch (Exception e) {
        	
        	System.out.println(e.getMessage());
        }
    }
    

    /*
     * 내가 입력하는 메세지
     */
    /**
     * 본인이 입력한 메시지를 전송하는 메소드
     * @param message 메시지 내용
     * @param session 세션 객체
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String sender = message.split(",")[1]; //user_id
    	message = message.split(",")[0]; //메시지 내용
    	
    	//String seqUser = message.split(",")[2];

    	ChatMessageDTO dto = new ChatMessageDTO();
    	
    	//MemberDTO mdto = new MemberDTO();
    	//mdto.setSeqUser((String)sessions.getAttribute("seqUser"));
//      dao.addlist(dto); //이위치에 넣어봐도 채팅 종료됨!!
    	
    	System.out.println("보낸사람: " + sender);
    	//System.out.println("메시지: " + message);
    	//System.out.println(seqUser);
    	//System.out.println(dto.seqUser);
    
        //System.out.println(((ChatMessageDTO) session).getSeqUser());
    	
    	//ChatMessageDTO cdto = dao.checkUser(dto.seqUser);
    	//System.out.println(cdto.getSeqUser());
    	
    	dto.setContent(message);
    	System.out.println("메시지: " + dto.getContent().toString());
    	//dao.checkUser(sender);
        //System.out.println("seqUser: " + dao.checkUser(sender));
    	
    	//"content", message);
    	
        logger.info("Message From "+sender + ": "+message);
//        dao.addlist(dto); //이위치에 넣으면 채팅 종료됨!!
        
        try {
            final Basic basic=session.getBasicRemote();            
            basic.sendText(sender + "님 ");
            basic.sendText(message);
        }catch (Exception e) {
        	System.out.println("에러");
            System.out.println(e.getMessage());
        }
        
        
        //dao.addlist(dto); 포기해포기해아오못해ㅁ이러먀러댜ㅐㅓ
        System.out.println(dao==null);
        sendAllSessionToMessage(session, sender, message);       
        
//        int result = dao.addlist(dto);
//        System.out.println(result);
        
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    /**
     * 채팅 종료 메소드
     * @param session 세션 객체
     */
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }

}

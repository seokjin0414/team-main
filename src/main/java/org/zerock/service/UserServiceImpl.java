package org.zerock.service;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.CBFileMapper;
import org.zerock.mapper.CBoardMapper;
import org.zerock.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	 @Setter (onMethod_=@Autowired)
	 private CBoardMapper cboardmapper;
	 
	 @Setter (onMethod_=@Autowired)
	 private CBFileMapper filemapper;
	 
	 @Setter (onMethod_=@Autowired)
	 private CBoardService cboardService;
	
	//자바 메일 발송
	 @Setter (onMethod_=@Autowired)
	 private JavaMailSender emailSender;
	 
	@Override
	@Transactional
	public boolean insert(UserVO vo) {
		
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insert(vo);

		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_USER");
		mapper.insertAuth(avo);

		return cnt == 1;
	}
	
	
	//기업정보 추가 
	@Override
	public boolean insertB(UserVO vo) {
		
		
		// 패스워드 암호화
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.insertB(vo);

		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setUserid(vo.getUserid());
		avo.setAuth("ROLE_BUSINESS");
		mapper.insertAuth(avo);

		return cnt == 1;
	}
	


	@Override
	public UserVO read(String name) {
		
		return mapper.read(name);
	}
	
	
	
	
	
	@Override
	public boolean modify(UserVO vo) {
		
		int cnt = mapper.update(vo);
		return cnt == 1;
		
	}


	@Override
	public boolean modifyPassword(UserVO vo, String oldPassword) {
		
		UserVO userinfo = mapper.read(vo.getUserid());
		
		if (encoder.matches(oldPassword, userinfo.getUserpw())) {
			
			return modifyPw(vo);
		}
		
		
		return false;
	}
	
	
	@Override
	public boolean modifyPw(UserVO vo) {
		
		
		vo.setUserpw(encoder.encode(vo.getUserpw()));

		int cnt = mapper.modifyPassword(vo);

		return cnt == 1;
	}
	
	
	
	
	@Override
	public boolean remove(UserVO vo, String inputPassword) {
		
		UserVO userinfo = mapper.read(vo.getUserid());
		
		log.info(inputPassword);
		log.info(vo);
		if (encoder.matches(inputPassword, userinfo.getUserpw())) {
			return remove(vo);
		}

		return false;
	}

	
	//나중에 추가해야될내용 -> 게시글 삭제,댓글삭제 
	@Override
	public boolean remove(UserVO vo) {
		
		
		
		
		//회원 삭제 
		int cnt = mapper.remove(vo);
		return cnt ==1;
	}



	

	//아이디 찾기
	@Override
	public UserVO findId(UserVO vo) {
		return mapper.findId(vo);
		}


	//비밀번호 찾기
	@Override
	public UserVO findPw(UserVO vo) {	
		return mapper.findPw(vo);
	}


	//비밀번호 변경
	@Override
	public boolean updatePw(UserVO vo) {
		vo.setUserpw(encoder.encode(vo.getUserpw()));
		int cnt = mapper.updatePw(vo);
		return cnt == 1;
	}

	
	//임시 비밀번호 메일 발송
	@Override
	public void sendEmail(UserVO vo, String div) {
		
		String subject = "";
		String msg = "";

		if(div.equals("findpassword")) {
			MimeMessage mimeMessage = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
			
			subject = "고집 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUserpw() + "</p></div>";
			
			try {
				helper.setFrom("GoHome@official.com");
				helper.setTo(vo.getUserEmail()); 
				helper.setSubject(subject);
//				helper.setText(msg);
				mimeMessage.setContent(msg, "text/html; charset=utf-8");
	
				emailSender.send(mimeMessage);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}


	}


	@Override
	public void updatePoint(UserVO vo) {
		mapper.updatePoint(vo);
		
	}
	
	@Override
	public void updateSpendPoint(UserVO vo) {
		mapper.updateSpendPoint(vo);
		
	}
	
}
